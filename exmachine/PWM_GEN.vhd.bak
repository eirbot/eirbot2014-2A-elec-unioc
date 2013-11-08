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

entity PWM_GEN is
    Port ( H_PWM : in  STD_LOGIC;
           RESET : in  STD_LOGIC;
           VAL1 : in  STD_LOGIC_VECTOR (7 downto 0);
           VAL2 : in  STD_LOGIC_VECTOR (7 downto 0);
           VAL3 : in  STD_LOGIC_VECTOR (7 downto 0);
           VAL4 : in  STD_LOGIC_VECTOR (7 downto 0);
           PWM1 : out STD_LOGIC_VECTOR (1 downto 0);
           PWM2 : out STD_LOGIC_VECTOR (1 downto 0);
           PWM3 : out STD_LOGIC_VECTOR (1 downto 0);
           PWM4 : out STD_LOGIC_VECTOR (1 downto 0)
            );
end PWM_GEN;

architecture Behavioral of PWM_GEN is
SIGNAL compteur: INTEGER;
SIGNAL int1, int2, int3, int4: INTEGER;
begin
  int1 <= TO_INTEGER(UNSIGNED(VAL1(6 downto 0)));
  int2 <= TO_INTEGER(UNSIGNED(VAL2(6 downto 0)));
  int3 <= TO_INTEGER(UNSIGNED(VAL3(6 downto 0)));
  int4 <= TO_INTEGER(UNSIGNED(VAL4(6 downto 0)));
  PWM1(1) <= VAL1(7);
  PWM2(1) <= VAL2(7);
  PWM3(1) <= VAL3(7);
  PWM4(1) <= VAL4(7);
  onHorloge : process (H_PWM, RESET)
  begin
    if(RESET = '1')then
      compteur<=0;
      PWM1(0) <= '0';
      PWM2(0) <= '0';
      PWM3(0) <= '0';
      PWM4(0) <= '0';
    else
      if(H_PWM'event and H_PWM='1')then
        compteur <= compteur + 1;
        if(compteur = 256) then
          compteur <= 0;
          PWM1(0) <= '1';
          PWM2(0) <= '1';
          PWM3(0) <= '1';
          PWM4(0) <= '1';
        end if;
        if(compteur >= int1)then
          PWM1(0) <= '0';
        end if;
        if(compteur >= int2)then
          PWM2(0) <= '0';
        end if;
        if(compteur >= int3)then
          PWM3(0) <= '0';
        end if;
        if(compteur >= int4)then
          PWM4(0) <= '0';
        end if;
      end if;
    end if;
  end process;					
end Behavioral;
