--   _______    __    ______     ______     _____    ________
--  |   ____|  |  |  |   _  \   |   _  \   / __  \  |___  ___|
--  |  |____   |  |  |  |_|  |  |  |_| /  | |  | |     |  |
--  |   ____|  |  |  |       |  |   _  \  | |  | |     |  |
--  |  |____   |  |  |  |\  \   |  |_| |  | |__| |     |  |
--  |_______|  |__|  |__| \__\  |______/   \_____/     |__|
--
-- Module: DEBUGGER2
-- But: Faire Varier une variable avec un bouton
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity DEBUGGER2 is Port ( 
	H     : in  STD_LOGIC;
   RESET : in  STD_LOGIC;
	BOUTON: in  STD_LOGIC;
	VAR   : OUT STD_LOGIC_VECTOR(31 downto 0)
);
end DEBUGGER2;

architecture Behavioral of DEBUGGER2 is
SIGNAL intCompteur :Integer;
SIGNAL intDebouncer: Integer;
SIGNAL lastBouton: STD_LOGIC;
begin
	VAR <= STD_LOGIC_VECTOR(TO_UNSIGNED(intCompteur,32));
	process(H)
	begin
		if(H'event and H='1')then
			if(RESET='1')then
				intCompteur <= 4000;
				intDebouncer <= 0;
			else
				if( (lastBouton/=BOUTON) and (intDebouncer=0) )then
					intCompteur <= intCompteur + 100;--5256-212, 5000-200
					lastBouton <= BOUTON;
					intDebouncer <= 1;
				end if;
				if(intDebouncer=500000)then
					intDebouncer <= 0;
				elsif(intDebouncer/=0)then
					intDebouncer <= intDebouncer+1;
				end if;
				
			end if;
		end if;
	end process;
end Behavioral;

