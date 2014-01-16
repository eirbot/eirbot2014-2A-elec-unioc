--   _______    __    ______     ______     _____    ________
--  |   ____|  |  |  |   _  \   |   _  \   / __  \  |___  ___|
--  |  |____   |  |  |  |_|  |  |  |_| /  | |  | |     |  |
--  |   ____|  |  |  |       |  |   _  \  | |  | |     |  |
--  |  |____   |  |  |  |\  \   |  |_| |  | |__| |     |  |
--  |_______|  |__|  |__| \__\  |______/   \_____/     |__|
--
-- Module: UART_TX_FIFO
-- But: Implementer une memoire tipe FIFO sur une emission serial
--
library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;
entity UART_TX_FIFO is port(
	H            : in  STD_LOGIC;
	RESET        : in  STD_LOGIC;
	TX           : out STD_LOGIC;
	WRITE_STROBE : in  STD_LOGIC;
	WRITE_DATA   : in  STD_LOGIC_VECTOR(7 downto 0);
	AVAILABLE    : out STD_LOGIC_VECTOR(7 downto 0)
);
end UART_TX_FIFO;
architecture Behavioral of UART_TX_FIFO is
component UART_TX is Port ( 
	H      : in  STD_LOGIC;
	RESET  : in  STD_LOGIC;
	TX     : out STD_LOGIC;
	VAR    : in  STD_LOGIC_VECTOR(7 downto 0);
	STROBE : in  STD_LOGIC;
	READY  : out STD_LOGIC
);
end component;
TYPE RAMFIFO is array(0 to 63) of STD_LOGIC_VECTOR(7 downto 0);
Signal fifo: RAMFIFO;
Signal wpos: Integer:=0;
Signal rpos: Integer:=0;
Signal ava, varout :STD_LOGIC_VECTOR(7 downto 0);
Signal pret, commande: STD_LOGIC;
begin
	uart: UART_TX port map ( 
		H      => H,
		RESET  => RESET,
		TX     => TX,
		VAR    => varout,
		STROBE => commande,
		READY  => pret
	);
	AVAILABLE <= ava;
	ava <= "00"&STD_LOGIC_VECTOR(TO_UNSIGNED(wpos-rpos,6));
	varout <= fifo(rpos);
	process(H)
	begin
		if(H'event and H='1')then
			if(RESET='1')then
				wpos <= 0;
				rpos <= 0;
			else
			  if(commande = '1')then
     	    commande <= '0';
     	    if(rpos=63)then
						rpos <= 0;
					else
						rpos <= rpos +1;
					end if;
				elsif((ava(5) or ava(4) or ava(3) or ava(2) or ava(1) or ava(0))and pret)='1' then
				  commande <= '1';
     	  end if;
     	  
				if(WRITE_STROBE='1')then
					fifo(wpos) <= WRITE_DATA;
					if(wpos=63)then
						wpos <= 0;
					else
						wpos <= wpos +1;
					end if;
				end if;
			end if;
		end if;
	end process;
end Behavioral;