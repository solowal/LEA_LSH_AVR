/*
 * keyschedule.c
 *
 * Created: 2014-03-16 오후 1:57:14
 *  Author: info
 */ 
#include "keyschedule.h"



uint32_t ROL2(uint32_t a, uint32_t size){
	return a<<size | a>>(32-size);
}

uint32_t ROR2(uint32_t a, uint32_t size){
	return a>>size | a<<(32-size);
}


void atmega_LEA_Keyschedule_192(uint32_t pdRndKeys[28*6],uint32_t pbKey[6]){

	uint32_t delta[6] = {0xc3efe9db, 0x44626b02, 0x79e27c8a, 0x78df30ec, 0x715ea49e, 0xc785da0a};

	uint32_t T[6] = {0x0,};
	int i=0;


	T[0] = pbKey[0];	T[1] = pbKey[1];	T[2] = pbKey[2];	T[3] = pbKey[3];	T[4] = pbKey[4];	T[5] = pbKey[5];
	for( i=0; i<28; i++){
		T[0] = ROL2(T[0] + ROL2(delta[i%6], i&0x1f), 1);
		T[1] = ROL2(T[1] + ROL2(delta[i%6], (i+1)&0x1f), 3);
		T[2] = ROL2(T[2] + ROL2(delta[i%6], (i+2)&0x1f), 6);
		T[3] = ROL2(T[3] + ROL2(delta[i%6], (i+3)&0x1f), 11);
		T[4] = ROL2(T[4] + ROL2(delta[i%6], (i+4)&0x1f), 13);
		T[5] = ROL2(T[5] + ROL2(delta[i%6], (i+5)&0x1f), 17);

//modified order
		pdRndKeys[i*6+0] = T[5];
		pdRndKeys[i*6+1] = T[4];
		pdRndKeys[i*6+2] = T[3];
		pdRndKeys[i*6+3] = T[2];
		pdRndKeys[i*6+4] = T[1];
		pdRndKeys[i*6+5] = T[0];
	}
}