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

entity COUNTEUR_XYR_HIRES is Port ( 
	CODEUR1 : IN  STD_LOGIC_VECTOR (1  downto 0);
	CODEUR2 : IN  STD_LOGIC_VECTOR (1  downto 0);
	RELATION: IN  STD_LOGIC_VECTOR (23 downto 0);
	POSX    : OUT STD_LOGIC_VECTOR (31 downto 0);
	POSY    : OUT STD_LOGIC_VECTOR (31 downto 0);
	ROT     : OUT STD_LOGIC_VECTOR (15 downto 0);  --0-360 degrees+7 bits
	RESET_X : IN  STD_LOGIC_VECTOR (31 downto 0);
	RESET_Y : IN  STD_LOGIC_VECTOR (31 downto 0);
	RESET_R : IN  STD_LOGIC_VECTOR (15 downto 0);
	RESET   : IN  STD_LOGIC;
	H       : IN  STD_LOGIC
);
end COUNTEUR_XYR_HIRES;

architecture Behavioral of COUNTEUR_XYR_HIRES is
--signal intPosX : Integer; --pas (32 bit) * 14 bits => 46 bits
--signal intPosY : Integer; --pas (32 bit) * 14 bits => 46 bits
signal buffPosX : std_logic_vector(45 downto 0); 
signal buffPosY : std_logic_vector(45 downto 0); 
signal buffRot :  std_logic_vector(31 downto 0); 
signal subDecRot,  subIncRot  : std_logic_vector(31 downto 0);
signal nextDecRot, nextIncRot : std_logic_vector(31 downto 0);
signal nextDecX,   nextIncX   : std_logic_vector(45 downto 0);
signal nextDecY,   nextIncY   : std_logic_vector(45 downto 0);
--signal lastCod1, lastCod2: std_logic_vector(1 downto 0);
signal SINUS, COSINUS: STD_LOGIC_VECTOR(15 downto 0);

component TABLE_SINUS is Port (  
	H       : in  STD_LOGIC;
	ANGLE   : in  STD_LOGIC_VECTOR(15 downto 0);
	SINUS   : out STD_LOGIC_VECTOR(15 downto 0);
	COSINUS : out STD_LOGIC_VECTOR(15 downto 0)
);
end component;
component ADDER_46 is Port ( 
	A    : IN  STD_LOGIC_VECTOR (45 downto 0);
	B    : IN  STD_LOGIC_VECTOR (45 downto 0);
	C    : OUT STD_LOGIC_VECTOR (45 downto 0);
	COUT : OUT STD_LOGIC;
	CIN  : IN  STD_LOGIC
);
end component;
begin
	POSX <= buffPosX(45 downto 14);
	POSY <= buffPosY(45 downto 14);
	ROT  <=  buffRot(30 downto 15);
	subDecRot <= STD_LOGIC_VECTOR(UNSIGNED(buffRot)-resize(UNSIGNED(RELATION),32));
	subIncRot <= STD_LOGIC_VECTOR(UNSIGNED(buffRot)+resize(UNSIGNED(RELATION),32));
	
	--subDecRot <= buffRot + RELATION;--STD_LOGIC_VECTOR(TO_UNSIGNED(TO_INTEGER(UNSIGNED(buffRot)) - TO_INTEGER(UNSIGNED(RELATION)),32));
	--subIncRot <= STD_LOGIC_VECTOR(TO_UNSIGNED(TO_INTEGER(UNSIGNED(buffRot)) + TO_INTEGER(UNSIGNED(RELATION)),32));
	nextIncRot(23 downto 0) <= subIncRot(23 downto 0);
	nextDecRot(23 downto 0) <= subDecRot(23 downto 0);
	async : process(subIncRot, subDecRot)
	begin
		if(subIncRot(31 downto 24)=x"5A")then
			nextIncRot(31 downto 24) <= x"00";
		else
			nextIncRot(31 downto 24) <= subIncRot(31 downto 24);
		end if;
		if(subDecRot(30 downto 24)="1111111")then
			nextDecRot(31 downto 24) <= x"59";
		else
			nextDecRot(31 downto 24) <= subDecRot(31 downto 24);
		end if;	
	end process;
	sin:TABLE_SINUS PORT MAP(
		H => H,
		ANGLE => buffRot(30 downto 15),
		SINUS => SINUS,
		COSINUS => COSINUS
	);
	addx: ADDER_46 PORT MAP ( 
		A    =>buffPosX,
		B    =>("0000000000000000000000000000000"&COSINUS(14 downto 0)),
		C    =>nextIncX,
		COUT =>open,
		CIN  =>'0'
	);
	subx: ADDER_46 PORT MAP ( 
		A    =>buffPosX,
		B    =>not("0000000000000000000000000000000"&COSINUS(14 downto 0)),
		C    =>nextDecX,
		COUT =>open,
		CIN  =>'1'
	);
	--------------------------------------------------------	
	addy: ADDER_46 PORT MAP ( 
		A    =>buffPosY,
		B    =>("0000000000000000000000000000000"&SINUS(14 downto 0)),
		C    =>nextIncY,
		COUT =>open,
		CIN  =>'0'
	);
	suby: ADDER_46 PORT MAP ( 
		A    =>buffPosY,
		B    =>not("0000000000000000000000000000000"&SINUS(14 downto 0)),
		C    =>nextDecY,
		COUT =>open,
		CIN  =>'1'
	);
	onHorloge : process (H)
	begin
		if(H'event and H='1')then
			if(RESET='1')then
				buffPosX <= RESET_X & "00000000000000";
				buffPosY <= RESET_Y & "00000000000000";
				buffRot  <= RESET_R & "0000000000000000";
			else
				if(CODEUR1(0)='1')then
					buffRot <= nextIncRot;
					if(COSINUS(15)='0')then --cosinus>0
						buffPosX <= nextIncX;
					else
						buffPosX <= nextDecX;
					end if;
					if(SINUS(15)='0')then
						buffPosY <= nextDecY;
					else
						buffPosY <= nextIncY;
					end if;
				elsif(CODEUR1(1)='1')then
					buffRot <= nextDecRot;
					if(COSINUS(15)='0')then --cosinus>0
						buffPosX <= nextDecX;
					else
						buffPosX <= nextIncX;
					end if;
					if(SINUS(15)='0')then
						buffPosY <= nextIncY;
					else
						buffPosY <= nextDecY;
					end if;
				elsif(CODEUR2(0)='1')then
					buffRot <= nextIncRot;
					if(COSINUS(15)='0')then --cosinus>0
						buffPosX <= nextDecX;
					else
						buffPosX <= nextIncX;
					end if;
					if(SINUS(15)='0')then
						buffPosY <= nextIncY;
					else
						buffPosY <= nextDecY;
					end if;
				elsif(CODEUR2(1)='1')then
					buffRot <= nextDecRot;
					if(COSINUS(15)='0')then --cosinus>0
						buffPosX <= nextIncX;
					else
						buffPosX <= nextDecX;
					end if;
					if(SINUS(15)='0')then
						buffPosY <= nextDecY;
					else
						buffPosY <= nextIncY;
					end if;
				end if;
			end if;
		end if;
	end process;
end Behavioral;

