--   _______    __    ______     ______     _____    ________
--  |   ____|  |  |  |   _  \   |   _  \   / __  \  |___  ___|
--  |  |____   |  |  |  |_|  |  |  |_| /  | |  | |     |  |
--  |   ____|  |  |  |       |  |   _  \  | |  | |     |  |
--  |  |____   |  |  |  |\  \   |  |_| |  | |__| |     |  |
--  |_______|  |__|  |__| \__\  |______/   \_____/     |__|
--
-- Module: CONTEUR_XYR_HIRES
-- But: À partir des signals du COUNTER_ROTATIF, determiner la position X, Y et la 
-- rotation, relatives à position du reset. HIRES -> HIgh RESolution
--


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity COUNTEUR_XYR_HIRES is
    Port ( 
          CODEUR1 : IN STD_LOGIC_VECTOR (1  downto 0);
          CODEUR2 : IN STD_LOGIC_VECTOR (1  downto 0);
			 RELATION: IN STD_LOGIC_VECTOR (23 downto 0);
          POSX    : OUT STD_LOGIC_VECTOR (31 downto 0);
          POSY    : OUT STD_LOGIC_VECTOR (31 downto 0);
          ROT     : OUT STD_LOGIC_VECTOR (15 downto 0);  --0-360 degrees+7 bits
          RESET   : IN STD_LOGIC;
			 H       : IN STD_LOGIC
    );
end COUNTEUR_XYR_HIRES;

architecture Behavioral of COUNTEUR_XYR_HIRES is
signal intRot : Integer; --degrees (9 bit) * (23) => 32 bits
signal intPosX : Integer; --pas (32 bit) * 14 bits => 46 bits
signal intPosY : Integer; --pas (32 bit) * 14 bits => 46 bits
signal buffPosX : std_logic_vector(46 downto 0); 
signal buffPosY : std_logic_vector(46 downto 0); 
signal buffRot :  std_logic_vector(31 downto 0); 
signal lastCod1, lastCod2: std_logic_vector(1 downto 0);
signal SINUS, COSINUS: STD_LOGIC_VECTOR(15 downto 0);

component TABLE_SINUS is Port (  
	H       : in  STD_LOGIC;
	ANGLE   : in  STD_LOGIC_VECTOR(15 downto 0);
	SINUS   : out STD_LOGIC_VECTOR(15 downto 0);
	COSINUS : out STD_LOGIC_VECTOR(15 downto 0)
);
end component;
begin
  POSX <= buffPosX(46 downto 15);
  POSY <= buffPosY(46 downto 15);
  ROT  <=  buffRot(31 downto 16);
  
  buffPosX <= std_logic_vector(to_unsigned(intPosX,47));
  buffPosY <= std_logic_vector(to_unsigned(intPosY,47));
  buffRot  <= std_logic_vector(to_unsigned(intRot,32)) ;
  
	sin:TABLE_SINUS PORT MAP(
		H => H,
		ANGLE => buffRot(31 downto 16),
		SINUS => SINUS,
		COSINUS => COSINUS
	);
  
  onHorloge : process (H)
  begin
		if(H'event and H='1')then
			if(RESET='1')then
				intPosX<=0;
				intPosY<=0;
				intRot <=0;
				lastCod1 <= CODEUR1;
				lastCod2 <= CODEUR2;
			else
				
				if(lastCod1(0)/= CODEUR1(0))then
					if(CODEUR1(0)='1')then
						intRot <= intRot + TO_INTEGER(UNSIGNED(RELATION));
						if(COSINUS(15)='0')then --cosinus>0
							intPosX <= intPosX + TO_INTEGER(UNSIGNED(COSINUS(14 downto 0)));
						else
							intPosX <= intPosX - TO_INTEGER(UNSIGNED(COSINUS(14 downto 0)));
						end if;
						if(SINUS(15)='0')then
							intPosY <= intPosY - TO_INTEGER(UNSIGNED(SINUS(14 downto 0)));
						else
							intPosY <= intPosY + TO_INTEGER(UNSIGNED(SINUS(14 downto 0)));
						end if;
					end if;
					lastCod1(0) <= CODEUR1(0);
				elsif(lastCod1(1)/= CODEUR1(1))then
					if(CODEUR1(1)='1')then
						intRot <= intRot - TO_INTEGER(UNSIGNED(RELATION));
						if(COSINUS(15)='0')then --cosinus>0
							intPosX <= intPosX - TO_INTEGER(UNSIGNED(COSINUS(14 downto 0)));
						else
							intPosX <= intPosX + TO_INTEGER(UNSIGNED(COSINUS(14 downto 0)));
						end if;
						if(SINUS(15)='0')then
							intPosY <= intPosY + TO_INTEGER(UNSIGNED(SINUS(14 downto 0)));
						else
							intPosY <= intPosY - TO_INTEGER(UNSIGNED(SINUS(14 downto 0)));
						end if;
					end if;
					lastCod1(1) <= CODEUR1(1);
				elsif(lastCod2(0)/= CODEUR2(0))then
					if(CODEUR2(0)='1')then
						intRot <= intRot + TO_INTEGER(UNSIGNED(RELATION));
						if(COSINUS(15)='0')then --cosinus>0, mais ici on subtraient
							intPosX <= intPosX - TO_INTEGER(UNSIGNED(COSINUS(14 downto 0)));
						else
							intPosX <= intPosX + TO_INTEGER(UNSIGNED(COSINUS(14 downto 0)));
						end if;
						if(SINUS(15)='0')then
							intPosY <= intPosY + TO_INTEGER(UNSIGNED(SINUS(14 downto 0)));
						else
							intPosY <= intPosY - TO_INTEGER(UNSIGNED(SINUS(14 downto 0)));
						end if;
					end if;
					lastCod2(0) <= CODEUR2(0);
				elsif(lastCod2(1)/= CODEUR2(1))then
					if(CODEUR2(1)='1')then
						intRot <= intRot - TO_INTEGER(UNSIGNED(RELATION));
						if(COSINUS(15)='0')then --cosinus>0
							intPosX <= intPosX + TO_INTEGER(UNSIGNED(COSINUS(14 downto 0)));
						else
							intPosX <= intPosX - TO_INTEGER(UNSIGNED(COSINUS(14 downto 0)));
						end if;
						if(SINUS(15)='0')then
							intPosY <= intPosY - TO_INTEGER(UNSIGNED(SINUS(14 downto 0)));
						else
							intPosY <= intPosY + TO_INTEGER(UNSIGNED(SINUS(14 downto 0)));
						end if;
					end if;
					lastCod2(1) <= CODEUR2(1);
				else
					if(intRot<0)then intRot <= intRot + 360*256*256*128;
					elsif(intRot>=360*256*256*128)then intRot <= intRot - 360*256*256*128;  end if;
				end if;
			end if;
		end if;
	end process;
end Behavioral;

