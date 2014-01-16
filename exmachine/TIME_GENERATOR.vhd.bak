--   _______    __    ______     ______     _____    ________
--  |   ____|  |  |  |   _  \   |   _  \   / __  \  |___  ___|
--  |  |____   |  |  |  |_|  |  |  |_| /  | |  | |     |  |
--  |   ____|  |  |  |       |  |   _  \  | |  | |     |  |
--  |  |____   |  |  |  |\  \   |  |_| |  | |__| |     |  |
--  |_______|  |__|  |__| \__\  |______/   \_____/     |__|
--
-- Module: TIME_GENERATOR
-- But: À partir du horloge, determiner combien de temps il y a passé 
--   depuis sa initialisation
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TIME_GENERATOR is
    Port ( H : in  STD_LOGIC;
           RESET : in  STD_LOGIC;
           MICROS: out STD_LOGIC_VECTOR (9 downto 0);
           MILIS: out STD_LOGIC_VECTOR (9 downto 0);
           SEC: out STD_LOGIC_VECTOR (9 downto 0)
            );
end TIME_GENERATOR;

architecture Behavioral of TIME_GENERATOR is
CONSTANT H_FREQ :INTEGER := 50000000;
CONSTANT PAS_TO_US :INTEGER := H_FREQ/1000000;
SIGNAL compteur: INTEGER;
SIGNAL int_micros, int_milis, int_sec:INTEGER;
begin
  MICROS <= std_logic_vector(to_unsigned(int_micros,10));
  MILIS <= std_logic_vector(to_unsigned(int_milis,10));
  SEC <= std_logic_vector(to_unsigned(int_sec,10));
  
  onHorloge : process (H, RESET)
  begin
    if(RESET = '1')then
      compteur<=0;
      int_micros<=0;
      int_milis<=0;
      int_sec<=0;
    else
      if(H'event and H='1')then
        compteur <= compteur + 1;
        if(compteur = PAS_TO_US-1) then
          compteur <= 0;
          int_micros <= int_micros+1;
          if(int_micros = 999) then
            int_micros <= 0;
            int_milis <= int_milis+1;
            if(int_milis = 999) then
              int_milis <= 0;
              int_sec <= int_sec+1;
            end if;
          end if;
        end if;
      end if;
    end if;
  end process;					
end Behavioral;

