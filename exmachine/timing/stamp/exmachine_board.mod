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
 This file contains Slow Corner delays for the design using part EP2C5T144C8
 with speed grade 8, core voltage Auto, and temperature 2147483647 Celsius

*/
MODEL_VERSION "1.0";
DESIGN "exmachine";
DATE "11/02/2013 22:53:20";
PROGRAM "Quartus II 64-Bit";



INPUT RESET;
INPUT ADDR[6];
INPUT ADDR[3];
INPUT ADDR[5];
INPUT ADDR[4];
INPUT ADDR[7];
INPUT ADDR[2];
INPUT ADDR[0];
INPUT ADDR[1];
INOUT DATA[3];
INOUT DATA[0];
INOUT DATA[4];
INOUT DATA[1];
INPUT CODEUR2[0];
INPUT CODEUR2[1];
INPUT H;
INPUT RD;
INOUT DATA[2];
INOUT DATA[5];
INPUT WR;
INOUT DATA[6];
INOUT DATA[7];
OUTPUT DIRBUF1;
OUTPUT DIRBUF2;
OUTPUT MOT1[0];
OUTPUT MOT1[1];
OUTPUT MOT2[0];
OUTPUT MOT2[1];
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
OUTPUT LED;

/*Arc definitions start here*/
pos_ADDR[0]__H__setup:		SETUP (POSEDGE) ADDR[0] H ;
pos_ADDR[1]__H__setup:		SETUP (POSEDGE) ADDR[1] H ;
pos_ADDR[2]__H__setup:		SETUP (POSEDGE) ADDR[2] H ;
pos_ADDR[3]__H__setup:		SETUP (POSEDGE) ADDR[3] H ;
pos_ADDR[4]__H__setup:		SETUP (POSEDGE) ADDR[4] H ;
pos_ADDR[5]__H__setup:		SETUP (POSEDGE) ADDR[5] H ;
pos_ADDR[6]__H__setup:		SETUP (POSEDGE) ADDR[6] H ;
pos_ADDR[7]__H__setup:		SETUP (POSEDGE) ADDR[7] H ;
pos_CODEUR2[0]__H__setup:		SETUP (POSEDGE) CODEUR2[0] H ;
pos_CODEUR2[1]__H__setup:		SETUP (POSEDGE) CODEUR2[1] H ;
pos_DATA[0]__H__setup:		SETUP (POSEDGE) DATA[0] H ;
pos_DATA[1]__H__setup:		SETUP (POSEDGE) DATA[1] H ;
pos_DATA[2]__H__setup:		SETUP (POSEDGE) DATA[2] H ;
pos_DATA[3]__H__setup:		SETUP (POSEDGE) DATA[3] H ;
pos_DATA[4]__H__setup:		SETUP (POSEDGE) DATA[4] H ;
pos_DATA[5]__H__setup:		SETUP (POSEDGE) DATA[5] H ;
pos_DATA[6]__H__setup:		SETUP (POSEDGE) DATA[6] H ;
pos_DATA[7]__H__setup:		SETUP (POSEDGE) DATA[7] H ;
pos_RESET__H__setup:		SETUP (POSEDGE) RESET H ;
pos_WR__H__setup:		SETUP (POSEDGE) WR H ;
pos_ADDR[0]__RD__setup:		SETUP (POSEDGE) ADDR[0] RD ;
pos_ADDR[1]__RD__setup:		SETUP (POSEDGE) ADDR[1] RD ;
pos_ADDR[2]__RD__setup:		SETUP (POSEDGE) ADDR[2] RD ;
pos_ADDR[3]__RD__setup:		SETUP (POSEDGE) ADDR[3] RD ;
pos_ADDR[4]__RD__setup:		SETUP (POSEDGE) ADDR[4] RD ;
pos_ADDR[5]__RD__setup:		SETUP (POSEDGE) ADDR[5] RD ;
pos_ADDR[6]__RD__setup:		SETUP (POSEDGE) ADDR[6] RD ;
pos_ADDR[7]__RD__setup:		SETUP (POSEDGE) ADDR[7] RD ;
pos_ADDR[0]__H__hold:		HOLD (POSEDGE) ADDR[0] H ;
pos_ADDR[1]__H__hold:		HOLD (POSEDGE) ADDR[1] H ;
pos_ADDR[2]__H__hold:		HOLD (POSEDGE) ADDR[2] H ;
pos_ADDR[3]__H__hold:		HOLD (POSEDGE) ADDR[3] H ;
pos_ADDR[4]__H__hold:		HOLD (POSEDGE) ADDR[4] H ;
pos_ADDR[5]__H__hold:		HOLD (POSEDGE) ADDR[5] H ;
pos_ADDR[6]__H__hold:		HOLD (POSEDGE) ADDR[6] H ;
pos_ADDR[7]__H__hold:		HOLD (POSEDGE) ADDR[7] H ;
pos_CODEUR2[0]__H__hold:		HOLD (POSEDGE) CODEUR2[0] H ;
pos_CODEUR2[1]__H__hold:		HOLD (POSEDGE) CODEUR2[1] H ;
pos_DATA[0]__H__hold:		HOLD (POSEDGE) DATA[0] H ;
pos_DATA[1]__H__hold:		HOLD (POSEDGE) DATA[1] H ;
pos_DATA[2]__H__hold:		HOLD (POSEDGE) DATA[2] H ;
pos_DATA[3]__H__hold:		HOLD (POSEDGE) DATA[3] H ;
pos_DATA[4]__H__hold:		HOLD (POSEDGE) DATA[4] H ;
pos_DATA[5]__H__hold:		HOLD (POSEDGE) DATA[5] H ;
pos_DATA[6]__H__hold:		HOLD (POSEDGE) DATA[6] H ;
pos_DATA[7]__H__hold:		HOLD (POSEDGE) DATA[7] H ;
pos_RESET__H__hold:		HOLD (POSEDGE) RESET H ;
pos_WR__H__hold:		HOLD (POSEDGE) WR H ;
pos_ADDR[0]__RD__hold:		HOLD (POSEDGE) ADDR[0] RD ;
pos_ADDR[1]__RD__hold:		HOLD (POSEDGE) ADDR[1] RD ;
pos_ADDR[2]__RD__hold:		HOLD (POSEDGE) ADDR[2] RD ;
pos_ADDR[3]__RD__hold:		HOLD (POSEDGE) ADDR[3] RD ;
pos_ADDR[4]__RD__hold:		HOLD (POSEDGE) ADDR[4] RD ;
pos_ADDR[5]__RD__hold:		HOLD (POSEDGE) ADDR[5] RD ;
pos_ADDR[6]__RD__hold:		HOLD (POSEDGE) ADDR[6] RD ;
pos_ADDR[7]__RD__hold:		HOLD (POSEDGE) ADDR[7] RD ;
pos_H__DATA[0]__delay:		DELAY (POSEDGE) H DATA[0] ;
pos_H__DATA[1]__delay:		DELAY (POSEDGE) H DATA[1] ;
pos_H__DATA[2]__delay:		DELAY (POSEDGE) H DATA[2] ;
pos_H__DATA[3]__delay:		DELAY (POSEDGE) H DATA[3] ;
pos_H__DATA[4]__delay:		DELAY (POSEDGE) H DATA[4] ;
pos_H__DATA[5]__delay:		DELAY (POSEDGE) H DATA[5] ;
pos_H__DATA[6]__delay:		DELAY (POSEDGE) H DATA[6] ;
pos_H__DATA[7]__delay:		DELAY (POSEDGE) H DATA[7] ;
pos_H__DIRBUF1__delay:		DELAY (POSEDGE) H DIRBUF1 ;
pos_H__LED__delay:		DELAY (POSEDGE) H LED ;
pos_H__SERVO[0]__delay:		DELAY (POSEDGE) H SERVO[0] ;
pos_H__SERVO[1]__delay:		DELAY (POSEDGE) H SERVO[1] ;
pos_H__SERVO[2]__delay:		DELAY (POSEDGE) H SERVO[2] ;
pos_H__SERVO[3]__delay:		DELAY (POSEDGE) H SERVO[3] ;
pos_H__SERVO[4]__delay:		DELAY (POSEDGE) H SERVO[4] ;
pos_H__SERVO[5]__delay:		DELAY (POSEDGE) H SERVO[5] ;
pos_H__SERVO[6]__delay:		DELAY (POSEDGE) H SERVO[6] ;
pos_H__SERVO[7]__delay:		DELAY (POSEDGE) H SERVO[7] ;
pos_H__SERVO[8]__delay:		DELAY (POSEDGE) H SERVO[8] ;
pos_H__SERVO[9]__delay:		DELAY (POSEDGE) H SERVO[9] ;
pos_H__SERVO[10]__delay:		DELAY (POSEDGE) H SERVO[10] ;
pos_H__SERVO[11]__delay:		DELAY (POSEDGE) H SERVO[11] ;
pos_H__SERVO[12]__delay:		DELAY (POSEDGE) H SERVO[12] ;
pos_H__SERVO[13]__delay:		DELAY (POSEDGE) H SERVO[13] ;
pos_H__SERVO[14]__delay:		DELAY (POSEDGE) H SERVO[14] ;
pos_H__SERVO[15]__delay:		DELAY (POSEDGE) H SERVO[15] ;
pos_RD__MOT1[1]__delay:		DELAY (POSEDGE) RD MOT1[1] ;
pos_RD__MOT2[1]__delay:		DELAY (POSEDGE) RD MOT2[1] ;
pos_RESET__MOT1[0]__delay:		DELAY (POSEDGE) RESET MOT1[0] ;
pos_RESET__MOT2[0]__delay:		DELAY (POSEDGE) RESET MOT2[0] ;

ENDMODEL
