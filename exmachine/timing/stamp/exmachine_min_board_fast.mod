/*
 Copyright (C) 1991-2013 Altera Corporation
 Your use of Altera Corporation's design tools, logic functions 
 and other software and tools, and its AMPP partner logic 
 functions, and any output files from any of the foregoing 
 (including device programming or simulation files), and any 
 associated documentation or information are expressly subject 
 to the terms and conditions of the Altera Program License 
 Subscription Agreement, Altera MegaCore Function License 
 Agreement, or other applicable license agreement, including, 
 without limitation, that your use is for the sole purpose of 
 programming logic devices manufactured by Altera and sold by 
 Altera or its authorized distributors.  Please refer to the 
 applicable agreement for further details.
*/
MODEL
/*MODEL HEADER*/
/*
 This file contains Fast Corner delays for the design using part EP2C5T144C8
 with speed grade M, core voltage Auto, and temperature 2147483647 Celsius

*/
MODEL_VERSION "1.0";
DESIGN "exmachine";
DATE "10/25/2013 22:26:33";
PROGRAM "Quartus II 64-Bit";



INPUT RESET;
INPUT CS_SPI;
INPUT CLOCK_SPI;
INPUT MOSI_SPI;
INPUT H;
INPUT CODEUR4[1];
INPUT CODEUR4[0];
INPUT CODEUR2[0];
INPUT CODEUR2[1];
INPUT CODEUR3[0];
INPUT CODEUR3[1];
INPUT CODEUR1[1];
INPUT CODEUR1[0];
OUTPUT MISO_SPI;
OUTPUT MOT1[0];
OUTPUT MOT1[1];
OUTPUT MOT2[0];
OUTPUT MOT2[1];
OUTPUT MOT3[0];
OUTPUT MOT3[1];
OUTPUT MOT4[0];
OUTPUT MOT4[1];
OUTPUT SERVO[0];
OUTPUT SERVO[1];
OUTPUT SERVO[2];
OUTPUT SERVO[3];
OUTPUT SERVO[4];
OUTPUT SERVO[5];
OUTPUT SERVO[6];
OUTPUT SERVO[7];
OUTPUT SERVO[8];
OUTPUT SERVO[9];
OUTPUT SERVO[10];
OUTPUT SERVO[11];
OUTPUT SERVO[12];
OUTPUT SERVO[13];
OUTPUT SERVO[14];
OUTPUT SERVO[15];

/*Arc definitions start here*/
pos_CS_SPI__CLOCK_SPI__setup:		SETUP (POSEDGE) CS_SPI CLOCK_SPI ;
pos_MOSI_SPI__CLOCK_SPI__setup:		SETUP (POSEDGE) MOSI_SPI CLOCK_SPI ;
pos_RESET__CLOCK_SPI__setup:		SETUP (POSEDGE) RESET CLOCK_SPI ;
pos_CODEUR1[0]__H__setup:		SETUP (POSEDGE) CODEUR1[0] H ;
pos_CODEUR1[1]__H__setup:		SETUP (POSEDGE) CODEUR1[1] H ;
pos_CODEUR2[0]__H__setup:		SETUP (POSEDGE) CODEUR2[0] H ;
pos_CODEUR2[1]__H__setup:		SETUP (POSEDGE) CODEUR2[1] H ;
pos_CODEUR3[0]__H__setup:		SETUP (POSEDGE) CODEUR3[0] H ;
pos_CODEUR3[1]__H__setup:		SETUP (POSEDGE) CODEUR3[1] H ;
pos_CODEUR4[0]__H__setup:		SETUP (POSEDGE) CODEUR4[0] H ;
pos_CODEUR4[1]__H__setup:		SETUP (POSEDGE) CODEUR4[1] H ;
pos_RESET__H__setup:		SETUP (POSEDGE) RESET H ;
pos_RESET__SPI_SLAVE:spi|DATA_RCV__setup:		SETUP (POSEDGE) RESET SPI_SLAVE:spi|DATA_RCV ;
pos_CS_SPI__CLOCK_SPI__hold:		HOLD (POSEDGE) CS_SPI CLOCK_SPI ;
pos_MOSI_SPI__CLOCK_SPI__hold:		HOLD (POSEDGE) MOSI_SPI CLOCK_SPI ;
pos_RESET__CLOCK_SPI__hold:		HOLD (POSEDGE) RESET CLOCK_SPI ;
pos_CODEUR1[0]__H__hold:		HOLD (POSEDGE) CODEUR1[0] H ;
pos_CODEUR1[1]__H__hold:		HOLD (POSEDGE) CODEUR1[1] H ;
pos_CODEUR2[0]__H__hold:		HOLD (POSEDGE) CODEUR2[0] H ;
pos_CODEUR2[1]__H__hold:		HOLD (POSEDGE) CODEUR2[1] H ;
pos_CODEUR3[0]__H__hold:		HOLD (POSEDGE) CODEUR3[0] H ;
pos_CODEUR3[1]__H__hold:		HOLD (POSEDGE) CODEUR3[1] H ;
pos_CODEUR4[0]__H__hold:		HOLD (POSEDGE) CODEUR4[0] H ;
pos_CODEUR4[1]__H__hold:		HOLD (POSEDGE) CODEUR4[1] H ;
pos_RESET__H__hold:		HOLD (POSEDGE) RESET H ;
pos_RESET__SPI_SLAVE:spi|DATA_RCV__hold:		HOLD (POSEDGE) RESET SPI_SLAVE:spi|DATA_RCV ;
pos_CLOCK_SPI__MISO_SPI__delay:		DELAY (POSEDGE) CLOCK_SPI MISO_SPI ;
pos_H__SERVO[0]__delay:		DELAY (POSEDGE) H SERVO[0] ;
pos_H__SERVO[1]__delay:		DELAY (POSEDGE) H SERVO[1] ;
pos_H__SERVO[2]__delay:		DELAY (POSEDGE) H SERVO[2] ;
pos_H__SERVO[3]__delay:		DELAY (POSEDGE) H SERVO[3] ;
pos_H__SERVO[4]__delay:		DELAY (POSEDGE) H SERVO[4] ;
pos_H__SERVO[5]__delay:		DELAY (POSEDGE) H SERVO[5] ;
pos_H__SERVO[6]__delay:		DELAY (POSEDGE) H SERVO[6] ;
pos_SPI_SLAVE:spi|DATA_RCV__MOT1[1]__delay:		DELAY (POSEDGE) SPI_SLAVE:spi|DATA_RCV MOT1[1] ;
pos_SPI_SLAVE:spi|DATA_RCV__MOT2[1]__delay:		DELAY (POSEDGE) SPI_SLAVE:spi|DATA_RCV MOT2[1] ;
pos_SPI_SLAVE:spi|DATA_RCV__MOT3[1]__delay:		DELAY (POSEDGE) SPI_SLAVE:spi|DATA_RCV MOT3[1] ;
pos_SPI_SLAVE:spi|DATA_RCV__MOT4[1]__delay:		DELAY (POSEDGE) SPI_SLAVE:spi|DATA_RCV MOT4[1] ;
pos_TIME_GENERATOR:timer|int_micros[4]__MOT1[0]__delay:		DELAY (POSEDGE) TIME_GENERATOR:timer|int_micros[4] MOT1[0] ;
pos_TIME_GENERATOR:timer|int_micros[4]__MOT2[0]__delay:		DELAY (POSEDGE) TIME_GENERATOR:timer|int_micros[4] MOT2[0] ;
pos_TIME_GENERATOR:timer|int_micros[4]__MOT3[0]__delay:		DELAY (POSEDGE) TIME_GENERATOR:timer|int_micros[4] MOT3[0] ;
pos_TIME_GENERATOR:timer|int_micros[4]__MOT4[0]__delay:		DELAY (POSEDGE) TIME_GENERATOR:timer|int_micros[4] MOT4[0] ;
___5.126__delay:		DELAY  5.126 ;

ENDMODEL
