--   _______    __    ______     ______     _____    ________
--  |   ____|  |  |  |   _  \   |   _  \   / __  \  |___  ___|
--  |  |____   |  |  |  |_|  |  |  |_| /  | |  | |     |  |
--  |   ____|  |  |  |       |  |   _  \  | |  | |     |  |
--  |  |____   |  |  |  |\  \   |  |_| |  | |__| |     |  |
--  |_______|  |__|  |__| \__\  |______/   \_____/     |__|
--
-- Module: UART_TX
-- But: Envoir des donnes d'une communication serial 115200@8n1
--
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity UART_TX is Port ( 
	H      : in  STD_LOGIC;
	RESET  : in  STD_LOGIC;
	TX     : out STD_LOGIC;
	BR     : in  STD_LOGIC_VECTOR(15 downto 0);
	VAR    : in  STD_LOGIC_VECTOR(7 downto 0);
	STROBE : in  STD_LOGIC;
	READY  : out STD_LOGIC
);
end UART_TX;
architecture Behavioral of UART_TX is
CONSTANT H_FREQ  : INTEGER := 50000000;
CONSTANT BAUD    : INTEGER :=   115200;
SIGNAL delayer: Integer;
SIGNAL etat: STD_LOGIC_VECTOR(10 downto 0);
SIGNAL buffSortie: STD_LOGIC_VECTOR(7 downto 0);
begin
	process(etat, buffSortie)
	begin
		case etat is
		  when "00000000001"=>TX <= '0';
		  when "00000000010"=>TX <= buffSortie(0);
		  when "00000000100"=>TX <= buffSortie(1);
		  when "00000001000"=>TX <= buffSortie(2);
		  when "00000010000"=>TX <= buffSortie(3);
		  when "00000100000"=>TX <= buffSortie(4);
		  when "00001000000"=>TX <= buffSortie(5);
		  when "00010000000"=>TX <= buffSortie(6);
		  when "00100000000"=>TX <= buffSortie(7);
		  when others       =>TX <= '1';
		end case;
	end process;
	READY <= etat(10);
	process(H)
	begin
		if(H'event and H='1')then
			if(RESET = '1')then
				delayer <= 0;
				etat <= "10000000000";
	      buffSortie <= "00000000";
			else
				if(etat="10000000000")then
					if(STROBE='1')then
						etat <= "00000000001";
						delayer <= TO_INTEGER(UNSIGNED(BR(15 downto 3)));
						buffSortie <= VAR;
					end if;
				else
					if(delayer /= 0)then
						delayer <= delayer -1;
					else
						etat <= etat(9 downto 0)&'0';
						delayer <= TO_INTEGER(UNSIGNED(BR(15 downto 3)));
					end if;
				end if;
			end if;
		end if;	
	end process;
end Behavioral;

