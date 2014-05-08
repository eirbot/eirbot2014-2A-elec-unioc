--   _______    __    ______     ______     _____    ________
--  |   ____|  |  |  |   _  \   |   _  \   / __  \  |___  ___|
--  |  |____   |  |  |  |_|  |  |  |_| /  | |  | |     |  |
--  |   ____|  |  |  |       |  |   _  \  | |  | |     |  |
--  |  |____   |  |  |  |\  \   |  |_| |  | |__| |     |  |
--  |_______|  |__|  |__| \__\  |______/   \_____/     |__|
--
-- Module: UART_RX
-- But: Recevoir des donnes d'une communication serial 115200@8n1
--
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity UART_RX is Port ( 
	H     : in  STD_LOGIC;
   RESET : in  STD_LOGIC;
	RX    : in  STD_LOGIC;
	BR		: in  STD_LOGIC_VECTOR(15 downto 0);
	VAR   : out STD_LOGIC_VECTOR(7 downto 0);
	READY : out STD_LOGIC
);
end UART_RX;

architecture Behavioral of UART_RX is
CONSTANT H_FREQ  : INTEGER := 50000000;
CONSTANT BAUD    : INTEGER :=   115200;
SIGNAL delayer: Integer;
SIGNAL etat: STD_LOGIC_VECTOR(9 downto 0);
SIGNAL buffSortie: STD_LOGIC_VECTOR(9 downto 0);
begin
	VAR <= buffSortie(9 downto 2);
	process(H)
	begin
		if(H'event and H='1')then
			if(RESET = '1')then
				delayer <= 0;
				READY <= '0';
				etat <= "0000000000";
			else
				if(etat="0000000000")then
				   READY <= '0';
					if(RX='0')then
						etat <= "0000000001";
						delayer <= TO_INTEGER(UNSIGNED(BR(15 downto 4)));
						buffSortie <= "0000000000";
					end if;
				else
					if(delayer /= 0)then
						delayer <= delayer -1;
						READY <= '0';
					else
						if(etat(9)='1')then
							etat <= "0000000000";
							if((buffSortie(1)='0')and(RX='1'))then
								READY <= '1';
							else
								READY <= '0';
							end if;
						else
							buffSortie <= RX & buffSortie(9 downto 1);
							etat <= etat(8 downto 0)&'0';
							delayer <= TO_INTEGER(UNSIGNED(BR(15 downto 3)));
						   READY <= '0';
						end if;
					end if;
				end if;
			end if;
		end if;	
	end process;
	  
end Behavioral;