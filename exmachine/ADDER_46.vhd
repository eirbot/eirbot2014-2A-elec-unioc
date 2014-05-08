--   _______    __    ______     ______     _____    ________
--  |   ____|  |  |  |   _  \   |   _  \   / __  \  |___  ___|
--  |  |____   |  |  |  |_|  |  |  |_| /  | |  | |     |  |
--  |   ____|  |  |  |       |  |   _  \  | |  | |     |  |
--  |  |____   |  |  |  |\  \   |  |_| |  | |__| |     |  |
--  |_______|  |__|  |__| \__\  |______/   \_____/     |__|
--
-- Module: ADDER_48
-- But: Parce que le tipe Entier support que 32 bit (en fait 31...)
--
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity ADDER_46 is Port ( 
	A    : IN  STD_LOGIC_VECTOR (45 downto 0);
	B    : IN  STD_LOGIC_VECTOR (45 downto 0);
	C    : OUT STD_LOGIC_VECTOR (45 downto 0);
	COUT : OUT STD_LOGIC;
	CIN  : IN  STD_LOGIC
);
end ADDER_46;
architecture Behavioral of ADDER_46 is
signal Carry: STD_LOGIC_VECTOR (46 downto 0); 
begin
Carry(0) <= CIN;
COUT <= Carry(46);
Carry(46 downto 1) <= (A and B)or(Carry(45 downto 0) and (A or B));
C <= (A xor B)xor Carry(45 downto 0);
end Behavioral;