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

entity SERIAL_ASSEMBLER is Port ( 
	H     : in  STD_LOGIC;
	RESET : in  STD_LOGIC;
	RX    : in  STD_LOGIC;
	VAR   : out STD_LOGIC_VECTOR(31 downto 0);
	READY : out STD_LOGIC
);
end SERIAL_ASSEMBLER;

architecture Behavioral of SERIAL_ASSEMBLER is
CONSTANT ESCAPE : STD_LOGIC_VECTOR(7 downto 0) := x"0A";--NEW LINE=x"0A"    --SPACE=x"20"
SIGNAL bufferIn : STD_LOGIC_VECTOR(63 downto 0);
SIGNAL bufferOut : STD_LOGIC_VECTOR(31 downto 0);
SIGNAL serialReady, serialError: STD_LOGIC;
SIGNAL inVar: STD_LOGIC_VECTOR(7 downto 0);
component SERIAL_RECEIVER is Port ( 
	H     : in  STD_LOGIC;
   RESET : in  STD_LOGIC;
	RX    : in  STD_LOGIC;
	VAR   : out STD_LOGIC_VECTOR(7 downto 0);
	READY : out STD_LOGIC;
	ERROR : out STD_LOGIC
);
end component;

function A_TO_HEX(ascii:IN STD_LOGIC_VECTOR(7 downto 0))RETURN STD_LOGIC_VECTOR IS
begin
	if(ascii(7 downto 4)="0011")then
		return ascii(3 downto 0);
	elsif( (ascii(7 downto 4)="0100")or(ascii(7 downto 4)="0110")   )then
		return ('1')&(ascii(2)or(ascii(1)and ascii(0)))&(ascii(1)xor ascii(0))&(not ascii(0));
	else
		return "0000";
	end if;
end function;

begin

	serial: SERIAL_RECEIVER PORT MAP(
		H     => H,
		RESET => RESET,
		RX    => RX,
		VAR   => inVar,
		READY => serialReady,
		ERROR => serialError
	);
	process(H)
	begin
		if(H'event and H='1')then
			if(RESET = '1')then
				bufferIn <= (others=>'0');
				VAR <= (others=>'0');
				READY <='1';
			else
				if(serialReady='1')then
					if(inVar = ESCAPE)then
						READY <= '1';
						VAR(31 downto 28) <= A_TO_HEX(bufferIn(63 downto 56));
						VAR(27 downto 24) <= A_TO_HEX(bufferIn(55 downto 48));
						VAR(23 downto 20) <= A_TO_HEX(bufferIn(47 downto 40));
						VAR(19 downto 16) <= A_TO_HEX(bufferIn(39 downto 32));
						VAR(15 downto 12) <= A_TO_HEX(bufferIn(31 downto 24));
						VAR(11 downto 8 ) <= A_TO_HEX(bufferIn(23 downto 16));
						VAR(7  downto 4 ) <= A_TO_HEX(bufferIn(15 downto 8 ));
						VAR(3  downto 0 ) <= A_TO_HEX(bufferIn(7  downto 0 ));
						bufferIn <= (others => '0');
					else
						bufferIn <= bufferIn(55 downto 0) & inVar;
						READY <= '0';
					end if;
				else
					READY <= '0';
				end if;
			end if;
		end if;	
	end process;
	  
end Behavioral;

