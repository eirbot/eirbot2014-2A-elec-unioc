--   _______    __    ______     ______     _____    ________
--  |   ____|  |  |  |   _  \   |   _  \   / __  \  |___  ___|
--  |  |____   |  |  |  |_|  |  |  |_| /  | |  | |     |  |
--  |   ____|  |  |  |       |  |   _  \  | |  | |     |  |
--  |  |____   |  |  |  |\  \   |  |_| |  | |__| |     |  |
--  |_______|  |__|  |__| \__\  |______/   \_____/     |__|
--
-- Module: TOP_UNIOC
-- But: Interconnecter les elements
--
library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity TOP_UNIOC is port(
	H         : in    STD_LOGIC;
	RESET     : in    STD_LOGIC;
	--Connections avec l'AVR
	DATA      : inout STD_LOGIC_VECTOR(7 downto 0);
	ADDR      : in    STD_LOGIC_VECTOR(7 downto 0);
	RD        : in    STD_LOGIC;
	WR        : in    STD_LOGIC;
	ALE       : in    STD_LOGIC;
	DIRBUF1   : out   STD_LOGIC;
	DIRBUF2   : out   STD_LOGIC;
	--Sorties pour les actuateurs
	MOT1      : out   STD_LOGIC_VECTOR(1 downto 0);
	MOT2      : out   STD_LOGIC_VECTOR(1 downto 0);
	SERVO_D   : out   STD_LOGIC;
	SERVO_C1  : out   STD_LOGIC;
	SERVO_C2  : out   STD_LOGIC;
	SERVO_C3  : out   STD_LOGIC;
	SERVO_C4  : out   STD_LOGIC;
	--Entrees des senseurs
	CODEUR1   : in    STD_LOGIC_VECTOR(1 downto 0);
	CODEUR2   : in    STD_LOGIC_VECTOR(1 downto 0);
	CODEUR3   : in    STD_LOGIC_VECTOR(1 downto 0);
	CODEUR4   : in    STD_LOGIC_VECTOR(1 downto 0);
	--Connections UART
	UART_TX_1  : OUT   STD_LOGIC;
	UART_RX_1  : IN    STD_LOGIC;
	UART_TX_2  : OUT   STD_LOGIC;
	UART_RX_2  : IN    STD_LOGIC;
	SPI_MISO_1 : OUT   STD_LOGIC;
	SPI_MOSI_1 : IN    STD_LOGIC;
	SPI_MISO_2 : OUT   STD_LOGIC;
	SPI_MOSI_2 : IN    STD_LOGIC;
	SPI_H_1    : IN    STD_LOGIC;
	SPI_H_2    : IN    STD_LOGIC;
	SPI_SS_1   : IN    STD_LOGIC;
	SPI_SS_2   : IN    STD_LOGIC
);
end TOP_UNIOC;

architecture comportement of TOP_UNIOC is
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
	PWM1 : out STD_LOGIC_VECTOR (1 downto 0);
	PWM2 : out STD_LOGIC_VECTOR (1 downto 0)
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
COMPONENT SERVO_SERIAL is Port ( 
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
	DATA_OUT: out STD_LOGIC;
	CLK0_OUT: out STD_LOGIC;
	CLK1_OUT: out STD_LOGIC;
	CLK2_OUT: out STD_LOGIC;
	CLK3_OUT: out STD_LOGIC
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
	RESET_X : IN  STD_LOGIC_VECTOR (31 downto 0);
	RESET_Y : IN  STD_LOGIC_VECTOR (31 downto 0);
	RESET_R : IN  STD_LOGIC_VECTOR (15 downto 0);
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
component XRAM_SLAVE is port(
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
end component;
component COMPTEUR_32 is port(
	H     : in  STD_LOGIC;
	RESET : in  STD_LOGIC;
	INC   : in  STD_LOGIC;
	DEC   : in  STD_LOGIC;
	V     : OUT STD_LOGIC_VECTOR(31 downto 0)
);
end component;
component UART_TX_FIFO is port(
	H            : in  STD_LOGIC;
	RESET        : in  STD_LOGIC;
	TX           : out STD_LOGIC;
	WRITE_STROBE : in  STD_LOGIC;
	BR           : in  STD_LOGIC_VECTOR(15 downto 0);
	WRITE_DATA   : in  STD_LOGIC_VECTOR(7 downto 0);
	AVAILABLE    : out STD_LOGIC_VECTOR(7 downto 0)
);
end component;
component UART_RX_FIFO is port(
	H           : in  STD_LOGIC;
	RESET       : in  STD_LOGIC;
	RX          : in  STD_LOGIC;
	READ_STROBE : in  STD_LOGIC;
	BR				: in  STD_LOGIC_VECTOR(15 downto 0);
	READ_DATA   : out STD_LOGIC_VECTOR(7 downto 0);
	AVAILABLE   : out STD_LOGIC_VECTOR(7 downto 0)
);
end component;
-----------------------------------------------------------------------------------
--------------------------------_DECLARATION DE SIGNAUX----------------------------
SIGNAL DATA_IN, DATA_OUT: STD_LOGIC_VECTOR(7 downto 0);
SIGNAL ADDRESS : STD_LOGIC_VECTOR(15 downto 0);
SIGNAL cod1, cod2, cod3, cod4: STD_LOGIC_VECTOR(1 downto 0);


SIGNAL MOTEUR1, MOTEUR2, MOTEUR3, MOTEUR4 : STD_LOGIC_VECTOR(7 downto 0);
SIGNAL SERVO1,  SERVO2,  SERVO3,  SERVO4  : STD_LOGIC_VECTOR(15 downto 0);
SIGNAL SERVO5,  SERVO6,  SERVO7,  SERVO8  : STD_LOGIC_VECTOR(15 downto 0);
SIGNAL SERVO9,  SERVO10, SERVO11, SERVO12 : STD_LOGIC_VECTOR(15 downto 0);
SIGNAL SERVO13, SERVO14, SERVO15, SERVO16 : STD_LOGIC_VECTOR(15 downto 0);
SIGNAL RELATION : STD_LOGIC_VECTOR(23 downto 0);
SIGNAL SOFT_RESET : STD_LOGIC_VECTOR(7 downto 0);
SIGNAL MILIS_FPGA, MICROS_FPGA, SEC_FPGA : STD_LOGIC_VECTOR(9 downto 0);
SIGNAL POSX_FPGA, POSY_FPGA: STD_LOGIC_VECTOR(31 downto 0);
SIGNAL ROT_FPGA: STD_LOGIC_VECTOR(15 downto 0);
SIGNAL RESET_X_FPGA, RESET_Y_FPGA: STD_LOGIC_VECTOR(31 downto 0);
SIGNAL RESET_R_FPGA: STD_LOGIC_VECTOR(15 downto 0);
SIGNAL COMPT1,  COMPT2,  COMPT3,  COMPT4  : STD_LOGIC_VECTOR(31 downto 0);
SIGNAL UART_RX_1_DATA, UART_RX_1_AVA : STD_LOGIC_VECTOR(7 downto 0);
SIGNAL UART_RX_2_DATA, UART_RX_2_AVA : STD_LOGIC_VECTOR(7 downto 0);
SIGNAL UART_RX_3_DATA, UART_RX_3_AVA : STD_LOGIC_VECTOR(7 downto 0);
SIGNAL UART_RX_4_DATA, UART_RX_4_AVA : STD_LOGIC_VECTOR(7 downto 0);
SIGNAL UART_TX_1_DATA, UART_TX_1_AVA : STD_LOGIC_VECTOR(7 downto 0);
SIGNAL UART_TX_2_DATA, UART_TX_2_AVA : STD_LOGIC_VECTOR(7 downto 0);
SIGNAL UART_TX_3_DATA, UART_TX_3_AVA : STD_LOGIC_VECTOR(7 downto 0);
SIGNAL UART_TX_4_DATA, UART_TX_4_AVA : STD_LOGIC_VECTOR(7 downto 0);
SIGNAL tx1c, tx2c, tx3c, tx4c, rx1c, rx2c, rx3c, rx4c: STD_LOGIC;
CONSTANT retardRead : Integer := 10; 
signal retardReadStrobe1: STD_LOGIC_VECTOR(retardRead downto 0);
signal retardReadStrobe2: STD_LOGIC_VECTOR(retardRead downto 0);
signal retardReadStrobe3: STD_LOGIC_VECTOR(retardRead downto 0);
signal retardReadStrobe4: STD_LOGIC_VECTOR(retardRead downto 0);
Signal writestrobe, readstrobe, comm: STD_LOGIC;
Signal BR1, BR2, BR3, BR4: STD_LOGIC_VECTOR(15 downto 0);
--Signal inta: Integer;
begin
	-----------------------------MEMORY MAP----------------------------
	--  1-MOT1
	--  2-MOT2
	--  3-RESERVED
	--  4-RESERVED
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
	-- 40-UART_TX_1_DATA
	-- 41-UART_TX_2_DATA
	-- 42-UART_TX_3_DATA
	-- 43-UART_TX_4_DATA
	--126- 36-reserved
	--127-RESET by software(RESERVED- RESERVED - DEBBUGER - COUNTEUR - PWM - SERVO - COUNTERROT - TIMER)
	---------------------------READ-ONLY ADRESSES-------------
	--129-128-MICROS_FPGA
	--131-130-MILIS_FPGA
	--133-132-SEC_FPGA
	--135-134-read as 0
	--139-136-POSX_FPGA
	--143-140-POSY_FPGA
	--145-144-ROT_FPGA
	--147-146-read as 0
	--151-148-COMPT1
	--155-152-COMPT2
	--159-156-COMPT3
	--163-160-COMPT4
	--164-UART_TX_1_AVA
	--165-UART_TX_2_AVA
	--166-UART_TX_3_AVA
	--167-UART_TX_4_AVA
	--168-UART_RX_1_DATA
	--169-UART_RX_2_DATA
	--170-UART_RX_3_DATA
	--171-UART_RX_4_DATA
	--172-UART_RX_1_AVA
	--173-UART_RX_2_AVA
	--174-UART_RX_3_AVA
	--175-UART_RX_4_AVA
	--255-176-read as 0
	----------------------------------MODULES----------------------------------------
	moteurs: PWM_GEN PORT MAP (
		H     => H,
		RESET => RESET or SOFT_RESET(3),
		VAL1  => MOTEUR1,
		VAL2  => MOTEUR2,
		PWM1  => MOT1,
		PWM2  => MOT2
	);
	servos: SERVO_SERIAL Port MAP (
		H        => H,
		RESET    => RESET or SOFT_RESET(2),
		VAL0     => SERVO1,
		VAL1     => SERVO2,
		VAL2     => SERVO3,
		VAL3     => SERVO4,
		VAL4     => SERVO5,
		VAL5     => SERVO6,
		VAL6     => SERVO7,
		VAL7     => SERVO8,
		VAL8     => SERVO9,
		VAL9     => SERVO10,
		VAL10    => SERVO11,
		VAL11    => SERVO12,
		VAL12    => SERVO13,
		VAL13    => SERVO14,
		VAL14	   => SERVO15,
		VAL15    => SERVO16,
		DATA_OUT => SERVO_D,
		CLK0_OUT => SERVO_C1,
		CLK1_OUT => SERVO_C2,
		CLK2_OUT => SERVO_C3,
		CLK3_OUT => SERVO_C4 
	);
	timer: TIME_GENERATOR PORT MAP ( 
		H => H,
		RESET => RESET or SOFT_RESET(0),
		MICROS => MICROS_FPGA,
		MILIS => MILIS_FPGA,
		SEC => SEC_FPGA
	);
	counterrot1: COUNTER_ROTATIF PORT MAP (
		H    => H,
		SIG  => CODEUR1, 
		SORT => cod1,
		RESET=> RESET-- or SOFT_RESET(1)
	);
	counterrot2: COUNTER_ROTATIF PORT MAP (
		H    => H,
		SIG  => CODEUR2, 
		SORT => cod2,
		RESET=> RESET-- or SOFT_RESET(1)
	);
	counterrot3: COUNTER_ROTATIF PORT MAP (
		H    => H,
		SIG  => CODEUR3, 
		SORT => cod3,
		RESET=> RESET-- or SOFT_RESET(1)
	);
	counterrot4: COUNTER_ROTATIF PORT MAP (
		H    => H,
		SIG  => CODEUR4, 
		SORT => cod4,
		RESET=> RESET-- or SOFT_RESET(1)
	);
	counterxyr1: COUNTEUR_XYR_HIRES PORT MAP (
		CODEUR1 => cod2,
		CODEUR2 => cod4,
		RELATION=> RELATION,
		POSX    => POSX_FPGA,
		POSY    => POSY_FPGA,
		ROT     => ROT_FPGA,
		RESET_X => RESET_X_FPGA,
		RESET_Y => RESET_Y_FPGA,
		RESET_R => RESET_R_FPGA,
		RESET   => RESET or SOFT_RESET(4),
		H       => H
	);
	com1: COMPTEUR_32 port map(
		H     => H,
		RESET => RESET or SOFT_RESET(7),
		INC   => cod1(0),
		DEC   => cod1(1),
		V     => COMPT1
	);
	com2: COMPTEUR_32 port map(
		H     => H,
		RESET => RESET or SOFT_RESET(7),
		INC   => cod2(0),
		DEC   => cod2(1),
		V     => COMPT2
	);
	com3: COMPTEUR_32 port map(
		H     => H,
		RESET => RESET or SOFT_RESET(7),
		INC   => cod3(0),
		DEC   => cod3(1),
		V     => COMPT3
	);
	com4: COMPTEUR_32 port map(
		H     => H,
		RESET => RESET or SOFT_RESET(7),
		INC   => cod4(0),
		DEC   => cod4(1),
		V     => COMPT4
	);
	
	tx1: UART_TX_FIFO port map(
		H            => H,
		RESET        => RESET,
		TX           => UART_TX_1,
		WRITE_STROBE => tx1c,
		BR           => BR1,--x"A2C0",
		WRITE_DATA   => UART_TX_1_DATA,
		AVAILABLE    => UART_TX_1_AVA
	);
	rx1: UART_RX_FIFO port map(
		H           => H,
		RESET       => RESET,
		RX          => UART_RX_1,
		READ_STROBE => rx1c,
		BR          => BR1,--x"A2C0",
		READ_DATA   => UART_RX_1_DATA,
		AVAILABLE   => UART_RX_1_AVA
	);
	tx2: UART_TX_FIFO port map(
		H            => H,
		RESET        => RESET,
		TX           => UART_TX_2,
		WRITE_STROBE => tx2c,
		BR           => BR2,--x"A2C0",
		WRITE_DATA   => UART_TX_2_DATA,
		AVAILABLE    => UART_TX_2_AVA
	);
	rx2: UART_RX_FIFO port map(
		H           => H,
		RESET       => RESET,
		RX          => UART_RX_2,
		READ_STROBE => rx2c,
		BR          => BR2,--x"A2C0",
		READ_DATA   => UART_RX_2_DATA,
		AVAILABLE   => UART_RX_2_AVA
	);
--	tx3: UART_TX_FIFO port map(
--		H            => H,
--		RESET        => RESET,
--		TX           => UART_TX_3,
--		WRITE_STROBE => tx3c,
--		WRITE_DATA   => UART_TX_3_DATA,
--		AVAILABLE    => UART_TX_3_AVA
--	);
--	rx3: UART_RX_FIFO port map(
--		H           => H,
--		RESET       => RESET,
--		RX          => SPI_MOSI_1,
--		READ_STROBE => rx3c,
--		READ_DATA   => UART_RX_3_DATA,
--		AVAILABLE   => UART_RX_3_AVA
--	);
UART_RX_3_DATA <= "00000000";
UART_RX_3_AVA  <= "00000000";
UART_TX_3_AVA  <= "00000000";

--	tx4: UART_TX_FIFO port map(
--		H            => H,
--		RESET        => RESET,
--		TX           => UART_TX_4,
--		WRITE_STROBE => tx4c,
--		WRITE_DATA   => UART_TX_4_DATA,
--		AVAILABLE    => UART_TX_4_AVA
--	);

UART_RX_4_DATA <= "00000000";
UART_RX_4_AVA  <= "00000000";
UART_TX_4_AVA  <= "00000000";

--	UART_TX_1 <= MILIS_FPGA(7);
--	UART_TX_2 <= MILIS_FPGA(8);
	SPI_MISO_1 <= MILIS_FPGA(9);
--	tx4: DEBUGGER port map ( 
--		H      => H,
--		RESET  => RESET,
--		ENABLE => MILIS_FPGA(7) and not( MILIS_FPGA(6)or MILIS_FPGA(5)or MILIS_FPGA(4)or MILIS_FPGA(3)or MILIS_FPGA(2)or MILIS_FPGA(1)),
--		VAR1   => POSX_FPGA,
--		VAR2   => POSY_FPGA,
--		VAR3   => "00000000000000000000000"&ROT_FPGA(15 downto 7),
--		VAR4   => "0000000000000000000000"&SEC_FPGA,
--		SERIAL => SPI_MISO_2
--	);
--	rx4: UART_RX_FIFO port map(
--		H           => H,
--		RESET       => RESET,
--		RX          => SPI_MOSI_2,
--		READ_STROBE => rx4c,
--		READ_DATA   => UART_RX_4_DATA,
--		AVAILABLE   => UART_RX_4_AVA
--	);
	
	
	xram: XRAM_SLAVE port map(
		H          => H,
		RESET      => RESET,
		AD         => ADDR,
		DA         => DATA,
		RD         => RD,
		WR         => WR,
		DIR        => DIRBUF1,
		ALE        => ALE,
		WRITE_STB  => writestrobe,
		WRITE_DATA => DATA_IN,
		READ_STB   => readstrobe,
		READ_DATA  => DATA_OUT,
		ADDRESS    => ADDRESS
	);
	DIRBUF2 <= '0';--ADDR(15 downto 7) toujours entre à la FPGA
	
	LectureAssincrone: Process(ADDRESS, MOTEUR1, MOTEUR2, MOTEUR3, MOTEUR4, SERVO1, SERVO2, 
		SERVO3, SERVO4, SERVO5, SERVO6, SERVO7, SERVO8, SERVO9, SERVO10, SERVO11, SERVO12, SERVO13,
		SERVO14, SERVO15, SERVO16, RELATION, SOFT_RESET, MICROS_FPGA, MILIS_FPGA, SEC_FPGA, 
		POSX_FPGA, POSY_FPGA, ROT_FPGA, COMPT1, COMPT2, COMPT3, COMPT4, UART_TX_1_DATA, UART_TX_2_DATA,
		UART_TX_3_DATA, UART_TX_4_DATA, UART_TX_1_AVA, UART_TX_2_AVA, UART_TX_3_AVA, UART_TX_4_AVA,
		UART_RX_1_DATA, UART_RX_2_DATA, UART_RX_3_DATA, UART_RX_4_DATA, UART_RX_1_AVA, UART_RX_2_AVA,
		UART_RX_3_AVA, UART_RX_4_AVA )
	begin
		case(ADDRESS(7 downto 0))is
			when x"00"=> DATA_OUT <= MOTEUR1;
			when x"01"=> DATA_OUT <= MOTEUR2;
			when x"02"=> DATA_OUT <= MOTEUR3;
			when x"03"=> DATA_OUT <= MOTEUR4;
			when x"04"=> DATA_OUT <= SERVO1(7 downto 0);
			when x"05"=> DATA_OUT <= SERVO1(15 downto 8);
			when x"06"=> DATA_OUT <= SERVO2(7 downto 0);
			when x"07"=> DATA_OUT <= SERVO2(15 downto 8);
			when x"08"=> DATA_OUT <= SERVO3(7 downto 0);
			when x"09"=> DATA_OUT <= SERVO3(15 downto 8);
			when x"0A"=> DATA_OUT <= SERVO4(7 downto 0);
			when x"0B"=> DATA_OUT <= SERVO4(15 downto 8);
			when x"0C"=> DATA_OUT <= SERVO5(7 downto 0);
			when x"0D"=> DATA_OUT <= SERVO5(15 downto 8);
			when x"0E"=> DATA_OUT <= SERVO6(7 downto 0);
			when x"0F"=> DATA_OUT <= SERVO6(15 downto 8);
			when x"10"=> DATA_OUT <= SERVO7(7 downto 0);
			when x"11"=> DATA_OUT <= SERVO7(15 downto 8);
			when x"12"=> DATA_OUT <= SERVO8(7 downto 0);
			when x"13"=> DATA_OUT <= SERVO8(15 downto 8);
			when x"14"=> DATA_OUT <= SERVO9(7 downto 0);
			when x"15"=> DATA_OUT <= SERVO9(15 downto 8);
			when x"16"=> DATA_OUT <= SERVO10(7 downto 0);
			when x"17"=> DATA_OUT <= SERVO10(15 downto 8);
			when x"18"=> DATA_OUT <= SERVO11(7 downto 0);
			when x"19"=> DATA_OUT <= SERVO11(15 downto 8);
			when x"1A"=> DATA_OUT <= SERVO12(7 downto 0);
			when x"1B"=> DATA_OUT <= SERVO12(15 downto 8);
			when x"1C"=> DATA_OUT <= SERVO13(7 downto 0);
			when x"1D"=> DATA_OUT <= SERVO13(15 downto 8);
			when x"1E"=> DATA_OUT <= SERVO14(7 downto 0);
			when x"1F"=> DATA_OUT <= SERVO14(15 downto 8);
			when x"20"=> DATA_OUT <= SERVO15(7 downto 0);
			when x"21"=> DATA_OUT <= SERVO15(15 downto 8);
			when x"22"=> DATA_OUT <= SERVO16(7 downto 0);
			when x"23"=> DATA_OUT <= SERVO16(15 downto 8);
			when x"24"=> DATA_OUT <= RELATION(7 downto 0);
			when x"25"=> DATA_OUT <= RELATION(15 downto 8);
			when x"26"=> DATA_OUT <= RELATION(23 downto 16);
			when x"27"=> DATA_OUT <= "00000000";
			when x"28"=> DATA_OUT <= UART_TX_1_DATA;
			when x"29"=> DATA_OUT <= UART_TX_2_DATA;
			when x"2A"=> DATA_OUT <= UART_TX_3_DATA;
			when x"2B"=> DATA_OUT <= UART_TX_4_DATA;
			when x"30"=> DATA_OUT <= BR1(7 downto 0);
			when x"31"=> DATA_OUT <= BR1(15 downto 8);
			when x"32"=> DATA_OUT <= BR2(7 downto 0);
			when x"33"=> DATA_OUT <= BR2(15 downto 8);
			
			---...			when x"007F"=> DATA_OUT <= SOFT_RESET;
			when x"80"=> DATA_OUT <= MICROS_FPGA(7 downto 0);
			when x"81"=> DATA_OUT <= "000000"&MICROS_FPGA(9 downto 8);
			when x"82"=> DATA_OUT <= MILIS_FPGA(7 downto 0);
			when x"83"=> DATA_OUT <= "000000"&MILIS_FPGA(9 downto 8);
			when x"84"=> DATA_OUT <= SEC_FPGA(7 downto 0);
			when x"85"=> DATA_OUT <= "000000"&SEC_FPGA(9 downto 8);
			when x"86"=> DATA_OUT <= "00000000";--j'ai lu à quelque part qui l'atmega
			when x"87"=> DATA_OUT <= "00000000";--ne considere pas des addresses 32bits qui ne sont multiples de 4.
			when x"88"=> DATA_OUT <= POSX_FPGA(7  downto 0 );
			when x"89"=> DATA_OUT <= POSX_FPGA(15 downto 8 );
			when x"8A"=> DATA_OUT <= POSX_FPGA(23 downto 16);
			when x"8B"=> DATA_OUT <= POSX_FPGA(31 downto 24);			
			when x"8C"=> DATA_OUT <= POSY_FPGA(7  downto 0 );
			when x"8D"=> DATA_OUT <= POSY_FPGA(15 downto 8 );
			when x"8E"=> DATA_OUT <= POSY_FPGA(23 downto 16);
			when x"8F"=> DATA_OUT <= POSY_FPGA(31 downto 24);
			when x"90"=> DATA_OUT <= ROT_FPGA(7  downto 0 );
			when x"91"=> DATA_OUT <= ROT_FPGA(15 downto 8 );
			when x"92"=> DATA_OUT <= "00000000";--avec ça, il est possible de lire le ROT comme
			when x"93"=> DATA_OUT <= "00000000";--s'il etait une variable 32bits
			when x"94"=> DATA_OUT <= COMPT1(7  downto 0 );
			when x"95"=> DATA_OUT <= COMPT1(15 downto 8 );
			when x"96"=> DATA_OUT <= COMPT1(23 downto 16);
			when x"97"=> DATA_OUT <= COMPT1(31 downto 24);
			when x"98"=> DATA_OUT <= COMPT2(7  downto 0 );
			when x"99"=> DATA_OUT <= COMPT2(15 downto 8 );
			when x"9A"=> DATA_OUT <= COMPT2(23 downto 16);
			when x"9B"=> DATA_OUT <= COMPT2(31 downto 24);
			when x"9C"=> DATA_OUT <= COMPT3(7  downto 0 );
			when x"9D"=> DATA_OUT <= COMPT3(15 downto 8 );
			when x"9E"=> DATA_OUT <= COMPT3(23 downto 16);
			when x"9F"=> DATA_OUT <= COMPT3(31 downto 24);
			when x"A0"=> DATA_OUT <= COMPT4(7  downto 0 );
			when x"A1"=> DATA_OUT <= COMPT4(15 downto 8 );
			when x"A2"=> DATA_OUT <= COMPT4(23 downto 16);
			when x"A3"=> DATA_OUT <= COMPT4(31 downto 24);
			when x"A4"=> DATA_OUT <= UART_TX_1_AVA;
			when x"A5"=> DATA_OUT <= UART_TX_2_AVA;
			when x"A6"=> DATA_OUT <= UART_TX_3_AVA;
			when x"A7"=> DATA_OUT <= UART_TX_4_AVA;
			when x"A8"=> DATA_OUT <= UART_RX_1_DATA;
			when x"A9"=> DATA_OUT <= UART_RX_2_DATA;
			when x"AA"=> DATA_OUT <= UART_RX_3_DATA;
			when x"AB"=> DATA_OUT <= UART_RX_4_DATA;
			when x"AC"=> DATA_OUT <= UART_RX_1_AVA;
			when x"AD"=> DATA_OUT <= UART_RX_2_AVA;
			when x"AE"=> DATA_OUT <= UART_RX_3_AVA;
			when x"AF"=> DATA_OUT <= UART_RX_4_AVA;
			
			when others=> DATA_OUT <= "00000000";
		end case;
	end process;
	
	tx1c <= '1' when ((writestrobe='1')and(ADDRESS(7 downto 0)=x"28"))else '0';
	tx2c <= '1' when ((writestrobe='1')and(ADDRESS(7 downto 0)=x"29"))else '0';
	tx3c <= '1' when ((writestrobe='1')and(ADDRESS(7 downto 0)=x"2A"))else '0';
	tx4c <= '1' when ((writestrobe='1')and(ADDRESS(7 downto 0)=x"2B"))else '0';
	retard: Process(H)
	variable a, b, c, d: STD_LOGIC;
	begin
		if((readstrobe='1')and(ADDRESS(7 downto 0)=x"A8"))then a:='1'; else a:= '0'; end if;
		if((readstrobe='1')and(ADDRESS(7 downto 0)=x"A9"))then b:='1'; else b:= '0'; end if;
		if((readstrobe='1')and(ADDRESS(7 downto 0)=x"AA"))then c:='1'; else c:= '0'; end if;
		if((readstrobe='1')and(ADDRESS(7 downto 0)=x"AB"))then d:='1'; else d:= '0'; end if;
		
		if(H'event and H='1')then
		   if(RESET='1')then
				retardReadStrobe1 <= (others=>'0');
				retardReadStrobe2 <= (others=>'0');
				retardReadStrobe3 <= (others=>'0');
				retardReadStrobe4 <= (others=>'0');
			else
				retardReadStrobe1 <= retardReadStrobe1(retardRead-1 downto 0) & a;
				retardReadStrobe2 <= retardReadStrobe2(retardRead-1 downto 0) & b;
				retardReadStrobe3 <= retardReadStrobe3(retardRead-1 downto 0) & c;
				retardReadStrobe4 <= retardReadStrobe4(retardRead-1 downto 0) & d;
			end if;
		end if;
	end process;
	rx1c <= retardReadStrobe1(retardRead);
	rx2c <= retardReadStrobe2(retardRead);
	rx3c <= retardReadStrobe3(retardRead);
	rx4c <= retardReadStrobe4(retardRead);
	
	Ecriture: Process(H)
	begin
		if(H'event and H='1')then
			if(RESET='1')then
				MOTEUR1 <= (others =>'0');
				MOTEUR2 <= (others =>'0');
				MOTEUR3 <= (others =>'0');
				MOTEUR4 <= (others =>'0');
				SERVO1 <= (others =>'0');
				SERVO2 <= (others =>'0');
				SERVO3 <= (others =>'0');
				SERVO4 <= (others =>'0');
				SERVO5 <= (others =>'0');
				SERVO6 <= (others =>'0');
				SERVO7 <= (others =>'0');
				SERVO8 <= (others =>'0');
				SERVO9 <= (others =>'0');
				SERVO10 <= (others =>'0');
				SERVO11 <= (others =>'0');
				SERVO12 <= (others =>'0');
				SERVO13 <= (others =>'0');
				SERVO14 <= (others =>'0');
				SERVO15 <= (others =>'0');
				SERVO16 <= (others =>'0');
				RELATION <= (others =>'0');
				SOFT_RESET <= "00000000";
				BR1 <= x"A2C0";
				BR2 <= x"A2C0";
				RESET_X_FPGA <= (others =>'0');
				RESET_Y_FPGA <= (others =>'0');
				RESET_R_FPGA <= (others =>'0');
			elsif(writestrobe='1')then
				--MOTEUR1 <= DATA_IN;
				--MOTEUR2 <= ADDRESS(15 downto 8);
				case(ADDRESS(7 downto 0))is
					when x"00"=> MOTEUR1 <= DATA_IN;
					when x"01"=> MOTEUR2 <= DATA_IN;
					when x"02"=> MOTEUR3 <= DATA_IN;
					when x"03"=> MOTEUR4 <= DATA_IN;
					when x"04"=> SERVO1(7 downto 0) <= DATA_IN;
					when x"05"=> SERVO1(15 downto 8) <= DATA_IN;
					when x"06"=> SERVO2(7 downto 0) <= DATA_IN;
					when x"07"=> SERVO2(15 downto 8) <= DATA_IN;
					when x"08"=> SERVO3(7 downto 0) <= DATA_IN;
					when x"09"=> SERVO3(15 downto 8) <= DATA_IN;
					when x"0A"=> SERVO4(7 downto 0) <= DATA_IN;
					when x"0B"=> SERVO4(15 downto 8) <= DATA_IN;
					when x"0C"=> SERVO5(7 downto 0) <= DATA_IN;
					when x"0D"=> SERVO5(15 downto 8) <= DATA_IN;
					when x"0E"=> SERVO6(7 downto 0) <= DATA_IN;
					when x"0F"=> SERVO6(15 downto 8) <= DATA_IN;
					when x"10"=> SERVO7(7 downto 0) <= DATA_IN;
					when x"11"=> SERVO7(15 downto 8) <= DATA_IN;
					when x"12"=> SERVO8(7 downto 0) <= DATA_IN;
					when x"13"=> SERVO8(15 downto 8) <= DATA_IN;
					when x"14"=> SERVO9(7 downto 0) <= DATA_IN;
					when x"15"=> SERVO9(15 downto 8) <= DATA_IN;
					when x"16"=> SERVO10(7 downto 0) <= DATA_IN;
					when x"17"=> SERVO10(15 downto 8) <= DATA_IN;
					when x"18"=> SERVO11(7 downto 0) <= DATA_IN;
					when x"19"=> SERVO11(15 downto 8) <= DATA_IN;
					when x"1A"=> SERVO12(7 downto 0) <= DATA_IN;
					when x"1B"=> SERVO12(15 downto 8) <= DATA_IN;
					when x"1C"=> SERVO13(7 downto 0) <= DATA_IN;
					when x"1D"=> SERVO13(15 downto 8) <= DATA_IN;
					when x"1E"=> SERVO14(7 downto 0) <= DATA_IN;
					when x"1F"=> SERVO14(15 downto 8) <= DATA_IN;
					when x"20"=> SERVO15(7 downto 0) <= DATA_IN;
					when x"21"=> SERVO15(15 downto 8) <= DATA_IN;
					when x"22"=> SERVO16(7 downto 0) <= DATA_IN;
					when x"23"=> SERVO16(15 downto 8) <= DATA_IN;
					when x"24"=> RELATION(7 downto 0) <= DATA_IN;
					when x"25"=> RELATION(15 downto 8) <= DATA_IN;
					when x"26"=> RELATION(23 downto 16) <= DATA_IN;
					when x"28"=> UART_TX_1_DATA <= DATA_IN;
					when x"29"=> UART_TX_2_DATA <= DATA_IN;
					when x"2A"=> UART_TX_3_DATA <= DATA_IN;
					when x"2B"=> UART_TX_4_DATA <= DATA_IN;
					when x"30"=> BR1(7 downto 0) <= DATA_IN;
					when x"31"=> BR1(15 downto 8)<= DATA_IN;
					when x"32"=> BR2(7 downto 0) <= DATA_IN;
					when x"33"=> BR2(15 downto 8)<= DATA_IN;
					when x"34"=> RESET_X_FPGA(7  downto 0 ) <= DATA_IN;
					when x"35"=> RESET_X_FPGA(15 downto 8 ) <= DATA_IN;
					when x"36"=> RESET_X_FPGA(23 downto 16) <= DATA_IN;
					when x"37"=> RESET_X_FPGA(31 downto 24) <= DATA_IN;		
					when x"38"=> RESET_Y_FPGA(7  downto 0 ) <= DATA_IN;
					when x"39"=> RESET_Y_FPGA(15 downto 8 ) <= DATA_IN;
					when x"3A"=> RESET_Y_FPGA(23 downto 16) <= DATA_IN;
					when x"3B"=> RESET_Y_FPGA(31 downto 24) <= DATA_IN;
					when x"3C"=> RESET_R_FPGA(7  downto 0 ) <= DATA_IN;
					when x"3D"=> RESET_R_FPGA(15 downto 8 ) <= DATA_IN;
					---...
					when x"7F"=> SOFT_RESET <= DATA_IN;
					when others=> NULL;
				end case;
			end if;
		end if;
	end process;
end architecture;