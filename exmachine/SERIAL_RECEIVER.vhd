--   _______    __    ______     ______     _____    ________
--  |   ____|  |  |  |   _  \   |   _  \   / __  \  |___  ___|
--  |  |____   |  |  |  |_|  |  |  |_| /  | |  | |     |  |
--  |   ____|  |  |  |       |  |   _  \  | |  | |     |  |
--  |  |____   |  |  |  |\  \   |  |_| |  | |__| |     |  |
--  |_______|  |__|  |__| \__\  |______/   \_____/     |__|
--
-- Module: SERIAL_RECEIVER
-- But: Recevoir des donnes d'une communication serial 115200@8n1
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity SERIAL_RECEIVER is Port ( 
	H     : in  STD_LOGIC;
   RESET : in  STD_LOGIC;
	RX    : in  STD_LOGIC;
	VAR   : out STD_LOGIC_VECTOR(7 downto 0);
	READY : out STD_LOGIC;
	ERROR : out STD_LOGIC
);
end SERIAL_RECEIVER;

architecture Behavioral of SERIAL_RECEIVER is
CONSTANT H_FREQ  : INTEGER := 50000000;
CONSTANT BAUD    : INTEGER :=   115200;
SIGNAL delayer: Integer;
SIGNAL etat: STD_LOGIC_VECTOR(9 downto 0);
SIGNAL buffSortie: STD_LOGIC_VECTOR(9 downto 0);
begin
	VAR <= buffSortie(8 downto 1);
	process(H)
	begin
		if(H'event and H='1')then
			if(RESET = '1')then
				delayer <= 0;
				READY <= '1';
				etat <= "0000000000";
				ERROR <= '0';
			else
				if(etat="0000000000")then
					if(RX='0')then
						etat <= "0000000001";
						delayer <= H_FREQ/(2*BAUD);
						READY <= '0';
						buffSortie <= "0000000000";
					end if;
				else
					delayer <= delayer -1;
					if(delayer = 0)then
						if(etat(9)='1')then
							etat <= "0000000000";
							if(buffSortie(0)='0' and RX='1')then
								ERROR <= '0';
								READY <= '1';
							else
								ERROR <= '1';
								READY <= '1';
							end if;
						else
							buffSortie <= buffSortie or (etat and (9 downto 0=>RX));
							etat <= etat(8 downto 0)&'0';
							delayer <= H_FREQ/BAUD;
						end if;
					end if;
				end if;
			end if;
		end if;	
	end process;
	  
end Behavioral;

