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

entity SERVO_GEN is
    Port ( H_SERVO : in  STD_LOGIC;
           RESET : in  STD_LOGIC;
           VAL0 : in  STD_LOGIC_VECTOR (7 downto 0);
           VAL1 : in  STD_LOGIC_VECTOR (7 downto 0);
           VAL2 : in  STD_LOGIC_VECTOR (7 downto 0);
           VAL3 : in  STD_LOGIC_VECTOR (7 downto 0);
           VAL4 : in  STD_LOGIC_VECTOR (7 downto 0);
           VAL5 : in  STD_LOGIC_VECTOR (7 downto 0);
           VAL6 : in  STD_LOGIC_VECTOR (7 downto 0);
           VAL7 : in  STD_LOGIC_VECTOR (7 downto 0);
           VAL8 : in  STD_LOGIC_VECTOR (7 downto 0);
           VAL9 : in  STD_LOGIC_VECTOR (7 downto 0);
           VAL10 : in  STD_LOGIC_VECTOR (7 downto 0);
           VAL11 : in  STD_LOGIC_VECTOR (7 downto 0);
           VAL12 : in  STD_LOGIC_VECTOR (7 downto 0);
           VAL13 : in  STD_LOGIC_VECTOR (7 downto 0);
           VAL14 : in  STD_LOGIC_VECTOR (7 downto 0);
           VAL15 : in  STD_LOGIC_VECTOR (7 downto 0);
			  PWM   : out STD_LOGIC_VECTOR (15 downto 0)
     );
end SERVO_GEN;

architecture Behavioral of SERVO_GEN is
SIGNAL compteur: INTEGER;
SIGNAL int1, int2, int3, int4: INTEGER;
SIGNAL int5, int6, int7, int8: INTEGER;
SIGNAL int9, int10, int11, int12: INTEGER;
SIGNAL int13, int14, int15, int0: INTEGER;
begin
  int0 <= TO_INTEGER(UNSIGNED(VAL0));
  int1 <= TO_INTEGER(UNSIGNED(VAL1));
  int2 <= TO_INTEGER(UNSIGNED(VAL2));
  int3 <= TO_INTEGER(UNSIGNED(VAL3));
  int4 <= TO_INTEGER(UNSIGNED(VAL4));
  int5 <= TO_INTEGER(UNSIGNED(VAL5));
  int6 <= TO_INTEGER(UNSIGNED(VAL6));
  int7 <= TO_INTEGER(UNSIGNED(VAL7));
  int8 <= TO_INTEGER(UNSIGNED(VAL8));
  int9 <= TO_INTEGER(UNSIGNED(VAL9));
  int10 <= TO_INTEGER(UNSIGNED(VAL10));
  int11 <= TO_INTEGER(UNSIGNED(VAL11));
  int12 <= TO_INTEGER(UNSIGNED(VAL12));
  int13 <= TO_INTEGER(UNSIGNED(VAL13));
  int14 <= TO_INTEGER(UNSIGNED(VAL14));
  int15 <= TO_INTEGER(UNSIGNED(VAL15));
  
  onHorloge : process (H_SERVO, RESET)
  begin
    if(RESET = '1')then
			compteur <= 0;
			PWM(0) <= '0';
			PWM(1) <= '0';
			PWM(2) <= '0';
			PWM(3) <= '0';
			PWM(4) <= '0';
			PWM(5) <= '0';
			PWM(6) <= '0';
			PWM(7) <= '0';
			PWM(8) <= '0';
			PWM(9) <= '0';
			PWM(10) <= '0';
			PWM(11) <= '0';
			PWM(12) <= '0';
			PWM(13) <= '0';
			PWM(14) <= '0';
			PWM(15) <= '0';
    else
      if(H_SERVO'event and H_SERVO='1')then
        compteur <= compteur + 1;
        if(compteur = 1000) then
          compteur <= 0;
          PWM(0) <= '1';
          PWM(1) <= '1';
          PWM(2) <= '1';
          PWM(3) <= '1';
          PWM(4) <= '1';
          PWM(5) <= '1';
          PWM(6) <= '1';
          PWM(7) <= '1';
          PWM(8) <= '1';
          PWM(9) <= '1';
          PWM(10) <= '1';
          PWM(11) <= '1';
          PWM(12) <= '1';
          PWM(13) <= '1';
          PWM(14) <= '1';
          PWM(15) <= '1';
        end if;
        if(compteur >= int0)then
          PWM(0) <= '0';
        end if;
        if(compteur >= int1)then
          PWM(1) <= '0';
        end if;
        if(compteur >= int2)then
          PWM(2) <= '0';
        end if;
        if(compteur >= int3)then
          PWM(3) <= '0';
        end if;
        if(compteur >= int4)then
          PWM(4) <= '0';
        end if;
        if(compteur >= int5)then
          PWM(5) <= '0';
        end if;
        if(compteur >= int6)then
          PWM(6) <= '0';
        end if;
        if(compteur >= int7)then
          PWM(7) <= '0';
        end if;
        if(compteur >= int8)then
          PWM(8) <= '0';
        end if;
        if(compteur >= int9)then
          PWM(9) <= '0';
        end if;
        if(compteur >= int10)then
          PWM(10) <= '0';
        end if;
        if(compteur >= int11)then
          PWM(11) <= '0';
        end if;
        if(compteur >= int12)then
          PWM(12) <= '0';
        end if;
        if(compteur >= int13)then
          PWM(13) <= '0';
        end if;
        if(compteur >= int14)then
          PWM(14) <= '0';
        end if;
        if(compteur >= int15)then
          PWM(15) <= '0';
        end if;
      end if;
    end if;
  end process;					
end Behavioral;

