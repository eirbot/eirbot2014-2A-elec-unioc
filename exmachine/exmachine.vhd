--   _______    __    ______     ______     _____    ________
--  |   ____|  |  |  |   _  \   |   _  \   / __  \  |___  ___|
--  |  |____   |  |  |  |_|  |  |  |_| /  | |  | |     |  |
--  |   ____|  |  |  |       |  |   _  \  | |  | |     |  |
--  |  |____   |  |  |  |\  \   |  |_| |  | |__| |     |  |
--  |_______|  |__|  |__| \__\  |______/   \_____/     |__|
--
library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity exmachine is port(
	H        : in  STD_LOGIC;
	RESET    : in  STD_LOGIC;
	--communication serial--commandes
	CLOCK_SPI: in  STD_LOGIC;
	MOSI_SPI : in  STD_LOGIC;
	MISO_SPI : out STD_LOGIC;
	CS_SPI   : in  STD_LOGIC;
	--Sorties pour les actuateurs
	MOT1     : out STD_LOGIC_VECTOR(1 downto 0);
	MOT2     : out STD_LOGIC_VECTOR(1 downto 0);
	MOT3     : out STD_LOGIC_VECTOR(1 downto 0);
	MOT4     : out STD_LOGIC_VECTOR(1 downto 0);
	SERVO    : out STD_LOGIC_VECTOR(15 downto 0);
	--Entrees des senseurs
	CODEUR1  : in  STD_LOGIC_VECTOR(1 downto 0);
	CODEUR2  : in  STD_LOGIC_VECTOR(1 downto 0);
	CODEUR3  : in  STD_LOGIC_VECTOR(1 downto 0);
	CODEUR4  : in  STD_LOGIC_VECTOR(1 downto 0)
);
end exmachine;

architecture comportement of exmachine is
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
	H_PWM : in  STD_LOGIC;
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
	H_SERVO : in  STD_LOGIC;
	RESET : in  STD_LOGIC;
	VAL0 : in  STD_LOGIC_VECTOR (7 downto 0);
	VAL1 : in  STD_LOGIC_VECTOR (7 downto 0);
	VAL2 : in  STD_LOGIC_VECTOR (7 downto 0);
	VAL3 : in  STD_LOGIC_VECTOR (7 downto 0);
	VAL4 : in  STD_LOGIC_VECTOR (7 downto 0);
	VAL5 : in  STD_LOGIC_VECTOR (7 downto 0);
	VAL6 : in  STD_LOGIC_VECTOR (7 downto 0);
	VAL7 : in  STD_LOGIC_VECTOR (7 downto 0);
	VAL8 : in  STD_LOGIC_VECTOR (7 downto 0);
	VAL9 : in  STD_LOGIC_VECTOR (7 downto 0);
	VAL10 : in  STD_LOGIC_VECTOR (7 downto 0);
	VAL11 : in  STD_LOGIC_VECTOR (7 downto 0);
	VAL12 : in  STD_LOGIC_VECTOR (7 downto 0);
	VAL13 : in  STD_LOGIC_VECTOR (7 downto 0);
	VAL14 : in  STD_LOGIC_VECTOR (7 downto 0);
	VAL15 : in  STD_LOGIC_VECTOR (7 downto 0);
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
COMPONENT COUNTEUR_XYR is Port (
	CODEUR1 : IN STD_LOGIC_VECTOR (1  downto 0);
	CODEUR2 : IN STD_LOGIC_VECTOR (1  downto 0);
	RELATION: IN STD_LOGIC_VECTOR (15 downto 0);
	POSX    : OUT STD_LOGIC_VECTOR (21 downto 0);
	POSY    : OUT STD_LOGIC_VECTOR (21 downto 0);
	ROT     : OUT STD_LOGIC_VECTOR (8 downto 0);  --0-360 degrees
	RESET   : IN STD_LOGIC;
	H       : IN STD_LOGIC
);
end COMPONENT;
--------------------------------_DECLARATION DE SIGNAUX----------------------------
TYPE enderecos is array(0 to 63) of STD_LOGIC_VECTOR(7 downto 0);
SIGNAL CONFIGS: enderecos; 
SIGNAL DATAMISO, DATAMOSI, LASTCOMMAND:STD_LOGIC_VECTOR(7 downto 0);
SIGNAL DATA_RCV, H_PWM, H_SERVO, ISCOMMAND:STD_LOGIC;
SIGNAL MILIS, MICROS, SEC:STD_LOGIC_VECTOR(9 downto 0);
SIGNAL COD1, COD2, COD3, COD4: STD_LOGIC_VECTOR(1 downto 0);
SIGNAL nul1, nul2: STD_LOGIC_VECTOR(8 downto 0);
SIGNAL concat1, concat2, concat3, concat4: STD_LOGIC_VECTOR(21 downto 0);
SIGNAL concat5, concat6: STD_LOGIC_VECTOR(8 downto 0);
SIGNAL relation1, relation2, SERVO_replace: STD_LOGIC_VECTOR(15 downto 0);

begin
	----------------------READ-WRITE ADRESSES-------------------
	--CONFIGS(0) <= MOT1
	--CONFIGS(1) <= MOT2
	--CONFIGS(2) <= MOT3
	--CONFIGS(3) <= MOT4
	--CONFIGS(4) <= SERVO1
	--CONFIGS(5) <= SERVO2
	--CONFIGS(6) <= SERVO3
	--CONFIGS(7) <= SERVO4
	--CONFIGS(8) <= SERVO5
	--CONFIGS(9) <= SERVO6
	--CONFIGS(10) <= SERVO7
	--CONFIGS(11) <= SERVO8
	--CONFIGS(12) <= SERVO9
	--CONFIGS(13) <= SERVO10
	--CONFIGS(14) <= SERVO11
	--CONFIGS(15) <= SERVO12
	--CONFIGS(16) <= SERVO13
	--CONFIGS(17) <= SERVO14
	--CONFIGS(18) <= SERVO15
	--CONFIGS(19) <= SERVO16
	
	--CONFIGS(20) <= "00000000";
	--CONFIGS(21) <= "00000000";
	--CONFIGS(22) <= "00000000";
	--CONFIGS(23) <= "00000000";
	--CONFIGS(24) <= "00000000";
	--CONFIGS(25) <= "00000000";
	--CONFIGS(26) <= "00000000";
	--CONFIGS(27) <= "00000000";
	
	--CONFIGS(28) <= relation1(7 downto 0);
	--CONFIGS(29) <= relation1(15 downto 8);
	--CONFIGS(30) <= relation2(7 downto 0);
	--CONFIGS(31) <= relation2(15 downto 8);
	----------------------READING ONLY ADRESSES-------------------
	CONFIGS(32) <= "00000000";
	CONFIGS(33) <= "00000000";
	CONFIGS(34) <= "00000000";
	CONFIGS(35) <= "00000000";
	CONFIGS(36) <= "00000000";
	CONFIGS(37) <= "00000000";
	CONFIGS(38) <= "00000000";
	CONFIGS(39) <= "00000000";
	CONFIGS(40) <= "00000000";
	CONFIGS(41) <= "00000000";
	
	CONFIGS(42) <= MICROS(7 downto 0);
	CONFIGS(43) <= "000000" & MICROS(9 downto 8);
	CONFIGS(44) <= MILIS(7 downto 0);
	CONFIGS(45) <= "000000" & MILIS(9 downto 8);
	CONFIGS(46) <= SEC(7 downto 0);
	CONFIGS(47) <= "000000" & SEC(9 downto 8);
	
	CONFIGS(48) <= concat1(7 downto 0);
	CONFIGS(49) <= concat1(15 downto 8);
	CONFIGS(50) <= "00" &concat1(21 downto 16);
	CONFIGS(51) <= concat2(7 downto 0);
	CONFIGS(52) <= concat2(15 downto 8);
	CONFIGS(53) <= "00" &concat2(21 downto 16);
	CONFIGS(54) <= concat5(7 downto 0);
	CONFIGS(55) <= "0000000" & concat5(8);
	CONFIGS(56) <= concat3(7 downto 0);
	CONFIGS(57) <= concat3(15 downto 8);
	CONFIGS(58) <= "00" &concat3(21 downto 16);
	CONFIGS(59) <= concat4(7 downto 0);
	CONFIGS(60) <= concat4(15 downto 8);
	CONFIGS(61) <= "00" &concat4(21 downto 16);
	CONFIGS(62) <= concat6(7 downto 0);
	CONFIGS(63) <= "0000000" & concat6(8);
	
	H_PWM<=MICROS(4);
	H_SERVO<=MICROS(2);
	SERVO <= "00000000"&RESET&concat1(14 downto 8);
	------------------------------DECLARATION DE COMPOSANTS-------------------
	counterxyr1: COUNTEUR_XYR PORT MAP (
		CODEUR1 => COD2,
		CODEUR2 => COD4,
		RELATION=> CONFIGS(28)&CONFIGS(29),
		POSX    => concat1,
		POSY    => concat2,
		ROT     => concat5,
		RESET   => not RESET,
		H       => H
	);
	counterxyr2: COUNTEUR_XYR PORT MAP (
		CODEUR1 => COD1,
		CODEUR2 => COD3,
		RELATION=> CONFIGS(30)&CONFIGS(31),
		POSX    => concat3,
		POSY    => concat4,
		ROT     => concat6,
		RESET   => not RESET,
		H       => H
	);
	counterrot1: COUNTER_ROTATIF PORT MAP (
		H    => H,
		SIG  => CODEUR1, 
		SORT => COD1,
		RESET=> not RESET
	);
	counterrot2: COUNTER_ROTATIF PORT MAP (
		H    => H,
		SIG  => CODEUR2, 
		SORT => COD2,
		RESET=> not RESET	
	);
	counterrot3: COUNTER_ROTATIF PORT MAP (
		H    => H,
		SIG  => CODEUR3, 
		SORT => COD3,
		RESET=> not RESET
	);
	counterrot4: COUNTER_ROTATIF PORT MAP (
		H    => H,
		SIG  => CODEUR4, 
		SORT => COD4,
		RESET=> not RESET
	);
	spi: SPI_SLAVE PORT MAP (
		CLOCK =>CLOCK_SPI,
		RESET =>not RESET,
		MISO =>MISO_SPI,
		MOSI =>MOSI_SPI,
		CS =>CS_SPI,
		DATAMISO=> DATAMISO,
		DATAMOSI=> DATAMOSI,
		DATA_RCV=>DATA_RCV	
	);
	pwm: PWM_GEN PORT MAP (
		H_PWM => H_PWM,
		RESET => not RESET,
		VAL1 => CONFIGS(0),
		VAL2 => CONFIGS(1),
		VAL3 => CONFIGS(2),
		VAL4 => CONFIGS(3),
		PWM1 => MOT1,
		PWM2 => MOT2,
		PWM3 => MOT3,
		PWM4 => MOT4
	);
	timer: TIME_GENERATOR PORT MAP ( 
		H => H,
		RESET => not RESET,
		MICROS => MICROS,
		MILIS => MILIS,
		SEC => SEC
	);
	servos: SERVO_GEN PORT MAP(
		H_SERVO =>H_SERVO,
		RESET => not RESET,
		VAL0 => CONFIGS(4),
		VAL1 => CONFIGS(5),
		VAL2 => CONFIGS(6),
		VAL3	=> CONFIGS(7),
		VAL4 => CONFIGS(8),
		VAL5 => CONFIGS(9),
		VAL6 => CONFIGS(10),
		VAL7 => CONFIGS(11),
		VAL8 => CONFIGS(12),
		VAL9 => CONFIGS(13),
		VAL10 => CONFIGS(14),
		VAL11 => CONFIGS(15),
		VAL12 => CONFIGS(16),
		VAL13 => CONFIGS(17),
		VAL14	=> CONFIGS(18),
		VAL15 => CONFIGS(19),
		PWM => SERVO_replace
	);
	onCommunication:process(DATA_RCV, RESET)
	begin
		if(RESET = '0')then
			for i in 0 to 27 loop
				CONFIGS(i) <= "00000000";
			end loop;
			CONFIGS(28) <= "00011000";
			CONFIGS(29) <= "11110011";
			CONFIGS(30) <= "00011000";
			CONFIGS(31) <= "11110011";
			ISCOMMAND <= '0';
			LASTCOMMAND <= "00000000";
		else
			if(DATA_RCV'event and DATA_RCV='0')then
				if(ISCOMMAND='0')then
					LASTCOMMAND<=DATAMOSI;
					ISCOMMAND <= '1';
					DATAMISO <= CONFIGS(TO_INTEGER(UNSIGNED(DATAMOSI(5 downto 0))));
				else
					if(LASTCOMMAND(7)='1')then --SET REG
						if(LASTCOMMAND(5)='0')then
							CONFIGS(TO_INTEGER(UNSIGNED(LASTCOMMAND(4 downto 0))))<=DATAMOSI;
							DATAMISO <= DATAMOSI;
						else
							DATAMISO <= "11111111";
						end if;
					end if;
				end if;
			end if;
		end if;
	end process;





end;
