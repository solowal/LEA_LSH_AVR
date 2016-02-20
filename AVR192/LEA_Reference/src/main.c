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
#include "keyschedule.h"



void atmega_LEA_EncryptBlk192(uint32_t key[28*6],uint32_t text[4]);

	static uint32_t X192[4]={0x23222120, 0x27262524, 0x2b2a2928, 0x2f2e2d2c};
	static uint32_t K192[6]={0x3c2d1e0f, 0x78695a4b, 0xb4a59687, 0xf0e1d2c3, 0xc3d2e1f0, 0x8796a5b4};
	static uint32_t tmp_R192[28*6]={0,};
		
		

int main (void)
{
	board_init();
	
	//LEA_Keyschedule(pdRndKeys,pbKey,delta);

	atmega_LEA_Keyschedule_192(tmp_R192,K192);

	atmega_LEA_EncryptBlk192(tmp_R192,X192);

//	LEA_EncryptBlk(pdInOut,pdRndKeys);
	// Insert application code here, after the board has been initialized.
}


