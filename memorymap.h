#ifndef __MEMORY_MAP__
#define __MEMORY_MAP__
//Les 2 moteurs sont accedés par ces 2 bytes. Ils ont la logique de complement de 2, donc pour 
//les faire marcher arriere, il suffit attibuer -127
u8* MOTEUR1 = ((u8*)0x8000); 
u8* MOTEUR2 = ((u8*)0x8001);
//0x8002  RESERVED
//0x8003  RESERVED
//Les registreurs SERVOx gardent le temps du pulse qui será envoye au servo-moteur (en microsecondes)
//Ils sont organizees sur le modele "little-endian" (+1<=MSB, 0<=LSB)
u16* SERVO1 = ((u16*)0x8004);
u16* SERVO2 = ((u16*)0x8006);
u16* SERVO3 = ((u16*)0x8008);
u16* SERVO4 = ((u16*)0x800a);
u16* SERVO5 = ((u16*)0x800c);
u16* SERVO6 = ((u16*)0x800e);
u16* SERVO7 = ((u16*)0x8010);
u16* SERVO8 = ((u16*)0x8012);
u16* SERVO9 = ((u16*)0x8014);
u16* SERVO10 = ((u16*)0x8016);
u16* SERVO11 = ((u16*)0x8018);
u16* SERVO12 = ((u16*)0x801a);
u16* SERVO13 = ((u16*)0x801c);
u16* SERVO14 = ((u16*)0x801e);
u16* SERVO15 = ((u16*)0x8020);
u16* SERVO16 = ((u16*)0x8022);
//Le prochain registreur est la relation entre la distance entre roues et la distance de chaque pas.
//il est necessaire pour la calibration du module qui determine la position relative
u16* RELATION = ((u16*)0x8024);
//du 0x8026 au 0x807e => reserved
//Le registreur de RESET permet au programmateur faire du reset à une partie especifique de la FPGA.
//Pour faire une reset, par example, du timer, il suffit ecrire RESET_FPGA = 1; et apres RESET_FPGA = 0;
//(RESERVED - RESERVED - DEBBUGER - COUNTEUR - PWM - SERVO - COUNTERROT - TIMER)
u8* RESET_FPGA = ((u8*)0x807f);
//Tous les prochains registreurs sont "READ-ONLY", donc essayer d'ecrire sur ces addresses ne sortirá aucun effet
//les MICROSECONDES, MILISECONDES et SECONDES determinent la periode de temps depuis 
//le module a eté redemaré (soit par le pin RESET, soit par le registreur RESET_FPGA)
u16* MICROSECONDES = ((u16*)0x8080);
u16* MILISECONDES = ((u16*)0x8082);
u16* SECONDES = ((u16*)0x8084);
//les registreurs POSX_FPGA et POSY_FPGA disent la position du robot en nombre de pas du encoder.
//le registreur ROT_FPGA dit le angle avec un format "fixed point", ça veut dire qui il est organizée comme ça:
//(angle de 0 à 360 <9 bits>)(1/2 degrée <1 bit>)(1/4 degrée <1 bit>)(1/8 degrée <1 bit>)(1/16)(1/32)(1/64)(1/128)
u32* POSX_FPGA = ((u32*)0x8086);
u32* POSY_FPGA = ((u32*)0x808a);
u16* ROT_FPGA = ((u16*)0x808e);
// du 0x808e au 0x80ff => RESERVED (read as 0)
