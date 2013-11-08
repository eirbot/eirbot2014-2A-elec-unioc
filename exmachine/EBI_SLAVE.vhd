--   _______    __    ______     ______     _____    ________
--  |   ____|  |  |  |   _  \   |   _  \   / __  \  |___  ___|
--  |  |____   |  |  |  |_|  |  |  |_| /  | |  | |     |  |
--  |   ____|  |  |  |       |  |   _  \  | |  | |     |  |
--  |  |____   |  |  |  |\  \   |  |_| |  | |__| |     |  |
--  |_______|  |__|  |__| \__\  |______/   \_____/     |__|
--
-- Module: EBI_SLAVE
-- But: Faire la connection entre l'AVR sur une port EBI et les peripheriques
--
library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity EBI_SLAVE is port(
	H        : in    STD_LOGIC;
	RESET    : in    STD_LOGIC;
	--Connections avec l'AVR
	DATA     : inout STD_LOGIC_VECTOR(7 downto 0);
	ADDR     : in    STD_LOGIC_VECTOR(7 downto 0);
	RD       : in    STD_LOGIC;
	WR       : in    STD_LOGIC;
	ALE      : in    STD_LOGIC;
	DIRBUF1  : out   STD_LOGIC;
	DIRBUF2  : out   STD_LOGIC;
	--Sorties pour les actuateurs
	MOT1     : out STD_LOGIC_VECTOR(1 downto 0);
	MOT2     : out STD_LOGIC_VECTOR(1 downto 0);
	SERVO    : out STD_LOGIC_VECTOR(15 downto 0);
	--Entrees des senseurs
	CODEUR1  : in  STD_LOGIC_VECTOR(1 downto 0);
	CODEUR2  : in  STD_LOGIC_VECTOR(1 downto 0);
	CODEUR3  : in  STD_LOGIC_VECTOR(1 downto 0);
	CODEUR4  : in  STD_LOGIC_VECTOR(1 downto 0);
	LED      : OUT STD_LOGIC
);
end EBI_SLAVE;

architecture comportement of EBI_SLAVE is
-------------------Declaration de pines de modules-------------
COMPONENT SPI_SLAVE is Port ( 
	CLOCK : in  STD_LOGIC;
	RESET : in  STD_LOGIC;
	MISO : OUT  STD_LOGIC;
	MOSI : in  STD_LOGIC;
	CS: in STD_LOGIC;
	DATAMISO : IN  STD_LOGIC_VECTOR (7 downto 0);
	DATAMOSI : OUT  STD_LOGIC_VECTOR (7 downto 0);
	DATA_RCV : OUT STD_LOGIC
);
end COMPONENT;
COMPONENT PWM_GEN is Port ( 
	H : in  STD_LOGIC;
	RESET : in  STD_LOGIC;
	VAL1 : in  STD_LOGIC_VECTOR (7 downto 0);
	VAL2 : in  STD_LOGIC_VECTOR (7 downto 0);
	VAL3 : in  STD_LOGIC_VECTOR (7 downto 0);
	VAL4 : in  STD_LOGIC_VECTOR (7 downto 0);
	PWM1 : out STD_LOGIC_VECTOR (1 downto 0);
	PWM2 : out STD_LOGIC_VECTOR (1 downto 0);
	PWM3 : out STD_LOGIC_VECTOR (1 downto 0);
	PWM4 : out STD_LOGIC_VECTOR (1 downto 0)
);
end COMPONENT;
COMPONENT TIME_GENERATOR is Port ( 
	H : in  STD_LOGIC;
	RESET : in  STD_LOGIC;
	MICROS: out STD_LOGIC_VECTOR (9 downto 0);
	MILIS: out STD_LOGIC_VECTOR (9 downto 0);
	SEC: out STD_LOGIC_VECTOR (9 downto 0)
);
end COMPONENT;
COMPONENT SERVO_GEN is Port ( 
	H     : in  STD_LOGIC;
	RESET : in  STD_LOGIC;
	VAL0  : in  STD_LOGIC_VECTOR (15 downto 0);
	VAL1  : in  STD_LOGIC_VECTOR (15 downto 0);
	VAL2  : in  STD_LOGIC_VECTOR (15 downto 0);
	VAL3  : in  STD_LOGIC_VECTOR (15 downto 0);
	VAL4  : in  STD_LOGIC_VECTOR (15 downto 0);
	VAL5  : in  STD_LOGIC_VECTOR (15 downto 0);
	VAL6  : in  STD_LOGIC_VECTOR (15 downto 0);
	VAL7  : in  STD_LOGIC_VECTOR (15 downto 0);
	VAL8  : in  STD_LOGIC_VECTOR (15 downto 0);
	VAL9  : in  STD_LOGIC_VECTOR (15 downto 0);
	VAL10 : in  STD_LOGIC_VECTOR (15 downto 0);
	VAL11 : in  STD_LOGIC_VECTOR (15 downto 0);
	VAL12 : in  STD_LOGIC_VECTOR (15 downto 0);
	VAL13 : in  STD_LOGIC_VECTOR (15 downto 0);
	VAL14 : in  STD_LOGIC_VECTOR (15 downto 0);
	VAL15 : in  STD_LOGIC_VECTOR (15 downto 0);
	PWM   : out STD_LOGIC_VECTOR (15 downto 0)
);
end COMPONENT;
COMPONENT COUNTER_ROTATIF is Port ( 
	H    : in  STD_LOGIC;
	SIG  : in  STD_LOGIC_VECTOR (1 downto 0);
	SORT : out STD_LOGIC_VECTOR (1 downto 0);
	RESET: in  STD_LOGIC
);
end COMPONENT;
COMPONENT COUNTEUR_XYR_HIRES is Port (
	CODEUR1 : IN STD_LOGIC_VECTOR (1  downto 0);
	CODEUR2 : IN STD_LOGIC_VECTOR (1  downto 0);
	RELATION: IN STD_LOGIC_VECTOR (23 downto 0);
	POSX    : OUT STD_LOGIC_VECTOR (31 downto 0);
	POSY    : OUT STD_LOGIC_VECTOR (31 downto 0);
	ROT     : OUT STD_LOGIC_VECTOR (15 downto 0);  --0-360 degrees + 7 bits
	RESET   : IN STD_LOGIC;
	H       : IN STD_LOGIC
);
end COMPONENT;
COMPONENT DEBUGGER is Port ( 
	H     : in  STD_LOGIC;
   RESET : in  STD_LOGIC;
	ENABLE: in  STD_LOGIC;
	VAR1  : in  STD_LOGIC_VECTOR(31 downto 0);
	VAR2  : in  STD_LOGIC_VECTOR(31 downto 0);
	VAR3  : in  STD_LOGIC_VECTOR(31 downto 0);
	VAR4  : in  STD_LOGIC_VECTOR(31 downto 0);
	SERIAL: OUT STD_LOGIC
);
end COMPONENT;
COMPONENT DEBUGGER2 is Port ( 
	H     : in  STD_LOGIC;
   RESET : in  STD_LOGIC;
	BOUTON: in  STD_LOGIC;
	VAR   : OUT STD_LOGIC_VECTOR(31 downto 0)
);
end COMPONENT;
component SERIAL_ASSEMBLER is Port ( 
	H     : in  STD_LOGIC;
   RESET : in  STD_LOGIC;
	RX    : in  STD_LOGIC;
	VAR   : out STD_LOGIC_VECTOR(31 downto 0);
	READY : out STD_LOGIC;
	ERROR : out STD_LOGIC
);
end component;

--------------------------------_DECLARATION DE SIGNAUX----------------------------
TYPE RAMBLOCK is array(0 to 255) of STD_LOGIC_VECTOR(7 downto 0);
SIGNAL RAM: RAMBLOCK; 
SIGNAL DATA_IN, DATA_OUT: STD_LOGIC_VECTOR(7 downto 0);
SIGNAL MILIS, MICROS, SEC:STD_LOGIC_VECTOR(9 downto 0);
SIGNAL COD1, COD2, COD3, COD4: STD_LOGIC_VECTOR(1 downto 0);
SIGNAL POSX_CONTEUR, POSY_CONTEUR: STD_LOGIC_VECTOR(31 downto 0);
SIGNAL ROT_CONTEUR: STD_LOGIC_VECTOR(15 downto 0);
SIGNAL RELATION_CONTEUR: STD_LOGIC_VECTOR(23 downto 0);

--deprecated
SIGNAL MOT3, MOT4: STD_LOGIC_VECTOR(1 downto 0);

begin
-----------------------------MEMORY MAP----------------------------
--  1-MOT1
--  2-MOT2
--  3-MOT3 *
--  4-MOT4 *
--  6-  5-PWM1
--  8-  7-PWM2
--  9-  8-PWM3
-- 11- 10-PWM4
-- 13- 12-PWM5
-- 15- 14-PWM6
-- 17- 16-PWM7
-- 19- 18-PWM8
-- 21- 20-PWM9
-- 23- 22-PWM10
-- 25- 24-PWM11
-- 27- 26-PWM12
-- 29- 28-PWM13
-- 31- 30-PWM14
-- 33- 32-PWM15
-- 35- 34-PWM16
-- 39- 36-RELATION
--126- 36-RAM (en fait, reserved)
--127-RESET by software(RESERVED- RESERVED - DEBBUGER - COUNTEUR - PWM - SERVO - COUNTERROT - TIMER)
---------------------------READ-ONLY ADRESSES-------------
RAM(128) <= MICROS(7 downto 0);
RAM(129) <= "000000"&MICROS(9 downto 8);
RAM(130) <= MILIS(7 downto 0);
RAM(131) <= "000000"&MILIS(9 downto 8);
RAM(132) <= SEC(7 downto 0);
RAM(133) <= "000000"&SEC(9 downto 8);
RAM(134) <= POSX_CONTEUR(7 downto 0);
RAM(135) <= POSX_CONTEUR(15 downto 8);
RAM(136) <= POSX_CONTEUR(23 downto 16);
RAM(137) <= POSX_CONTEUR(31 downto 24);
RAM(138) <= POSY_CONTEUR(7 downto 0);
RAM(139) <= POSY_CONTEUR(15 downto 8);
RAM(140) <= POSY_CONTEUR(23 downto 16);
RAM(141) <= POSY_CONTEUR(31 downto 24);
RAM(142) <= ROT_CONTEUR(7 downto 0);
RAM(143) <= ROT_CONTEUR(15 downto 8);
RAM(144) <= "00000000";
RAM(145) <= "00000000";

	debug: DEBUGGER PORT MAP (
		H      => H,
		RESET  => RESET or RAM(127)(5),
		ENABLE => MILIS(6) and not(MILIS(5)or MILIS(4)or MILIS(3)or MILIS(2)or MILIS(1)),
		VAR1   => POSX_CONTEUR,
		VAR2   => POSY_CONTEUR,
		VAR3   => "0000000000000000"&ROT_CONTEUR,
		VAR4   => "0000000000000000000000"&SEC,
		SERIAL => LED
	);
	counterxyr1: COUNTEUR_XYR_HIRES PORT MAP (
		CODEUR1 => COD2,
		CODEUR2 => COD4,
		RELATION=> RAM(38)&RAM(37)&RAM(36),
		POSX    => POSX_CONTEUR,
		POSY    => POSY_CONTEUR,
		ROT     => ROT_CONTEUR,
		RESET   => RESET or RAM(127)(4),
		H       => H
	);
	counterrot1: COUNTER_ROTATIF PORT MAP (
		H    => H,
		SIG  => CODEUR1, 
		SORT => COD1,
		RESET=> RESET or RAM(127)(1)
	);
	counterrot2: COUNTER_ROTATIF PORT MAP (
		H    => H,
		SIG  => CODEUR2, 
		SORT => COD2,
		RESET=> RESET or RAM(127)(1)
	);
	pwm: PWM_GEN PORT MAP (
		H    => H,
		RESET => RESET or RAM(127)(3),
		VAL1 => RAM(0),
		VAL2 => RAM(1),
		VAL3 => RAM(2),
		VAL4 => RAM(3),
		PWM1 => MOT1,
		PWM2 => MOT2,
		PWM3 => MOT3,
		PWM4 => MOT4
	);
	timer: TIME_GENERATOR PORT MAP ( 
		H => H,
		RESET => RESET or RAM(127)(0),
		MICROS => MICROS,
		MILIS => MILIS,
		SEC => SEC
	);
	servos: SERVO_GEN PORT MAP(
		H     => H,
		RESET => RESET or RAM(127)(2),
		VAL0  => RAM(5 )&RAM(4 ),
		VAL1  => RAM(7 )&RAM(6 ),
		VAL2  => RAM(9 )&RAM(8 ),
		VAL3  => RAM(11)&RAM(10),
		VAL4  => RAM(13)&RAM(12),
		VAL5  => RAM(15)&RAM(14),
		VAL6  => RAM(17)&RAM(16),
		VAL7  => RAM(19)&RAM(18),
		VAL8  => RAM(21)&RAM(20),
		VAL9  => RAM(23)&RAM(22),
		VAL10 => RAM(25)&RAM(24),
		VAL11 => RAM(27)&RAM(26),
		VAL12 => RAM(29)&RAM(28),
		VAL13 => RAM(31)&RAM(30),
		VAL14	=> RAM(33)&RAM(32),
		VAL15 => RAM(35)&RAM(34),
		PWM => SERVO
	);
	DATA_OUT <= RAM(TO_INTEGER(UNSIGNED(ADDR)));
	DIRBUF2 <= '0'; -- ADDR toujor entre à la FPGA
	onWR:process(RESET,H)
	begin
		if(RESET='1')then
			DATA <= "ZZZZZZZZ";
			DATA_IN <= "00000000";
			DIRBUF1 <= '0';
		else
			if(H'event and H='1')then
				if(WR='1')then
					DATA <= "ZZZZZZZZ";
					DIRBUF1 <= '0';
				else
					DIRBUF1 <= '1';
					DATA <= DATA_OUT;
				end if;
				DATA_IN <= DATA;
			end if;
		end if;
	end process;
	onCommunication:process(RESET, RD)
	begin
		if(RESET = '1')then
			for a in 0 to 127 loop
				RAM(a) <= "00000000";
			end loop;
		else
			if(RD'event and RD='1')then
				if(ADDR(7)='0')then
					RAM(TO_INTEGER(UNSIGNED(ADDR(6 downto 0)))) <= DATA_IN;
				end if;
			end if;
		end if;
	end process;
end;
