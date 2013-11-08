--   _______    __    ______     ______     _____    ________
--  |   ____|  |  |  |   _  \   |   _  \   / __  \  |___  ___|
--  |  |____   |  |  |  |_|  |  |  |_| /  | |  | |     |  |
--  |   ____|  |  |  |       |  |   _  \  | |  | |     |  |
--  |  |____   |  |  |  |\  \   |  |_| |  | |__| |     |  |
--  |_______|  |__|  |__| \__\  |______/   \_____/     |__|
--
-- Module: DEBUGGER
-- But: Faire du debug des variables avec une communication serial 115200@8n1
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity DEBUGGER is Port ( 
	H     : in  STD_LOGIC;
   RESET : in  STD_LOGIC;
	ENABLE: in  STD_LOGIC;
	VAR1  : in  STD_LOGIC_VECTOR(31 downto 0);
	VAR2  : in  STD_LOGIC_VECTOR(31 downto 0);
	VAR3  : in  STD_LOGIC_VECTOR(31 downto 0);
	VAR4  : in  STD_LOGIC_VECTOR(31 downto 0);
	SERIAL: OUT STD_LOGIC
);
end DEBUGGER;

architecture Behavioral of DEBUGGER is
CONSTANT H_FREQ  : INTEGER := 50000000;
CONSTANT BAUD    : INTEGER :=   115200;
CONSTANT MSGSIZE : INTEGER := 44;
TYPE msg is array(0 to (MSGSIZE-1)) of STD_LOGIC_VECTOR(7 downto 0);
SIGNAL BAUDCOUNTER : Integer;
SIGNAL MSG_BUFFER: msg;
SIGNAL BITETAT : STD_LOGIC_VECTOR(3 downto 0);
SIGNAL OCTETAT : Integer;
SIGNAL RUN     : STD_LOGIC;
SIGNAL LAST_ENABLE: STD_LOGIC;
SIGNAL bcdReset: STD_LOGIC;
SIGNAL bcdEnable: STD_LOGIC;
signal buff1, buff2, buff3, buff0:STD_LOGIC_VECTOR(39 downto 0);
component STDLOGIC32_TO_BCD is Port ( 
	H      : in  STD_LOGIC;
   RESET  : in  STD_LOGIC;
	ENABLE : in  STD_LOGIC;
	BIN    : in  STD_LOGIC_VECTOR(31 downto 0);
	BCD    : OUT STD_LOGIC_VECTOR(39 downto 0)
);
end component;

begin
	bcd0 : STDLOGIC32_TO_BCD PORT MAP ( 
		H      => H,
		RESET  => bcdReset,
		ENABLE => bcdEnable,
		BIN    => VAR1,
		BCD    => buff0
	);--33492465
	bcd1 : STDLOGIC32_TO_BCD PORT MAP ( 
		H      => H,
		RESET  => bcdReset,
		ENABLE => bcdEnable,
		BIN    => VAR2,
		BCD    => buff1
	);--33492465
	bcd2 : STDLOGIC32_TO_BCD PORT MAP ( 
		H      => H,
		RESET  => bcdReset,
		ENABLE => bcdEnable,
		BIN    => VAR3,
		BCD    => buff2
	);--33492465
	bcd3 : STDLOGIC32_TO_BCD PORT MAP ( 
		H      => H,
		RESET  => bcdReset,
		ENABLE => bcdEnable,
		BIN    => VAR4,
		BCD    => buff3
	);--33492465
	MSG_BUFFER(0 ) <= "0011"&buff0(39 downto 36);
	MSG_BUFFER(1 ) <= "0011"&buff0(35 downto 32);
	MSG_BUFFER(2 ) <= "0011"&buff0(31 downto 28);
	MSG_BUFFER(3 ) <= "0011"&buff0(27 downto 24);
	MSG_BUFFER(4 ) <= "0011"&buff0(23 downto 20);
	MSG_BUFFER(5 ) <= "0011"&buff0(19 downto 16);
	MSG_BUFFER(6 ) <= "0011"&buff0(15 downto 12);
	MSG_BUFFER(7 ) <= "0011"&buff0(11 downto 8 );
	MSG_BUFFER(8 ) <= "0011"&buff0(7  downto 4 );
	MSG_BUFFER(9 ) <= "0011"&buff0(3  downto 0 );
	MSG_BUFFER(10) <= "00100000";
	MSG_BUFFER(11) <= "0011"&buff1(39 downto 36);
	MSG_BUFFER(12) <= "0011"&buff1(35 downto 32);
	MSG_BUFFER(13) <= "0011"&buff1(31 downto 28);
	MSG_BUFFER(14) <= "0011"&buff1(27 downto 24);
	MSG_BUFFER(15) <= "0011"&buff1(23 downto 20);
	MSG_BUFFER(16) <= "0011"&buff1(19 downto 16);
	MSG_BUFFER(17) <= "0011"&buff1(15 downto 12);
	MSG_BUFFER(18) <= "0011"&buff1(11 downto 8 );
	MSG_BUFFER(19) <= "0011"&buff1(7  downto 4 );
	MSG_BUFFER(20) <= "0011"&buff1(3  downto 0 );
	MSG_BUFFER(21) <= "00100000";
	MSG_BUFFER(22) <= "0011"&buff2(39 downto 36);
	MSG_BUFFER(23) <= "0011"&buff2(35 downto 32);
	MSG_BUFFER(24) <= "0011"&buff2(31 downto 28);
	MSG_BUFFER(25) <= "0011"&buff2(27 downto 24);
	MSG_BUFFER(26) <= "0011"&buff2(23 downto 20);
	MSG_BUFFER(27) <= "0011"&buff2(19 downto 16);
	MSG_BUFFER(28) <= "0011"&buff2(15 downto 12);
	MSG_BUFFER(29) <= "0011"&buff2(11 downto 8 );
	MSG_BUFFER(30) <= "0011"&buff2(7  downto 4 );
	MSG_BUFFER(31) <= "0011"&buff2(3  downto 0 );
	MSG_BUFFER(32) <= "00100000";
	MSG_BUFFER(33) <= "0011"&buff3(39 downto 36);
	MSG_BUFFER(34) <= "0011"&buff3(35 downto 32);
	MSG_BUFFER(35) <= "0011"&buff3(31 downto 28);
	MSG_BUFFER(36) <= "0011"&buff3(27 downto 24);
	MSG_BUFFER(37) <= "0011"&buff3(23 downto 20);
	MSG_BUFFER(38) <= "0011"&buff3(19 downto 16);
	MSG_BUFFER(39) <= "0011"&buff3(15 downto 12);
	MSG_BUFFER(40) <= "0011"&buff3(11 downto 8 );
	MSG_BUFFER(41) <= "0011"&buff3(7  downto 4 );
	MSG_BUFFER(42) <= "0011"&buff3(3  downto 0 );
	MSG_BUFFER(43) <= "00001010";
	process(H)
	begin
		if(H'event and H='1')then 
			if(RESET = '1')then
				RUN <= '0';
				SERIAL <= '1';
				BAUDCOUNTER <= 0;
				BITETAT <= "0000";
				OCTETAT <= 0;
			else
				if(ENABLE = '1' and RUN = '0')then 
					bcdEnable <= '1';
					bcdReset <= '0';
					RUN <= '1'; 
				end if;
				if(RUN = '1')then
					bcdEnable <= '0';
					BAUDCOUNTER <= BAUDCOUNTER + 1;
					if(BAUDCOUNTER = (H_FREQ/BAUD))then
						BAUDCOUNTER <= 0;
						case BITETAT is
							when "0000" => SERIAL <= '0';                    BITETAT<="0001";
							when "0001" => SERIAL <= MSG_BUFFER(OCTETAT)(0); BITETAT<="0010";
							when "0010" => SERIAL <= MSG_BUFFER(OCTETAT)(1); BITETAT<="0011";
							when "0011" => SERIAL <= MSG_BUFFER(OCTETAT)(2); BITETAT<="0100";
							when "0100" => SERIAL <= MSG_BUFFER(OCTETAT)(3); BITETAT<="0101";
							when "0101" => SERIAL <= MSG_BUFFER(OCTETAT)(4); BITETAT<="0110";
							when "0110" => SERIAL <= MSG_BUFFER(OCTETAT)(5); BITETAT<="0111";
							when "0111" => SERIAL <= MSG_BUFFER(OCTETAT)(6); BITETAT<="1000";
							when "1000" => SERIAL <= MSG_BUFFER(OCTETAT)(7); BITETAT<="1001";
							when "1001" => SERIAL <= '1';                    BITETAT<="1010";
							when others => BITETAT <= "0000";
												OCTETAT <= OCTETAT + 1;
						end case;
					end if;
					if(OCTETAT=MSGSIZE)then
						OCTETAT <= 0;
						RUN <= '0';
						bcdReset <= '1';
					end if;
				end if;
			end if;
		end if;
	end process;
	  
end Behavioral;

