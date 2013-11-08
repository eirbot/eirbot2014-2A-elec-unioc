--   _______    __    ______     ______     _____    ________
--  |   ____|  |  |  |   _  \   |   _  \   / __  \  |___  ___|
--  |  |____   |  |  |  |_|  |  |  |_| /  | |  | |     |  |
--  |   ____|  |  |  |       |  |   _  \  | |  | |     |  |
--  |  |____   |  |  |  |\  \   |  |_| |  | |__| |     |  |
--  |_______|  |__|  |__| \__\  |______/   \_____/     |__|
--
-- Module: STDLOGIC32_TO_BCD
-- But: Transformer un numbre par une entree de 32 bits en un numbre en BCD (decimal)
--
--http://www.eetkorea.com/ARTICLES/2000JUN/2000JUN27_PL_CT_AN6.PDF

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity STDLOGIC32_TO_BCD is Port ( 
	H      : in  STD_LOGIC;
	RESET  : in  STD_LOGIC;
	ENABLE : in  STD_LOGIC;
	BIN    : in  STD_LOGIC_VECTOR(31 downto 0);
	BCD    : OUT STD_LOGIC_VECTOR(39 downto 0)
);
end STDLOGIC32_TO_BCD;

architecture Behavioral of STDLOGIC32_TO_BCD is
SIGNAL buffIn : STD_LOGIC_VECTOR(31 downto 0);
SIGNAL buffOut : STD_LOGIC_VECTOR(39 downto 0);
SIGNAL count : Integer;
SIGNAL run: STD_LOGIC;
SIGNAL intermid: STD_LOGIC_VECTOR(9 downto 0);
SIGNAL resetConv: STD_LOGIC;
component STDLOGIC_TO_BCD is Port ( 
	H      : in  STD_LOGIC;
  RESET  : in  STD_LOGIC;
	BIN_IN : in  STD_LOGIC;
	BCD    : OUT STD_LOGIC_VECTOR(3 downto 0);
	BIN_OUT: OUT STD_LOGIC
);
end component;

begin	
	bcd0 : STDLOGIC_TO_BCD PORT MAP ( 
		H      => H,
		RESET  => resetConv,
		BIN_IN => buffIn(31),
		BCD    => buffOut(3 downto 0),
		BIN_OUT=> intermid(0)
	);
	bcd1 : STDLOGIC_TO_BCD PORT MAP ( 
		H      => H,
		RESET  => resetConv,
		BIN_IN => intermid(0),
		BCD    => buffOut(7 downto 4),
		BIN_OUT=> intermid(1)
	);
	bcd2 : STDLOGIC_TO_BCD PORT MAP ( 
		H      => H,
		RESET  => resetConv,
		BIN_IN => intermid(1),
		BCD    => buffOut(11 downto 8),
		BIN_OUT=> intermid(2)
	);
	bcd3 : STDLOGIC_TO_BCD PORT MAP ( 
		H      => H,
		RESET  => resetConv,
		BIN_IN => intermid(2),
		BCD    => buffOut(15 downto 12),
		BIN_OUT=> intermid(3)
	);
	bcd4 : STDLOGIC_TO_BCD PORT MAP ( 
		H      => H,
		RESET  => resetConv,
		BIN_IN => intermid(3),
		BCD    => buffOut(19 downto 16),
		BIN_OUT=> intermid(4)
	);
	bcd5 : STDLOGIC_TO_BCD PORT MAP ( 
		H      => H,
		RESET  => resetConv,
		BIN_IN => intermid(4),
		BCD    => buffOut(23 downto 20),
		BIN_OUT=> intermid(5)
	);
	bcd6 : STDLOGIC_TO_BCD PORT MAP ( 
		H      => H,
		RESET  => resetConv,
		BIN_IN => intermid(5),
		BCD    => buffOut(27 downto 24),
		BIN_OUT=> intermid(6)
	);
	bcd7 : STDLOGIC_TO_BCD PORT MAP ( 
		H      => H,
		RESET  => resetConv,
		BIN_IN => intermid(6),
		BCD    => buffOut(31 downto 28),
		BIN_OUT=> intermid(7)
	);
	bcd8 : STDLOGIC_TO_BCD PORT MAP ( 
		H      => H,
		RESET  => resetConv,
		BIN_IN => intermid(7),
		BCD    => buffOut(35 downto 32),
		BIN_OUT=> intermid(8)
	);
	bcd9 : STDLOGIC_TO_BCD PORT MAP ( 
		H      => H,
		RESET  => resetConv,
		BIN_IN => intermid(8),
		BCD    => buffOut(39 downto 36),
		BIN_OUT=> intermid(9)
	);
	process(H)
	begin
		if(H'event and H='1')then
			if(RESET = '1')then
				buffIn <= (others => '0');
				BCD <= (others => '0');
				resetConv <= '1';
				run <= '0';
				count <= 0;
			else
				if(ENABLE='1' and run='0')then
					buffIn <= BIN;
					run <= '1';
					count <= 0;
					resetConv <= '0';
				end if;
				if(run = '1')then
					if(count=32)then
						run <= '0';
						BCD <= buffOut;
						resetConv <= '1';
					else
						count <= count + 1;
						buffIn <= buffIn(30 downto 0) & '0';
					end if;
				end if;
			end if;
		end if;
	end process;
end Behavioral;

