--   _______    __    ______     ______     _____    ________
--  |   ____|  |  |  |   _  \   |   _  \   / __  \  |___  ___|
--  |  |____   |  |  |  |_|  |  |  |_| /  | |  | |     |  |
--  |   ____|  |  |  |       |  |   _  \  | |  | |     |  |
--  |  |____   |  |  |  |\  \   |  |_| |  | |__| |     |  |
--  |_______|  |__|  |__| \__\  |______/   \_____/     |__|
--
-- Module: COMPTEUR_32
-- But: Implemente un compteur 32 bits (inc / dec)
--
library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity COMPTEUR_32 is port(
	H     : in  STD_LOGIC;
	RESET : in  STD_LOGIC;
	INC   : in  STD_LOGIC;
	DEC   : in  STD_LOGIC;
	V     : OUT STD_LOGIC_VECTOR(31 downto 0)
);
end COMPTEUR_32;
architecture comportement of COMPTEUR_32 is
Signal compt: Integer;
begin
	V <= STD_LOGIC_VECTOR(TO_UNSIGNED(compt,32));
	process(H)
	begin
		if(H'event and H='1')then
			if(RESET = '1')then
				compt <= 0;
			else
				if(INC='1')then
					compt <= compt + 1;
				elsif(DEC='1')then
					compt <= compt - 1;
				end if;
			end if;
		end if;
	end process;
end architecture;