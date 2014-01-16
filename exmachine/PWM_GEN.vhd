--   _______    __    ______     ______     _____    ________
--  |   ____|  |  |  |   _  \   |   _  \   / __  \  |___  ___|
--  |  |____   |  |  |  |_|  |  |  |_| /  | |  | |     |  |
--  |   ____|  |  |  |       |  |   _  \  | |  | |     |  |
--  |  |____   |  |  |  |\  \   |  |_| |  | |__| |     |  |
--  |_______|  |__|  |__| \__\  |______/   \_____/     |__|
--
-- Module: PWM_GEN
-- But: Gerer jus'que à 4 moteurs DC, avec uns precision de 7 bits plus direction
--
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity PWM_GEN is Port ( H : in  STD_LOGIC;
	RESET : in  STD_LOGIC;
	VAL1 : in  STD_LOGIC_VECTOR (7 downto 0);
	VAL2 : in  STD_LOGIC_VECTOR (7 downto 0);
	PWM1 : out STD_LOGIC_VECTOR (1 downto 0);
	PWM2 : out STD_LOGIC_VECTOR (1 downto 0)
);
end PWM_GEN;

architecture Behavioral of PWM_GEN is
CONSTANT H_FREQ : Integer := 50000000;
CONSTANT MOTEUR_FREQ : Integer := 30000*128;
SIGNAL compteur, diviseur: INTEGER;
SIGNAL int1, int2: INTEGER;
SIGNAL mod1, mod2: STD_LOGIC_VECTOR(6 downto 0);
SIGNAL copy : STD_LOGIC_VECTOR(15 downto 0);
begin
	asyncrone: process(copy, mod1, mod2)
	begin
		if(copy(7)='0')then
			mod1 <= copy(6 downto 0);
		else
			mod1 <= not copy(6 downto 0);
		end if;
		if(copy(15)='0')then
			mod2 <= copy(14 downto 8);
		else
			mod2 <= not copy(14 downto 8);
		end if;
		int1 <= TO_INTEGER(UNSIGNED(mod1(6 downto 0)));
		int2 <= TO_INTEGER(UNSIGNED(mod2(6 downto 0)));
		PWM1(1) <= copy(7);
		PWM2(1) <= copy(15);
	end process;
	sincrone : process (H)
	begin
		if(H'event and H='1')then
			if(RESET = '1')then
				compteur <= 0;
				diviseur <= 0;
				PWM1(0) <= '0';
				PWM2(0) <= '0';
				copy <= VAL1 & VAL2;
			else
				if(diviseur = (H_FREQ/MOTEUR_FREQ))then
					diviseur <= 0;
					if(compteur = 127) then
						compteur <= 0;
						copy <= VAL2 & VAL1;
					else
						compteur <= compteur + 1;
					end if;
					if(compteur=int1)then
						PWM1(0) <= '0';
					elsif(compteur=0)then
						PWM1(0) <= '1';
					end if;
					if(compteur = int2)then
						PWM2(0) <= '0';
					elsif(compteur=0)then
						PWM2(0) <= '1';
					end if;
				else
					diviseur <= diviseur + 1;
				end if;
			end if;
		end if;
	end process;					
end Behavioral;
