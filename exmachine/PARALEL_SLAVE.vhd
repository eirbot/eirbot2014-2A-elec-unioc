--   _______    __    ______     ______     _____    ________
--  |   ____|  |  |  |   _  \   |   _  \   / __  \  |___  ___|
--  |  |____   |  |  |  |_|  |  |  |_| /  | |  | |     |  |
--  |   ____|  |  |  |       |  |   _  \  | |  | |     |  |
--  |  |____   |  |  |  |\  \   |  |_| |  | |__| |     |  |
--  |_______|  |__|  |__| \__\  |______/   \_____/     |__|
--
-- Module: PARALEL_SLAVE
-- But: Faire une interface serial-paralele avec une porte SPI Master
--
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity PARALEL_SLAVE is Port (
	BARR       : inout STD_LOGIC_VECTOR(7 downto 0);
	IS_COMMAND : in    STD_LOGIC;
	READ_WRITE : in    STD_LOGIC;
	DATA_READY : in    STD_LOGIC;
	
	COMMAND    : out   STD_LOGIC_VECTOR(7 downto 0);
	DATA_IN    : out   STD_LOGIC_VECTOR(7 downto 0);
	DATA_OUT   : in    STD_LOGIC_VECTOR(7 downto 0);
	EXECUTE    : out   STD_LOGIC
);
end PARALEL_SLAVE;

architecture Behavioral of PARALEL_SLAVE is
SIGNAL a, b: STD_LOGIC_VECTOR (7 downto 0);
begin
	PROCESS (READ_WRITE, BARR)   -- Behavioral representation 
	BEGIN                        -- of tri-states.
		IF( READ_WRITE = '0') THEN
			BARR <= "ZZZZZZZZ";
			b <= BARR;
		ELSE
			BARR <= a; 
			b <= BARR;
		END IF;
	END PROCESS;
	EXECUTE <= not DATA_READY;
	a <= DATA_OUT;
	process (DATA_READY)
	begin
		if(DATA_READY'event and DATA_READY='1')then
			if(IS_COMMAND = '1')then
				COMMAND <= b;
			else	
				DATA_IN <= b;
			end if;
		end if;
	end process;
end Behavioral;

