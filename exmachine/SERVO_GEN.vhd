--   _______    __    ______     ______     _____    ________
--  |   ____|  |  |  |   _  \   |   _  \   / __  \  |___  ___|
--  |  |____   |  |  |  |_|  |  |  |_| /  | |  | |     |  |
--  |   ____|  |  |  |       |  |   _  \  | |  | |     |  |
--  |  |____   |  |  |  |\  \   |  |_| |  | |__| |     |  |
--  |_______|  |__|  |__| \__\  |______/   \_____/     |__|
--
-- Module: SERVO_GEN
-- But: Gerer jus'que à 16 servo-moteurs, avec une precision de 8 bits
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity SERVO_GEN is Port ( 
	H     : in  STD_LOGIC;
	RESET : in  STD_LOGIC;
	VAL0  : in  STD_LOGIC_VECTOR (15 downto 0);
	VAL1  : in  STD_LOGIC_VECTOR (15 downto 0);
	VAL2  : in  STD_LOGIC_VECTOR (15 downto 0);
	VAL3  : in  STD_LOGIC_VECTOR (15 downto 0);
	VAL4  : in  STD_LOGIC_VECTOR (15 downto 0);
	VAL5  : in  STD_LOGIC_VECTOR (15 downto 0);
	VAL6  : in  STD_LOGIC_VECTOR (15 downto 0);
	VAL7  : in  STD_LOGIC_VECTOR (15 downto 0);
	VAL8  : in  STD_LOGIC_VECTOR (15 downto 0);
	VAL9  : in  STD_LOGIC_VECTOR (15 downto 0);
	VAL10 : in  STD_LOGIC_VECTOR (15 downto 0);
	VAL11 : in  STD_LOGIC_VECTOR (15 downto 0);
	VAL12 : in  STD_LOGIC_VECTOR (15 downto 0);
	VAL13 : in  STD_LOGIC_VECTOR (15 downto 0);
	VAL14 : in  STD_LOGIC_VECTOR (15 downto 0);
	VAL15 : in  STD_LOGIC_VECTOR (15 downto 0);
	PWM   : out STD_LOGIC_VECTOR (15 downto 0)
);
end SERVO_GEN;

architecture Behavioral of SERVO_GEN is
SIGNAL H_FREQ : Integer := 50000000;
SIGNAL SERVO_FREQ : Integer := 1000000;
SIGNAL compteur: INTEGER;
SIGNAL int1, int2, int3, int4: INTEGER;
SIGNAL int5, int6, int7, int8: INTEGER;
SIGNAL int9, int10, int11, int12: INTEGER;
SIGNAL int13, int14, int15, int0: INTEGER;
SIGNAL diviseur: INTEGER;
begin
	int0  <= TO_INTEGER(UNSIGNED(VAL0(11 downto 0) ));
	int1  <= TO_INTEGER(UNSIGNED(VAL1(11 downto 0) ));
	int2  <= TO_INTEGER(UNSIGNED(VAL2(11 downto 0) ));
	int3  <= TO_INTEGER(UNSIGNED(VAL3(11 downto 0) ));
	int4  <= TO_INTEGER(UNSIGNED(VAL4(11 downto 0) ));
	int5  <= TO_INTEGER(UNSIGNED(VAL5(11 downto 0) ));
	int6  <= TO_INTEGER(UNSIGNED(VAL6(11 downto 0) ));
	int7  <= TO_INTEGER(UNSIGNED(VAL7(11 downto 0) ));
	int8  <= TO_INTEGER(UNSIGNED(VAL8(11 downto 0) ));
	int9  <= TO_INTEGER(UNSIGNED(VAL9(11 downto 0) ));
	int10 <= TO_INTEGER(UNSIGNED(VAL10(11 downto 0)));
	int11 <= TO_INTEGER(UNSIGNED(VAL11(11 downto 0)));
	int12 <= TO_INTEGER(UNSIGNED(VAL12(11 downto 0)));
	int13 <= TO_INTEGER(UNSIGNED(VAL13(11 downto 0)));
	int14 <= TO_INTEGER(UNSIGNED(VAL14(11 downto 0)));
	int15 <= TO_INTEGER(UNSIGNED(VAL15(11 downto 0)));
	onHorloge : process (H, RESET)
	begin
		if(RESET = '1')then
			compteur <= 0;
			diviseur <= 0;
			PWM <= "0000000000000000";
		else
			if(H'event and H='1')then
				diviseur <= diviseur + 1;
				if(diviseur = (H_FREQ/SERVO_FREQ))then
					diviseur <= 0;
					compteur <= compteur + 1;
					if(compteur = 20000) then
						compteur <= 0;
						PWM <= "1111111111111111";
					end if;
					if(compteur = int0)then --53
						PWM(0) <= '0';
					end if;
					if(compteur = int1)then
						PWM(1) <= '0';
					end if;
					if(compteur = int2)then
						PWM(2) <= '1';
					end if;
					if(compteur = int3)then
						PWM(3) <= '0';
					end if;
					if(compteur = int4)then
						PWM(4) <= '0';
					end if;
					if(compteur = int5)then
						PWM(5) <= '0';
					end if;
					if(compteur = int6)then
						PWM(6) <= '0';
					end if;
					if(compteur = int7)then
						PWM(7) <= '0';
					end if;
					if(compteur = int8)then
						PWM(8) <= '0';
					end if;
					if(compteur = int9)then
						PWM(9) <= '0';
					end if;
					if(compteur = int10)then
						PWM(10) <= '0';
					end if;
					if(compteur = int11)then
						PWM(11) <= '0';
					end if;
					if(compteur = int12)then
						PWM(12) <= '0';
					end if;
					if(compteur = int13)then
						PWM(13) <= '0';
					end if;
					if(compteur = int14)then
						PWM(14) <= '0';
					end if;
					if(compteur = int15)then
						PWM(15) <= '0';
					end if;
				end if;
			end if;
		end if;
	end process;					
end Behavioral;
