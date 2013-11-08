--   _______    __    ______     ______     _____    ________
--  |   ____|  |  |  |   _  \   |   _  \   / __  \  |___  ___|
--  |  |____   |  |  |  |_|  |  |  |_| /  | |  | |     |  |
--  |   ____|  |  |  |       |  |   _  \  | |  | |     |  |
--  |  |____   |  |  |  |\  \   |  |_| |  | |__| |     |  |
--  |_______|  |__|  |__| \__\  |______/   \_____/     |__|
--
-- Module: SPI_SLAVE
-- But: Faire une interface serial-paralele avec une porte SPI Master
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity SPI_SLAVE is
    Port ( CLOCK : in  STD_LOGIC;
           RESET : in  STD_LOGIC;
           MISO : OUT  STD_LOGIC;
           MOSI : in  STD_LOGIC;
           CS: in STD_LOGIC;
           DATAMISO : IN  STD_LOGIC_VECTOR (7 downto 0);
           DATAMOSI : OUT  STD_LOGIC_VECTOR (7 downto 0);
           DATA_RCV : OUT STD_LOGIC
            );
end SPI_SLAVE;

architecture Behavioral of SPI_SLAVE is
SIGNAL etat: STD_LOGIC_VECTOR (2 downto 0);
SIGNAL buffSortie: STD_LOGIC_VECTOR(7 downto 1);
SIGNAL buffEntree: STD_LOGIC_VECTOR(6 downto 0);
begin
  onClock : process (CLOCK, RESET)
  begin
    if(reset = '1')then
      etat <="000";
      DATAMOSI <= "00000000";
      DATA_RCV <= '0';
      MISO <= '0';
    else
      if(CLOCK'event and CLOCK='1' and CS='1')then
        case etat is
        when "000" =>
            buffSortie <= DATAMISO(7 downto 1);
            DATA_RCV <= '1';
            MISO <= DATAMISO(0);
            buffEntree(0) <= MOSI;
            etat <= "001";
        when "001" =>
            MISO <= buffSortie(1);
            buffEntree(1) <= MOSI;
            etat <= "010";
        when "010" =>
            MISO <= buffSortie(2);
            buffEntree(2) <= MOSI;
            etat <= "011";
        when "011" =>
            MISO <= buffSortie(3);
            buffEntree(3) <= MOSI;
            etat <= "100";
        when "100" =>
            MISO <= buffSortie(4);
            buffEntree(4) <= MOSI;
            etat <= "101";
        when "101" =>
            MISO <= buffSortie(5);
            buffEntree(5) <= MOSI;
            etat <= "110";
        when "110" =>
            MISO <= buffSortie(6);
            buffEntree(6) <= MOSI;
            etat <= "111";
        when OTHERS =>
            MISO <= buffSortie(7);
            DATAMOSI(6 downto 0) <= buffEntree;
            DATAMOSI(7)          <= MOSI;
            DATA_RCV <= '0';
            etat <= "000";
        end case;
      end if;
    end if;
  end process;
  					
end Behavioral;

