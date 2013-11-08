--   _______    __    ______     ______     _____    ________
--  |   ____|  |  |  |   _  \   |   _  \   / __  \  |___  ___|
--  |  |____   |  |  |  |_|  |  |  |_| /  | |  | |     |  |
--  |   ____|  |  |  |       |  |   _  \  | |  | |     |  |
--  |  |____   |  |  |  |\  \   |  |_| |  | |__| |     |  |
--  |_______|  |__|  |__| \__\  |______/   \_____/     |__|
--
-- Module: CONTEUR_XYR
-- But: À partir des signals du COUNTER_ROTATIF, determiner la position X, Y et la 
-- rotation, relatives à position du reset.
--


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity COUNTEUR_XYR is
    Port ( 
          CODEUR1 : IN STD_LOGIC_VECTOR (1  downto 0);
          CODEUR2 : IN STD_LOGIC_VECTOR (1  downto 0);
			 RELATION: IN STD_LOGIC_VECTOR (15 downto 0);
          POSX    : OUT STD_LOGIC_VECTOR (31 downto 0);
          POSY    : OUT STD_LOGIC_VECTOR (31 downto 0);
          ROT     : OUT STD_LOGIC_VECTOR (8 downto 0);  --0-360 degrees
          RESET   : IN STD_LOGIC;
			 H       : IN STD_LOGIC
    );
end COUNTEUR_XYR;

architecture Behavioral of COUNTEUR_XYR is
type tableSinus is array (0 to 359) of STD_LOGIC_VECTOR (11 downto 0);
signal COSINUS : tableSinus := (
	X"400", X"400", X"3FF", X"3FF", X"3FE", X"3FC", X"3FA", X"3F8", X"3F6", X"3F3", 
	X"3F0", X"3ED", X"3EA", X"3E6", X"3E2", X"3DD", X"3D8", X"3D3", X"3CE", X"3C8", 
	X"3C2", X"3BC", X"3B5", X"3AF", X"3A7", X"3A0", X"398", X"390", X"388", X"380", 
	X"377", X"36E", X"364", X"35B", X"351", X"347", X"33C", X"332", X"327", X"31C", 
	X"310", X"305", X"2F9", X"2ED", X"2E1", X"2D4", X"2C7", X"2BA", X"2AD", X"2A0", 
	X"292", X"284", X"276", X"268", X"25A", X"24B", X"23D", X"22E", X"21F", X"20F", 
	X"200", X"1F0", X"1E1", X"1D1", X"1C1", X"1B1", X"1A0", X"190", X"180", X"16F", 
	X"15E", X"14D", X"13C", X"12B", X"11A", X"109", X"0F8", X"0E6", X"0D5", X"0C3", 
	X"0B2", X"0A0", X"08F", X"07D", X"06B", X"059", X"047", X"036", X"024", X"012", 
	X"000", X"012", X"024", X"036", X"047", X"059", X"06B", X"07D", X"08F", X"0A0", --negative
	X"0B2", X"0C3", X"0D5", X"0E6", X"0F8", X"109", X"11A", X"12B", X"13C", X"14D", --negative
	X"15E", X"16F", X"180", X"190", X"1A0", X"1B1", X"1C1", X"1D1", X"1E1", X"1F0", --negative
	X"200", X"20F", X"21F", X"22E", X"23D", X"24B", X"25A", X"268", X"276", X"284", --negative
	X"292", X"2A0", X"2AD", X"2BA", X"2C7", X"2D4", X"2E1", X"2ED", X"2F9", X"305", --negative
	X"310", X"31C", X"327", X"332", X"33C", X"347", X"351", X"35B", X"364", X"36E", --negative
	X"377", X"380", X"388", X"390", X"398", X"3A0", X"3A7", X"3AF", X"3B5", X"3BC", --negative
	X"3C2", X"3C8", X"3CE", X"3D3", X"3D8", X"3DD", X"3E2", X"3E6", X"3EA", X"3ED", --negative
	X"3F0", X"3F3", X"3F6", X"3F8", X"3FA", X"3FC", X"3FE", X"3FF", X"3FF", X"400", --negative
	X"400", X"400", X"3FF", X"3FF", X"3FE", X"3FC", X"3FA", X"3F8", X"3F6", X"3F3", --negative
	X"3F0", X"3ED", X"3EA", X"3E6", X"3E2", X"3DD", X"3D8", X"3D3", X"3CE", X"3C8", --negative
	X"3C2", X"3BC", X"3B5", X"3AF", X"3A7", X"3A0", X"398", X"390", X"388", X"380", --negative
	X"377", X"36E", X"364", X"35B", X"351", X"347", X"33C", X"332", X"327", X"31C", --negative
	X"310", X"305", X"2F9", X"2ED", X"2E1", X"2D4", X"2C7", X"2BA", X"2AD", X"2A0", --negative
	X"292", X"284", X"276", X"268", X"25A", X"24B", X"23D", X"22E", X"21F", X"20F", --negative
	X"200", X"1F0", X"1E1", X"1D1", X"1C1", X"1B1", X"1A0", X"190", X"180", X"16F", --negative
	X"15E", X"14D", X"13C", X"12B", X"11A", X"109", X"0F8", X"0E6", X"0D5", X"0C3", --negative
	X"0B2", X"0A0", X"08F", X"07D", X"06B", X"059", X"047", X"036", X"024", X"012", --negative
	X"000", X"012", X"024", X"036", X"047", X"059", X"06B", X"07D", X"08F", X"0A0", 
	X"0B2", X"0C3", X"0D5", X"0E6", X"0F8", X"109", X"11A", X"12B", X"13C", X"14D", 
	X"15E", X"16F", X"180", X"190", X"1A0", X"1B1", X"1C1", X"1D1", X"1E1", X"1F0", 
	X"200", X"20F", X"21F", X"22E", X"23D", X"24B", X"25A", X"268", X"276", X"284", 
	X"292", X"2A0", X"2AD", X"2BA", X"2C7", X"2D4", X"2E1", X"2ED", X"2F9", X"305", 
	X"310", X"31C", X"327", X"332", X"33C", X"347", X"351", X"35B", X"364", X"36E", 
	X"377", X"380", X"388", X"390", X"398", X"3A0", X"3A7", X"3AF", X"3B5", X"3BC", 
	X"3C2", X"3C8", X"3CE", X"3D3", X"3D8", X"3DD", X"3E2", X"3E6", X"3EA", X"3ED", 
	X"3F0", X"3F3", X"3F6", X"3F8", X"3FA", X"3FC", X"3FE", X"3FF", X"3FF", X"400"
);
signal SINUS : tableSinus := (
	X"000", X"012", X"024", X"036", X"047", X"059", X"06B", X"07D", X"08F", X"0A0", 
	X"0B2", X"0C3", X"0D5", X"0E6", X"0F8", X"109", X"11A", X"12B", X"13C", X"14D", 
	X"15E", X"16F", X"180", X"190", X"1A0", X"1B1", X"1C1", X"1D1", X"1E1", X"1F0", 
	X"200", X"20F", X"21F", X"22E", X"23D", X"24B", X"25A", X"268", X"276", X"284", 
	X"292", X"2A0", X"2AD", X"2BA", X"2C7", X"2D4", X"2E1", X"2ED", X"2F9", X"305", 
	X"310", X"31C", X"327", X"332", X"33C", X"347", X"351", X"35B", X"364", X"36E", 
	X"377", X"380", X"388", X"390", X"398", X"3A0", X"3A7", X"3AF", X"3B5", X"3BC", 
	X"3C2", X"3C8", X"3CE", X"3D3", X"3D8", X"3DD", X"3E2", X"3E6", X"3EA", X"3ED", 
	X"3F0", X"3F3", X"3F6", X"3F8", X"3FA", X"3FC", X"3FE", X"3FF", X"3FF", X"400",
	X"400", X"400", X"3FF", X"3FF", X"3FE", X"3FC", X"3FA", X"3F8", X"3F6", X"3F3", 
	X"3F0", X"3ED", X"3EA", X"3E6", X"3E2", X"3DD", X"3D8", X"3D3", X"3CE", X"3C8", 
	X"3C2", X"3BC", X"3B5", X"3AF", X"3A7", X"3A0", X"398", X"390", X"388", X"380", 
	X"377", X"36E", X"364", X"35B", X"351", X"347", X"33C", X"332", X"327", X"31C", 
	X"310", X"305", X"2F9", X"2ED", X"2E1", X"2D4", X"2C7", X"2BA", X"2AD", X"2A0", 
	X"292", X"284", X"276", X"268", X"25A", X"24B", X"23D", X"22E", X"21F", X"20F", 
	X"200", X"1F0", X"1E1", X"1D1", X"1C1", X"1B1", X"1A0", X"190", X"180", X"16F", 
	X"15E", X"14D", X"13C", X"12B", X"11A", X"109", X"0F8", X"0E6", X"0D5", X"0C3", 
	X"0B2", X"0A0", X"08F", X"07D", X"06B", X"059", X"047", X"036", X"024", X"012", 
	X"000", X"012", X"024", X"036", X"047", X"059", X"06B", X"07D", X"08F", X"0A0", --negative
	X"0B2", X"0C3", X"0D5", X"0E6", X"0F8", X"109", X"11A", X"12B", X"13C", X"14D", --negative
	X"15E", X"16F", X"180", X"190", X"1A0", X"1B1", X"1C1", X"1D1", X"1E1", X"1F0", --negative
	X"200", X"20F", X"21F", X"22E", X"23D", X"24B", X"25A", X"268", X"276", X"284", --negative
	X"292", X"2A0", X"2AD", X"2BA", X"2C7", X"2D4", X"2E1", X"2ED", X"2F9", X"305", --negative
	X"310", X"31C", X"327", X"332", X"33C", X"347", X"351", X"35B", X"364", X"36E", --negative
	X"377", X"380", X"388", X"390", X"398", X"3A0", X"3A7", X"3AF", X"3B5", X"3BC", --negative
	X"3C2", X"3C8", X"3CE", X"3D3", X"3D8", X"3DD", X"3E2", X"3E6", X"3EA", X"3ED", --negative
	X"3F0", X"3F3", X"3F6", X"3F8", X"3FA", X"3FC", X"3FE", X"3FF", X"3FF", X"400", --negative
	X"400", X"400", X"3FF", X"3FF", X"3FE", X"3FC", X"3FA", X"3F8", X"3F6", X"3F3", --negative
	X"3F0", X"3ED", X"3EA", X"3E6", X"3E2", X"3DD", X"3D8", X"3D3", X"3CE", X"3C8", --negative
	X"3C2", X"3BC", X"3B5", X"3AF", X"3A7", X"3A0", X"398", X"390", X"388", X"380", --negative
	X"377", X"36E", X"364", X"35B", X"351", X"347", X"33C", X"332", X"327", X"31C", --negative
	X"310", X"305", X"2F9", X"2ED", X"2E1", X"2D4", X"2C7", X"2BA", X"2AD", X"2A0", --negative
	X"292", X"284", X"276", X"268", X"25A", X"24B", X"23D", X"22E", X"21F", X"20F", --negative
	X"200", X"1F0", X"1E1", X"1D1", X"1C1", X"1B1", X"1A0", X"190", X"180", X"16F", --negative
	X"15E", X"14D", X"13C", X"12B", X"11A", X"109", X"0F8", X"0E6", X"0D5", X"0C3", --negative
	X"0B2", X"0A0", X"08F", X"07D", X"06B", X"059", X"047", X"036", X"024", X"012"  --negative
);
signal intRot : Integer; --degrees (9 bit) * 65536 (16) => 25 bits
signal intPosX : Integer; --pas (22 bit) * 10 bits => 32 bits
signal intPosY : Integer; --pas (22 bit) * 10 bits => 32 bits
signal buffPosX : std_logic_vector(41 downto 0); 
signal buffPosY : std_logic_vector(41 downto 0); 
signal buffRot :  std_logic_vector(24 downto 0); 
signal lastCod1, lastCod2: std_logic_vector(1 downto 0);
signal internalRot: Integer;
begin
  POSX <= buffPosX(41 downto 10);
  POSY <= buffPosY(41 downto 10);
  ROT  <=  buffRot(24 downto 16);
  internalRot <= TO_INTEGER(UNSIGNED(buffRot(24 downto 16)));
  
  buffPosX <= std_logic_vector(to_unsigned(intPosX,42));
  buffPosY <= std_logic_vector(to_unsigned(intPosY,42));
  buffRot  <= std_logic_vector(to_unsigned(intRot,25)) ;
  
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
						if( (internalRot<90) or (internalRot>270))then
							intPosX <= intPosX + TO_INTEGER(UNSIGNED(COSINUS(internalRot)));
						else
							intPosX <= intPosX - TO_INTEGER(UNSIGNED(COSINUS(internalRot)));
						end if;
						if(internalRot<180)then
							intPosY <= intPosY - TO_INTEGER(UNSIGNED(SINUS(internalRot)));
						else
							intPosY <= intPosY + TO_INTEGER(UNSIGNED(SINUS(internalRot)));
						end if;
					end if;
					lastCod1(0) <= CODEUR1(0);
				elsif(lastCod1(1)/= CODEUR1(1))then
					if(CODEUR1(1)='1')then
						intRot <= intRot - TO_INTEGER(UNSIGNED(RELATION));
						
						if( (internalRot<90) or (internalRot>270))then
							intPosX <= intPosX - TO_INTEGER(UNSIGNED(COSINUS(internalRot)));
						else
							intPosX <= intPosX + TO_INTEGER(UNSIGNED(COSINUS(internalRot)));
						end if;
						if(internalRot<180)then
							intPosY <= intPosY + TO_INTEGER(UNSIGNED(SINUS(internalRot)));
						else
							intPosY <= intPosY - TO_INTEGER(UNSIGNED(SINUS(internalRot)));
						end if;
						
					end if;
					lastCod1(1) <= CODEUR1(1);
				elsif(lastCod2(0)/= CODEUR2(0))then
					if(CODEUR2(0)='1')then
						intRot <= intRot + TO_INTEGER(UNSIGNED(RELATION));
						
						
						
						if( (internalRot<90) or (internalRot>270))then
							intPosX <= intPosX - TO_INTEGER(UNSIGNED(COSINUS(internalRot)));
						else
							intPosX <= intPosX + TO_INTEGER(UNSIGNED(COSINUS(internalRot)));
						end if;
						if(internalRot<180)then
							intPosY <= intPosY + TO_INTEGER(UNSIGNED(SINUS(internalRot)));
						else
							intPosY <= intPosY - TO_INTEGER(UNSIGNED(SINUS(internalRot)));
						end if;
						
					end if;
					lastCod2(0) <= CODEUR2(0);
				elsif(lastCod2(1)/= CODEUR2(1))then
					if(CODEUR2(1)='1')then
						intRot <= intRot - TO_INTEGER(UNSIGNED(RELATION));
						
						
						if( (internalRot<90) or (internalRot>270))then
							intPosX <= intPosX + TO_INTEGER(UNSIGNED(COSINUS(internalRot)));
						else
							intPosX <= intPosX - TO_INTEGER(UNSIGNED(COSINUS(internalRot)));
						end if;
						if(internalRot<180)then
							intPosY <= intPosY - TO_INTEGER(UNSIGNED(SINUS(internalRot)));
						else
							intPosY <= intPosY + TO_INTEGER(UNSIGNED(SINUS(internalRot)));
						end if;
						
						
					end if;
					lastCod2(1) <= CODEUR2(1);
				else
					if(intRot<0)then intRot <= intRot + 360*256*256;
					elsif(intRot>=360*256*256)then intRot <= intRot - 360*256*256;  end if;
				end if;
			end if;
		end if;
	end process;					
end Behavioral;

