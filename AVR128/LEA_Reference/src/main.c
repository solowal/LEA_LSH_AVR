/**
 * \file
 *
 * \brief Empty user application template
 *
 */

/**
 * \mainpage User Application template doxygen documentation
 *
 * \par Empty user application template
 *
 * Bare minimum empty user application template
 *
 * \par Content
 *
 * -# Include the ASF header files (through asf.h)
 * -# Minimal main function that starts with a call to board_init()
 * -# "Insert application code here" comment
 *
 */

/*
 * Include header files for all drivers that have been imported from
 * Atmel Software Framework (ASF).
 */
#include <asf.h>

typedef unsigned long u32;
typedef unsigned char u8;

#define LEA_BLK_BYTE_LEN	16
#define LEA_RNDKEY_WORD_LEN	4
#define LEA_NUM_RNDS		24
#define LEA_KEY_BYTE_LEN	16

void LEA_Keyschedule(u32 pdRndKeys[LEA_NUM_RNDS][LEA_RNDKEY_WORD_LEN], const u8 pbKey[LEA_KEY_BYTE_LEN], u8 delta[16]);
void LEA_EncryptBlk(u8 pdInOut[LEA_BLK_BYTE_LEN],const u32 pdRndKeys[LEA_NUM_RNDS][LEA_RNDKEY_WORD_LEN]);

u8 pdInOut[LEA_BLK_BYTE_LEN] = {0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17, 0x18, 0x19, 0x1a, 0x1b, 0x1c, 0x1d, 0x1e, 0x1f};
u8 pbKey[LEA_KEY_BYTE_LEN] = {0x0f, 0x1e, 0x2d, 0x3c, 0x4b, 0x5a, 0x69, 0x78, 0x87, 0x96, 0xa5, 0xb4, 0xc3, 0xd2, 0xe1, 0xf0};
u32 pdRndKeys[LEA_NUM_RNDS][LEA_RNDKEY_WORD_LEN] = {0,};
u8 delta[16] = {0xdb, 0xe9, 0xef, 0xc3, 0x02, 0x6b, 0x62, 0x44, 0x8a, 0x7c ,0xe2, 0x79, 0xec, 0x30, 0xdf, 0x78 };
		
		

int main (void)
{
	board_init();
	
	LEA_Keyschedule(pdRndKeys,pbKey,delta);
	LEA_EncryptBlk(pdInOut,pdRndKeys);
	// Insert application code here, after the board has been initialized.
}


