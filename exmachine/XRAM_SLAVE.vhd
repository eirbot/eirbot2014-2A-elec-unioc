--   _______    __    ______     ______     _____    ________
--  |   ____|  |  |  |   _  \   |   _  \   / __  \  |___  ___|
--  |  |____   |  |  |  |_|  |  |  |_| /  | |  | |     |  |
--  |   ____|  |  |  |       |  |   _  \  | |  | |     |  |
--  |  |____   |  |  |  |\  \   |  |_| |  | |__| |     |  |
--  |_______|  |__|  |__| \__\  |______/   \_____/     |__|
--
-- Module: XRAM_SLAVE
-- But: Faire la connection entre l'AVR sur une port External RAM
--
library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity XRAM_SLAVE is port(
	H          : in    STD_LOGIC;
	RESET      : in    STD_LOGIC;
	AD         : in    STD_LOGIC_VECTOR(7 downto 0);--\
	DA         : inout STD_LOGIC_VECTOR(7 downto 0);--|
	RD         : in    STD_LOGIC;---------------------|__Atmega
	WR         : in    STD_LOGIC;---------------------|
	DIR        : out   STD_LOGIC;---------------------|
	ALE        : in    STD_LOGIC;---------------------/
	WRITE_STB  : out   STD_LOGIC;----------------------\
	WRITE_DATA : out   STD_LOGIC_VECTOR(7 downto 0);---|--internal
	READ_STB   : out   STD_LOGIC;                   ---|
	READ_DATA  : in    STD_LOGIC_VECTOR(7 downto 0);---|
	ADDRESS    : out   STD_LOGIC_VECTOR(15 downto 0)---/
);
end XRAM_SLAVE;
architecture comportement of XRAM_SLAVE is
CONSTANT retard: Integer := 5;
Signal rrstrobe, rwstrobe: STD_LOGIC_VECTOR(retard downto 0);
Signal addr_ff : STD_LOGIC_VECTOR(15 downto 0);
begin
	process(ALE, AD, DA)
	begin
		if(ALE = '1')then
			addr_ff(15 downto 8) <= AD;
			addr_ff(7 downto 0) <= DA;
		end if;
	end process;
	ADDRESS <= addr_ff;
	process(H)
	begin
		if(H'event and H='1')then
			if(RESET='1')then
				rrstrobe <= (others => '0');
				rwstrobe <= (others => '0');
			else
				rrstrobe <= rrstrobe(retard-1 downto 0) & (not RD);
				rwstrobe <= rwstrobe(retard-1 downto 0) & (not WR);
			end if;
		end if;
	end process;
	WRITE_STB <= (not rwstrobe(retard))and rwstrobe(retard-1);
	READ_STB <= (not rrstrobe(retard))and rrstrobe(retard-1);
	WRITE_DATA <= DA;-- when(WR='0')else "00000000";
	DIR <= not RD;
	DA <= READ_DATA when(RD='0') else "ZZZZZZZZ";
end architecture;
		