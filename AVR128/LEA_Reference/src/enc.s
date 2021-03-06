﻿	.global LEA_EncryptBlk
	.type LEA_EncryptBlk, @function
  
	; operand b: r21:r20
	; operand a: r23:r22
	; operand r: r25:r24
  
	LEA_EncryptBlk:

	PUSH R2 
	PUSH R3 
	PUSH R4 
	PUSH R5 
	PUSH R6 
	PUSH R7 
	PUSH R8 
	PUSH R9 
	PUSH R10
	PUSH R11
	PUSH R12
	PUSH R13
	PUSH R14
	PUSH R15
	PUSH R16
	PUSH R17
	PUSH R28
	PUSH R29

	//c : r24,r25
	//b : r20,r21
	//a : r23,r22
	MOVW R30, R22	//key
	MOVW R28, R24	//plain


	// 0~11 cache
	
	// 12~25 operand
	// 12~19 multiplier
	// 20~25 multiplicand
	// 26-27

	

	//A
	LDD R0, Y+0
	LDD R1, Y+1
	LDD R2, Y+2
	LDD R3, Y+3
	LDD R4, Y+4
	LDD R5, Y+5
	LDD R6, Y+6
	LDD R7, Y+7
	LDD R8, Y+8
	LDD R9, Y+9
	LDD R10,Y+10
	LDD R11,Y+11
	LDD R12,Y+12
	LDD R13,Y+13
	LDD R14,Y+14
	LDD R15,Y+15
	
	//R0 -R3 : X0
	//R4 -R7 : X1
	//R8 -R11: X2
	//R12-R15: X3

	//K1
	//K4
	//K0
	//K2
	
	//STEP 1
	//1_1			
	LD R16, Z+
	LD R17, Z+
	LD R18, Z+
	LD R19, Z+
	
	EOR R12, R16
	EOR R13, R17
	EOR R14, R18
	EOR R15, R19

	LD R20, Z+
	LD R21, Z+
	LD R22, Z+
	LD R23, Z+

	EOR R20, R8
	EOR R21, R9
	EOR R22, R10
	EOR R23, R11

	ADD R12, R20
	ADC R13, R21
	ADC R14, R22
	ADC R15, R23

	CLR R20
	LSR R15
	ROR R14
	ROR R13
	ROR R12
	ROR R20

	LSR R15
	ROR R14
	ROR R13
	ROR R12
	ROR R20

	LSR R15
	ROR R14
	ROR R13
	ROR R12
	ROR R20

	EOR R15, R20

	//1_2
	EOR R8 , R16
	EOR R9 , R17
	EOR R10, R18
	EOR R11, R19

	LD R20, Z+
	LD R21, Z+
	LD R22, Z+
	LD R23, Z+

	EOR R20, R4
	EOR R21, R5
	EOR R22, R6
	EOR R23, R7

	ADD R8 , R20
	ADC R9 , R21
	ADC R10, R22
	ADC R11, R23

	CLR R20
	LSL R8
	ROL R9
	ROL R10
	ROL R11
	ROL R20

	LSL R8
	ROL R9
	ROL R10
	ROL R11
	ROL R20

	LSL R8
	ROL R9
	ROL R10
	ROL R11
	ROL R20

	EOR R8, R20
	
	//1_3
	EOR R4 , R16
	EOR R5 , R17
	EOR R6 , R18
	EOR R7 , R19

	LD R20, Z+
	LD R21, Z+
	LD R22, Z+
	LD R23, Z+

	EOR R20, R0
	EOR R21, R1
	EOR R22, R2
	EOR R23, R3

	ADD R4 , R20
	ADC R5 , R21
	ADC R6 , R22
	ADC R7 , R23

	CLR R20
	LSL R4
	ROL R5
	ROL R6
	ROL R7
	ROL R20
		
	EOR R4, R20
	
	//STEP 2
	//2_1			
	LD R16, Z+
	LD R17, Z+
	LD R18, Z+
	LD R19, Z+
	
	EOR R0, R16
	EOR R1, R17
	EOR R2, R18
	EOR R3, R19

	LD R20, Z+
	LD R21, Z+
	LD R22, Z+
	LD R23, Z+

	EOR R20, R12
	EOR R21, R13
	EOR R22, R14
	EOR R23, R15

	ADD R0, R20
	ADC R1, R21
	ADC R2, R22
	ADC R3, R23

	CLR R20
	LSR R3
	ROR R2
	ROR R1
	ROR R0
	ROR R20

	LSR R3
	ROR R2
	ROR R1
	ROR R0
	ROR R20

	LSR R3
	ROR R2
	ROR R1
	ROR R0
	ROR R20

	EOR R3, R20

	//2_2
	EOR R12 , R16
	EOR R13 , R17
	EOR R14, R18
	EOR R15, R19

	LD R20, Z+
	LD R21, Z+
	LD R22, Z+
	LD R23, Z+

	EOR R20, R9
	EOR R21, R10
	EOR R22, R11
	EOR R23, R8

	ADD R12, R20
	ADC R13, R21
	ADC R14, R22
	ADC R15, R23

	CLR R20
	LSL R12
	ROL R13
	ROL R14
	ROL R15
	ROL R20

	LSL R12
	ROL R13
	ROL R14
	ROL R15
	ROL R20

	LSL R12
	ROL R13
	ROL R14
	ROL R15
	ROL R20

	EOR R12, R20
	
	//2_3
	EOR R9 , R16
	EOR R10 , R17
	EOR R11 , R18
	EOR R8 , R19

	LD R20, Z+
	LD R21, Z+
	LD R22, Z+
	LD R23, Z+

	EOR R20, R7
	EOR R21, R4
	EOR R22, R5
	EOR R23, R6

	ADD R9 , R20
	ADC R10 , R21
	ADC R11 , R22
	ADC R8 , R23

	CLR R20
	LSL R9
	ROL R10
	ROL R11
	ROL R8
	ROL R20
		
	EOR R9, R20
	

	//STEP 3
	//3_1			
	LD R16, Z+
	LD R17, Z+
	LD R18, Z+
	LD R19, Z+
	
	EOR R7, R16
	EOR R4, R17
	EOR R5, R18
	EOR R6, R19

	LD R20, Z+
	LD R21, Z+
	LD R22, Z+
	LD R23, Z+

	EOR R20, R0
	EOR R21, R1
	EOR R22, R2
	EOR R23, R3

	ADD R7, R20
	ADC R4, R21
	ADC R5, R22
	ADC R6, R23

	CLR R20
	LSR R6
	ROR R5
	ROR R4
	ROR R7
	ROR R20

	LSR R6
	ROR R5
	ROR R4
	ROR R7
	ROR R20

	LSR R6
	ROR R5
	ROR R4
	ROR R7
	ROR R20

	EOR R6, R20

	//3_2
	EOR R0, R16
	EOR R1, R17
	EOR R2, R18
	EOR R3, R19

	LD R20, Z+
	LD R21, Z+
	LD R22, Z+
	LD R23, Z+

	EOR R20, R13
	EOR R21, R14
	EOR R22, R15
	EOR R23, R12

	ADD R0, R20
	ADC R1, R21
	ADC R2, R22
	ADC R3, R23

	CLR R20
	LSL R0
	ROL R1
	ROL R2
	ROL R3
	ROL R20

	LSL R0
	ROL R1
	ROL R2
	ROL R3
	ROL R20

	LSL R0
	ROL R1
	ROL R2
	ROL R3
	ROL R20

	EOR R0, R20
	
	//3_3
	EOR R13, R16
	EOR R14, R17
	EOR R15, R18
	EOR R12, R19

	LD R20, Z+
	LD R21, Z+
	LD R22, Z+
	LD R23, Z+

	EOR R20, R8
	EOR R21, R9
	EOR R22, R10
	EOR R23, R11

	ADD R13 , R20
	ADC R14 , R21
	ADC R15 , R22
	ADC R12, R23

	CLR R20
	LSL R13
	ROL R14
	ROL R15
	ROL R12
	ROL R20
		
	EOR R13, R20



		//STEP 4
	//4_1			
	LD R16, Z+
	LD R17, Z+
	LD R18, Z+
	LD R19, Z+
	
	EOR R8, R16
	EOR R9, R17
	EOR R10, R18
	EOR R11, R19

	LD R20, Z+
	LD R21, Z+
	LD R22, Z+
	LD R23, Z+

	EOR R20, R7
	EOR R21, R4
	EOR R22, R5
	EOR R23, R6

	ADD R8, R20
	ADC R9, R21
	ADC R10, R22
	ADC R11, R23

	CLR R20
	LSR R11
	ROR R10
	ROR R9
	ROR R8
	ROR R20

	LSR R11
	ROR R10
	ROR R9
	ROR R8
	ROR R20

	LSR R11
	ROR R10
	ROR R9
	ROR R8
	ROR R20

	EOR R11, R20

	//4_2
	EOR R7, R16
	EOR R4, R17
	EOR R5, R18
	EOR R6, R19

	LD R20, Z+
	LD R21, Z+
	LD R22, Z+
	LD R23, Z+

	EOR R20, R1
	EOR R21, R2
	EOR R22, R3
	EOR R23, R0

	ADD R7, R20
	ADC R4, R21
	ADC R5, R22
	ADC R6, R23

	CLR R20
	LSL R7
	ROL R4
	ROL R5
	ROL R6
	ROL R20

	LSL R7
	ROL R4
	ROL R5
	ROL R6
	ROL R20

	LSL R7
	ROL R4
	ROL R5
	ROL R6
	ROL R20

	EOR R7, R20
	
	//4_3
	EOR R1, R16
	EOR R2, R17
	EOR R3, R18
	EOR R0, R19

	LD R20, Z+
	LD R21, Z+
	LD R22, Z+
	LD R23, Z+

	EOR R20, R12
	EOR R21, R13
	EOR R22, R14
	EOR R23, R15

	ADD R1 , R20
	ADC R2 , R21
	ADC R3 , R22
	ADC R0 , R23

	CLR R20
	LSL R1
	ROL R2
	ROL R3
	ROL R0
	ROL R20
		
	EOR R1, R20

	
		//STEP 5
	//5_1			
	LD R16, Z+
	LD R17, Z+
	LD R18, Z+
	LD R19, Z+
	
	EOR R12, R16
	EOR R13, R17
	EOR R14, R18
	EOR R15, R19

	LD R20, Z+
	LD R21, Z+
	LD R22, Z+
	LD R23, Z+

	EOR R20, R8
	EOR R21, R9
	EOR R22, R10
	EOR R23, R11

	ADD R12, R20
	ADC R13, R21
	ADC R14, R22
	ADC R15, R23

	CLR R20
	LSR R15
	ROR R14
	ROR R13
	ROR R12
	ROR R20

	LSR R15
	ROR R14
	ROR R13
	ROR R12
	ROR R20

	LSR R15
	ROR R14
	ROR R13
	ROR R12
	ROR R20

	EOR R15, R20

	//5_2
	EOR R8, R16
	EOR R9, R17
	EOR R10, R18
	EOR R11, R19

	LD R20, Z+
	LD R21, Z+
	LD R22, Z+
	LD R23, Z+

	EOR R20, R4
	EOR R21, R5
	EOR R22, R6
	EOR R23, R7

	ADD R8, R20
	ADC R9, R21
	ADC R10, R22
	ADC R11, R23

	CLR R20
	LSL R8
	ROL R9
	ROL R10
	ROL R11
	ROL R20

	LSL R8
	ROL R9
	ROL R10
	ROL R11
	ROL R20

	LSL R8
	ROL R9
	ROL R10
	ROL R11
	ROL R20

	EOR R8, R20
	
	//5_3
	EOR R4, R16
	EOR R5, R17
	EOR R6, R18
	EOR R7, R19

	LD R20, Z+
	LD R21, Z+
	LD R22, Z+
	LD R23, Z+

	EOR R20, R0
	EOR R21, R1
	EOR R22, R2
	EOR R23, R3

	ADD R4 , R20
	ADC R5 , R21
	ADC R6 , R22
	ADC R7 , R23

	CLR R20
	LSL R4
	ROL R5
	ROL R6
	ROL R7
	ROL R20
		
	EOR R4, R20

	
	//STEP 6
	//6_1			
	LD R16, Z+
	LD R17, Z+
	LD R18, Z+
	LD R19, Z+
	
	EOR R0, R16
	EOR R1, R17
	EOR R2, R18
	EOR R3, R19

	LD R20, Z+
	LD R21, Z+
	LD R22, Z+
	LD R23, Z+

	EOR R20, R12
	EOR R21, R13
	EOR R22, R14
	EOR R23, R15

	ADD R0, R20
	ADC R1, R21
	ADC R2, R22
	ADC R3, R23

	CLR R20
	LSR R3
	ROR R2
	ROR R1
	ROR R0
	ROR R20

	LSR R3
	ROR R2
	ROR R1
	ROR R0
	ROR R20

	LSR R3
	ROR R2
	ROR R1
	ROR R0
	ROR R20

	EOR R3, R20

	//6_2
	EOR R12, R16
	EOR R13, R17
	EOR R14, R18
	EOR R15, R19

	LD R20, Z+
	LD R21, Z+
	LD R22, Z+
	LD R23, Z+

	EOR R20, R9
	EOR R21, R10
	EOR R22, R11
	EOR R23, R8

	ADD R12, R20
	ADC R13, R21
	ADC R14, R22
	ADC R15, R23

	CLR R20
	LSL R12
	ROL R13
	ROL R14
	ROL R15
	ROL R20

	LSL R12
	ROL R13
	ROL R14
	ROL R15
	ROL R20

	LSL R12
	ROL R13
	ROL R14
	ROL R15
	ROL R20

	EOR R12, R20
	
	//6_3
	EOR R9, R16
	EOR R10, R17
	EOR R11, R18
	EOR R8, R19

	LD R20, Z+
	LD R21, Z+
	LD R22, Z+
	LD R23, Z+

	EOR R20, R7
	EOR R21, R4
	EOR R22, R5
	EOR R23, R6

	ADD R9 , R20
	ADC R10 , R21
	ADC R11 , R22
	ADC R8 , R23

	CLR R20
	LSL R9
	ROL R10
	ROL R11
	ROL R8
	ROL R20
		
	EOR R9, R20

	//STEP 7
	//7_1			
	LD R16, Z+
	LD R17, Z+
	LD R18, Z+
	LD R19, Z+
	
	EOR R7, R16
	EOR R4, R17
	EOR R5, R18
	EOR R6, R19

	LD R20, Z+
	LD R21, Z+
	LD R22, Z+
	LD R23, Z+

	EOR R20, R0
	EOR R21, R1
	EOR R22, R2
	EOR R23, R3

	ADD R7, R20
	ADC R4, R21
	ADC R5, R22
	ADC R6, R23

	CLR R20
	LSR R6
	ROR R5
	ROR R4
	ROR R7
	ROR R20

	LSR R6
	ROR R5
	ROR R4
	ROR R7
	ROR R20

	LSR R6
	ROR R5
	ROR R4
	ROR R7
	ROR R20

	EOR R6, R20

	//7_2
	EOR R0, R16
	EOR R1, R17
	EOR R2, R18
	EOR R3, R19

	LD R20, Z+
	LD R21, Z+
	LD R22, Z+
	LD R23, Z+

	EOR R20, R13
	EOR R21, R14
	EOR R22, R15
	EOR R23, R12

	ADD R0, R20
	ADC R1, R21
	ADC R2, R22
	ADC R3, R23

	CLR R20
	LSL R0
	ROL R1
	ROL R2
	ROL R3
	ROL R20

	LSL R0
	ROL R1
	ROL R2
	ROL R3
	ROL R20

	LSL R0
	ROL R1
	ROL R2
	ROL R3
	ROL R20

	EOR R0, R20
	
	//7_3
	EOR R13, R16
	EOR R14, R17
	EOR R15, R18
	EOR R12, R19

	LD R20, Z+
	LD R21, Z+
	LD R22, Z+
	LD R23, Z+

	EOR R20, R8
	EOR R21, R9
	EOR R22, R10
	EOR R23, R11

	ADD R13 , R20
	ADC R14 , R21
	ADC R15 , R22
	ADC R12, R23

	CLR R20
	LSL R13
	ROL R14
	ROL R15
	ROL R12
	ROL R20
		
	EOR R13, R20


		//STEP 4
	//4_1			
	LD R16, Z+
	LD R17, Z+
	LD R18, Z+
	LD R19, Z+
	
	EOR R8, R16
	EOR R9, R17
	EOR R10, R18
	EOR R11, R19

	LD R20, Z+
	LD R21, Z+
	LD R22, Z+
	LD R23, Z+

	EOR R20, R7
	EOR R21, R4
	EOR R22, R5
	EOR R23, R6

	ADD R8, R20
	ADC R9, R21
	ADC R10, R22
	ADC R11, R23

	CLR R20
	LSR R11
	ROR R10
	ROR R9
	ROR R8
	ROR R20

	LSR R11
	ROR R10
	ROR R9
	ROR R8
	ROR R20

	LSR R11
	ROR R10
	ROR R9
	ROR R8
	ROR R20

	EOR R11, R20

	//4_2
	EOR R7, R16
	EOR R4, R17
	EOR R5, R18
	EOR R6, R19

	LD R20, Z+
	LD R21, Z+
	LD R22, Z+
	LD R23, Z+

	EOR R20, R1
	EOR R21, R2
	EOR R22, R3
	EOR R23, R0

	ADD R7, R20
	ADC R4, R21
	ADC R5, R22
	ADC R6, R23

	CLR R20
	LSL R7
	ROL R4
	ROL R5
	ROL R6
	ROL R20

	LSL R7
	ROL R4
	ROL R5
	ROL R6
	ROL R20

	LSL R7
	ROL R4
	ROL R5
	ROL R6
	ROL R20

	EOR R7, R20
	
	//4_3
	EOR R1, R16
	EOR R2, R17
	EOR R3, R18
	EOR R0, R19

	LD R20, Z+
	LD R21, Z+
	LD R22, Z+
	LD R23, Z+

	EOR R20, R12
	EOR R21, R13
	EOR R22, R14
	EOR R23, R15

	ADD R1 , R20
	ADC R2 , R21
	ADC R3 , R22
	ADC R0 , R23

	CLR R20
	LSL R1
	ROL R2
	ROL R3
	ROL R0
	ROL R20
		
	EOR R1, R20

		//STEP 5
	//5_1			
	LD R16, Z+
	LD R17, Z+
	LD R18, Z+
	LD R19, Z+
	
	EOR R12, R16
	EOR R13, R17
	EOR R14, R18
	EOR R15, R19

	LD R20, Z+
	LD R21, Z+
	LD R22, Z+
	LD R23, Z+

	EOR R20, R8
	EOR R21, R9
	EOR R22, R10
	EOR R23, R11

	ADD R12, R20
	ADC R13, R21
	ADC R14, R22
	ADC R15, R23

	CLR R20
	LSR R15
	ROR R14
	ROR R13
	ROR R12
	ROR R20

	LSR R15
	ROR R14
	ROR R13
	ROR R12
	ROR R20

	LSR R15
	ROR R14
	ROR R13
	ROR R12
	ROR R20

	EOR R15, R20

	//5_2
	EOR R8, R16
	EOR R9, R17
	EOR R10, R18
	EOR R11, R19

	LD R20, Z+
	LD R21, Z+
	LD R22, Z+
	LD R23, Z+

	EOR R20, R4
	EOR R21, R5
	EOR R22, R6
	EOR R23, R7

	ADD R8, R20
	ADC R9, R21
	ADC R10, R22
	ADC R11, R23

	CLR R20
	LSL R8
	ROL R9
	ROL R10
	ROL R11
	ROL R20

	LSL R8
	ROL R9
	ROL R10
	ROL R11
	ROL R20

	LSL R8
	ROL R9
	ROL R10
	ROL R11
	ROL R20

	EOR R8, R20
	
	//5_3
	EOR R4, R16
	EOR R5, R17
	EOR R6, R18
	EOR R7, R19

	LD R20, Z+
	LD R21, Z+
	LD R22, Z+
	LD R23, Z+

	EOR R20, R0
	EOR R21, R1
	EOR R22, R2
	EOR R23, R3

	ADD R4 , R20
	ADC R5 , R21
	ADC R6 , R22
	ADC R7 , R23

	CLR R20
	LSL R4
	ROL R5
	ROL R6
	ROL R7
	ROL R20
		
	EOR R4, R20

	
	//STEP 6
	//6_1			
	LD R16, Z+
	LD R17, Z+
	LD R18, Z+
	LD R19, Z+
	
	EOR R0, R16
	EOR R1, R17
	EOR R2, R18
	EOR R3, R19

	LD R20, Z+
	LD R21, Z+
	LD R22, Z+
	LD R23, Z+

	EOR R20, R12
	EOR R21, R13
	EOR R22, R14
	EOR R23, R15

	ADD R0, R20
	ADC R1, R21
	ADC R2, R22
	ADC R3, R23

	CLR R20
	LSR R3
	ROR R2
	ROR R1
	ROR R0
	ROR R20

	LSR R3
	ROR R2
	ROR R1
	ROR R0
	ROR R20

	LSR R3
	ROR R2
	ROR R1
	ROR R0
	ROR R20

	EOR R3, R20

	//6_2
	EOR R12, R16
	EOR R13, R17
	EOR R14, R18
	EOR R15, R19

	LD R20, Z+
	LD R21, Z+
	LD R22, Z+
	LD R23, Z+

	EOR R20, R9
	EOR R21, R10
	EOR R22, R11
	EOR R23, R8

	ADD R12, R20
	ADC R13, R21
	ADC R14, R22
	ADC R15, R23

	CLR R20
	LSL R12
	ROL R13
	ROL R14
	ROL R15
	ROL R20

	LSL R12
	ROL R13
	ROL R14
	ROL R15
	ROL R20

	LSL R12
	ROL R13
	ROL R14
	ROL R15
	ROL R20

	EOR R12, R20
	
	//6_3
	EOR R9, R16
	EOR R10, R17
	EOR R11, R18
	EOR R8, R19

	LD R20, Z+
	LD R21, Z+
	LD R22, Z+
	LD R23, Z+

	EOR R20, R7
	EOR R21, R4
	EOR R22, R5
	EOR R23, R6

	ADD R9 , R20
	ADC R10 , R21
	ADC R11 , R22
	ADC R8 , R23

	CLR R20
	LSL R9
	ROL R10
	ROL R11
	ROL R8
	ROL R20
		
	EOR R9, R20

	//STEP 7
	//7_1			
	LD R16, Z+
	LD R17, Z+
	LD R18, Z+
	LD R19, Z+
	
	EOR R7, R16
	EOR R4, R17
	EOR R5, R18
	EOR R6, R19

	LD R20, Z+
	LD R21, Z+
	LD R22, Z+
	LD R23, Z+

	EOR R20, R0
	EOR R21, R1
	EOR R22, R2
	EOR R23, R3

	ADD R7, R20
	ADC R4, R21
	ADC R5, R22
	ADC R6, R23

	CLR R20
	LSR R6
	ROR R5
	ROR R4
	ROR R7
	ROR R20

	LSR R6
	ROR R5
	ROR R4
	ROR R7
	ROR R20

	LSR R6
	ROR R5
	ROR R4
	ROR R7
	ROR R20

	EOR R6, R20

	//7_2
	EOR R0, R16
	EOR R1, R17
	EOR R2, R18
	EOR R3, R19

	LD R20, Z+
	LD R21, Z+
	LD R22, Z+
	LD R23, Z+

	EOR R20, R13
	EOR R21, R14
	EOR R22, R15
	EOR R23, R12

	ADD R0, R20
	ADC R1, R21
	ADC R2, R22
	ADC R3, R23

	CLR R20
	LSL R0
	ROL R1
	ROL R2
	ROL R3
	ROL R20

	LSL R0
	ROL R1
	ROL R2
	ROL R3
	ROL R20

	LSL R0
	ROL R1
	ROL R2
	ROL R3
	ROL R20

	EOR R0, R20
	
	//7_3
	EOR R13, R16
	EOR R14, R17
	EOR R15, R18
	EOR R12, R19

	LD R20, Z+
	LD R21, Z+
	LD R22, Z+
	LD R23, Z+

	EOR R20, R8
	EOR R21, R9
	EOR R22, R10
	EOR R23, R11

	ADD R13 , R20
	ADC R14 , R21
	ADC R15 , R22
	ADC R12, R23

	CLR R20
	LSL R13
	ROL R14
	ROL R15
	ROL R12
	ROL R20
		
	EOR R13, R20


		//STEP 4
	//4_1			
	LD R16, Z+
	LD R17, Z+
	LD R18, Z+
	LD R19, Z+
	
	EOR R8, R16
	EOR R9, R17
	EOR R10, R18
	EOR R11, R19

	LD R20, Z+
	LD R21, Z+
	LD R22, Z+
	LD R23, Z+

	EOR R20, R7
	EOR R21, R4
	EOR R22, R5
	EOR R23, R6

	ADD R8, R20
	ADC R9, R21
	ADC R10, R22
	ADC R11, R23

	CLR R20
	LSR R11
	ROR R10
	ROR R9
	ROR R8
	ROR R20

	LSR R11
	ROR R10
	ROR R9
	ROR R8
	ROR R20

	LSR R11
	ROR R10
	ROR R9
	ROR R8
	ROR R20

	EOR R11, R20

	//4_2
	EOR R7, R16
	EOR R4, R17
	EOR R5, R18
	EOR R6, R19

	LD R20, Z+
	LD R21, Z+
	LD R22, Z+
	LD R23, Z+

	EOR R20, R1
	EOR R21, R2
	EOR R22, R3
	EOR R23, R0

	ADD R7, R20
	ADC R4, R21
	ADC R5, R22
	ADC R6, R23

	CLR R20
	LSL R7
	ROL R4
	ROL R5
	ROL R6
	ROL R20

	LSL R7
	ROL R4
	ROL R5
	ROL R6
	ROL R20

	LSL R7
	ROL R4
	ROL R5
	ROL R6
	ROL R20

	EOR R7, R20
	
	//4_3
	EOR R1, R16
	EOR R2, R17
	EOR R3, R18
	EOR R0, R19

	LD R20, Z+
	LD R21, Z+
	LD R22, Z+
	LD R23, Z+

	EOR R20, R12
	EOR R21, R13
	EOR R22, R14
	EOR R23, R15

	ADD R1 , R20
	ADC R2 , R21
	ADC R3 , R22
	ADC R0 , R23

	CLR R20
	LSL R1
	ROL R2
	ROL R3
	ROL R0
	ROL R20
		
	EOR R1, R20

		//STEP 5
	//5_1			
	LD R16, Z+
	LD R17, Z+
	LD R18, Z+
	LD R19, Z+
	
	EOR R12, R16
	EOR R13, R17
	EOR R14, R18
	EOR R15, R19

	LD R20, Z+
	LD R21, Z+
	LD R22, Z+
	LD R23, Z+

	EOR R20, R8
	EOR R21, R9
	EOR R22, R10
	EOR R23, R11

	ADD R12, R20
	ADC R13, R21
	ADC R14, R22
	ADC R15, R23

	CLR R20
	LSR R15
	ROR R14
	ROR R13
	ROR R12
	ROR R20

	LSR R15
	ROR R14
	ROR R13
	ROR R12
	ROR R20

	LSR R15
	ROR R14
	ROR R13
	ROR R12
	ROR R20

	EOR R15, R20

	//5_2
	EOR R8, R16
	EOR R9, R17
	EOR R10, R18
	EOR R11, R19

	LD R20, Z+
	LD R21, Z+
	LD R22, Z+
	LD R23, Z+

	EOR R20, R4
	EOR R21, R5
	EOR R22, R6
	EOR R23, R7

	ADD R8, R20
	ADC R9, R21
	ADC R10, R22
	ADC R11, R23

	CLR R20
	LSL R8
	ROL R9
	ROL R10
	ROL R11
	ROL R20

	LSL R8
	ROL R9
	ROL R10
	ROL R11
	ROL R20

	LSL R8
	ROL R9
	ROL R10
	ROL R11
	ROL R20

	EOR R8, R20
	
	//5_3
	EOR R4, R16
	EOR R5, R17
	EOR R6, R18
	EOR R7, R19

	LD R20, Z+
	LD R21, Z+
	LD R22, Z+
	LD R23, Z+

	EOR R20, R0
	EOR R21, R1
	EOR R22, R2
	EOR R23, R3

	ADD R4 , R20
	ADC R5 , R21
	ADC R6 , R22
	ADC R7 , R23

	CLR R20
	LSL R4
	ROL R5
	ROL R6
	ROL R7
	ROL R20
		
	EOR R4, R20

	//STEP 6
	//6_1			
	LD R16, Z+
	LD R17, Z+
	LD R18, Z+
	LD R19, Z+
	
	EOR R0, R16
	EOR R1, R17
	EOR R2, R18
	EOR R3, R19

	LD R20, Z+
	LD R21, Z+
	LD R22, Z+
	LD R23, Z+

	EOR R20, R12
	EOR R21, R13
	EOR R22, R14
	EOR R23, R15

	ADD R0, R20
	ADC R1, R21
	ADC R2, R22
	ADC R3, R23

	CLR R20
	LSR R3
	ROR R2
	ROR R1
	ROR R0
	ROR R20

	LSR R3
	ROR R2
	ROR R1
	ROR R0
	ROR R20

	LSR R3
	ROR R2
	ROR R1
	ROR R0
	ROR R20

	EOR R3, R20

	//6_2
	EOR R12, R16
	EOR R13, R17
	EOR R14, R18
	EOR R15, R19

	LD R20, Z+
	LD R21, Z+
	LD R22, Z+
	LD R23, Z+

	EOR R20, R9
	EOR R21, R10
	EOR R22, R11
	EOR R23, R8

	ADD R12, R20
	ADC R13, R21
	ADC R14, R22
	ADC R15, R23

	CLR R20
	LSL R12
	ROL R13
	ROL R14
	ROL R15
	ROL R20

	LSL R12
	ROL R13
	ROL R14
	ROL R15
	ROL R20

	LSL R12
	ROL R13
	ROL R14
	ROL R15
	ROL R20

	EOR R12, R20
	
	//6_3
	EOR R9, R16
	EOR R10, R17
	EOR R11, R18
	EOR R8, R19

	LD R20, Z+
	LD R21, Z+
	LD R22, Z+
	LD R23, Z+

	EOR R20, R7
	EOR R21, R4
	EOR R22, R5
	EOR R23, R6

	ADD R9 , R20
	ADC R10 , R21
	ADC R11 , R22
	ADC R8 , R23

	CLR R20
	LSL R9
	ROL R10
	ROL R11
	ROL R8
	ROL R20
		
	EOR R9, R20

	//STEP 7
	//7_1			
	LD R16, Z+
	LD R17, Z+
	LD R18, Z+
	LD R19, Z+
	
	EOR R7, R16
	EOR R4, R17
	EOR R5, R18
	EOR R6, R19

	LD R20, Z+
	LD R21, Z+
	LD R22, Z+
	LD R23, Z+

	EOR R20, R0
	EOR R21, R1
	EOR R22, R2
	EOR R23, R3

	ADD R7, R20
	ADC R4, R21
	ADC R5, R22
	ADC R6, R23

	CLR R20
	LSR R6
	ROR R5
	ROR R4
	ROR R7
	ROR R20

	LSR R6
	ROR R5
	ROR R4
	ROR R7
	ROR R20

	LSR R6
	ROR R5
	ROR R4
	ROR R7
	ROR R20

	EOR R6, R20

	//7_2
	EOR R0, R16
	EOR R1, R17
	EOR R2, R18
	EOR R3, R19

	LD R20, Z+
	LD R21, Z+
	LD R22, Z+
	LD R23, Z+

	EOR R20, R13
	EOR R21, R14
	EOR R22, R15
	EOR R23, R12

	ADD R0, R20
	ADC R1, R21
	ADC R2, R22
	ADC R3, R23

	CLR R20
	LSL R0
	ROL R1
	ROL R2
	ROL R3
	ROL R20

	LSL R0
	ROL R1
	ROL R2
	ROL R3
	ROL R20

	LSL R0
	ROL R1
	ROL R2
	ROL R3
	ROL R20

	EOR R0, R20
	
	//7_3
	EOR R13, R16
	EOR R14, R17
	EOR R15, R18
	EOR R12, R19

	LD R20, Z+
	LD R21, Z+
	LD R22, Z+
	LD R23, Z+

	EOR R20, R8
	EOR R21, R9
	EOR R22, R10
	EOR R23, R11

	ADD R13 , R20
	ADC R14 , R21
	ADC R15 , R22
	ADC R12, R23

	CLR R20
	LSL R13
	ROL R14
	ROL R15
	ROL R12
	ROL R20
		
	EOR R13, R20


		//STEP 4
	//4_1			
	LD R16, Z+
	LD R17, Z+
	LD R18, Z+
	LD R19, Z+
	
	EOR R8, R16
	EOR R9, R17
	EOR R10, R18
	EOR R11, R19

	LD R20, Z+
	LD R21, Z+
	LD R22, Z+
	LD R23, Z+

	EOR R20, R7
	EOR R21, R4
	EOR R22, R5
	EOR R23, R6

	ADD R8, R20
	ADC R9, R21
	ADC R10, R22
	ADC R11, R23

	CLR R20
	LSR R11
	ROR R10
	ROR R9
	ROR R8
	ROR R20

	LSR R11
	ROR R10
	ROR R9
	ROR R8
	ROR R20

	LSR R11
	ROR R10
	ROR R9
	ROR R8
	ROR R20

	EOR R11, R20

	//4_2
	EOR R7, R16
	EOR R4, R17
	EOR R5, R18
	EOR R6, R19

	LD R20, Z+
	LD R21, Z+
	LD R22, Z+
	LD R23, Z+

	EOR R20, R1
	EOR R21, R2
	EOR R22, R3
	EOR R23, R0

	ADD R7, R20
	ADC R4, R21
	ADC R5, R22
	ADC R6, R23

	CLR R20
	LSL R7
	ROL R4
	ROL R5
	ROL R6
	ROL R20

	LSL R7
	ROL R4
	ROL R5
	ROL R6
	ROL R20

	LSL R7
	ROL R4
	ROL R5
	ROL R6
	ROL R20

	EOR R7, R20
	
	//4_3
	EOR R1, R16
	EOR R2, R17
	EOR R3, R18
	EOR R0, R19

	LD R20, Z+
	LD R21, Z+
	LD R22, Z+
	LD R23, Z+

	EOR R20, R12
	EOR R21, R13
	EOR R22, R14
	EOR R23, R15

	ADD R1 , R20
	ADC R2 , R21
	ADC R3 , R22
	ADC R0 , R23

	CLR R20
	LSL R1
	ROL R2
	ROL R3
	ROL R0
	ROL R20
		
	EOR R1, R20

		//STEP 5
	//5_1			
	LD R16, Z+
	LD R17, Z+
	LD R18, Z+
	LD R19, Z+
	
	EOR R12, R16
	EOR R13, R17
	EOR R14, R18
	EOR R15, R19

	LD R20, Z+
	LD R21, Z+
	LD R22, Z+
	LD R23, Z+

	EOR R20, R8
	EOR R21, R9
	EOR R22, R10
	EOR R23, R11

	ADD R12, R20
	ADC R13, R21
	ADC R14, R22
	ADC R15, R23

	CLR R20
	LSR R15
	ROR R14
	ROR R13
	ROR R12
	ROR R20

	LSR R15
	ROR R14
	ROR R13
	ROR R12
	ROR R20

	LSR R15
	ROR R14
	ROR R13
	ROR R12
	ROR R20

	EOR R15, R20

	//5_2
	EOR R8, R16
	EOR R9, R17
	EOR R10, R18
	EOR R11, R19

	LD R20, Z+
	LD R21, Z+
	LD R22, Z+
	LD R23, Z+

	EOR R20, R4
	EOR R21, R5
	EOR R22, R6
	EOR R23, R7

	ADD R8, R20
	ADC R9, R21
	ADC R10, R22
	ADC R11, R23

	CLR R20
	LSL R8
	ROL R9
	ROL R10
	ROL R11
	ROL R20

	LSL R8
	ROL R9
	ROL R10
	ROL R11
	ROL R20

	LSL R8
	ROL R9
	ROL R10
	ROL R11
	ROL R20

	EOR R8, R20
	
	//5_3
	EOR R4, R16
	EOR R5, R17
	EOR R6, R18
	EOR R7, R19

	LD R20, Z+
	LD R21, Z+
	LD R22, Z+
	LD R23, Z+

	EOR R20, R0
	EOR R21, R1
	EOR R22, R2
	EOR R23, R3

	ADD R4 , R20
	ADC R5 , R21
	ADC R6 , R22
	ADC R7 , R23

	CLR R20
	LSL R4
	ROL R5
	ROL R6
	ROL R7
	ROL R20
		
	EOR R4, R20

	//STEP 6
	//6_1			
	LD R16, Z+
	LD R17, Z+
	LD R18, Z+
	LD R19, Z+
	
	EOR R0, R16
	EOR R1, R17
	EOR R2, R18
	EOR R3, R19

	LD R20, Z+
	LD R21, Z+
	LD R22, Z+
	LD R23, Z+

	EOR R20, R12
	EOR R21, R13
	EOR R22, R14
	EOR R23, R15

	ADD R0, R20
	ADC R1, R21
	ADC R2, R22
	ADC R3, R23

	CLR R20
	LSR R3
	ROR R2
	ROR R1
	ROR R0
	ROR R20

	LSR R3
	ROR R2
	ROR R1
	ROR R0
	ROR R20

	LSR R3
	ROR R2
	ROR R1
	ROR R0
	ROR R20

	EOR R3, R20

	//6_2
	EOR R12, R16
	EOR R13, R17
	EOR R14, R18
	EOR R15, R19

	LD R20, Z+
	LD R21, Z+
	LD R22, Z+
	LD R23, Z+

	EOR R20, R9
	EOR R21, R10
	EOR R22, R11
	EOR R23, R8

	ADD R12, R20
	ADC R13, R21
	ADC R14, R22
	ADC R15, R23

	CLR R20
	LSL R12
	ROL R13
	ROL R14
	ROL R15
	ROL R20

	LSL R12
	ROL R13
	ROL R14
	ROL R15
	ROL R20

	LSL R12
	ROL R13
	ROL R14
	ROL R15
	ROL R20

	EOR R12, R20
	
	//6_3
	EOR R9, R16
	EOR R10, R17
	EOR R11, R18
	EOR R8, R19

	LD R20, Z+
	LD R21, Z+
	LD R22, Z+
	LD R23, Z+

	EOR R20, R7
	EOR R21, R4
	EOR R22, R5
	EOR R23, R6

	ADD R9 , R20
	ADC R10 , R21
	ADC R11 , R22
	ADC R8 , R23

	CLR R20
	LSL R9
	ROL R10
	ROL R11
	ROL R8
	ROL R20
		
	EOR R9, R20

	//STEP 7
	//7_1			
	LD R16, Z+
	LD R17, Z+
	LD R18, Z+
	LD R19, Z+
	
	EOR R7, R16
	EOR R4, R17
	EOR R5, R18
	EOR R6, R19

	LD R20, Z+
	LD R21, Z+
	LD R22, Z+
	LD R23, Z+

	EOR R20, R0
	EOR R21, R1
	EOR R22, R2
	EOR R23, R3

	ADD R7, R20
	ADC R4, R21
	ADC R5, R22
	ADC R6, R23

	CLR R20
	LSR R6
	ROR R5
	ROR R4
	ROR R7
	ROR R20

	LSR R6
	ROR R5
	ROR R4
	ROR R7
	ROR R20

	LSR R6
	ROR R5
	ROR R4
	ROR R7
	ROR R20

	EOR R6, R20

	//7_2
	EOR R0, R16
	EOR R1, R17
	EOR R2, R18
	EOR R3, R19

	LD R20, Z+
	LD R21, Z+
	LD R22, Z+
	LD R23, Z+

	EOR R20, R13
	EOR R21, R14
	EOR R22, R15
	EOR R23, R12

	ADD R0, R20
	ADC R1, R21
	ADC R2, R22
	ADC R3, R23

	CLR R20
	LSL R0
	ROL R1
	ROL R2
	ROL R3
	ROL R20

	LSL R0
	ROL R1
	ROL R2
	ROL R3
	ROL R20

	LSL R0
	ROL R1
	ROL R2
	ROL R3
	ROL R20

	EOR R0, R20
	
	//7_3
	EOR R13, R16
	EOR R14, R17
	EOR R15, R18
	EOR R12, R19

	LD R20, Z+
	LD R21, Z+
	LD R22, Z+
	LD R23, Z+

	EOR R20, R8
	EOR R21, R9
	EOR R22, R10
	EOR R23, R11

	ADD R13 , R20
	ADC R14 , R21
	ADC R15 , R22
	ADC R12, R23

	CLR R20
	LSL R13
	ROL R14
	ROL R15
	ROL R12
	ROL R20
		
	EOR R13, R20


		//STEP 4
	//4_1			
	LD R16, Z+
	LD R17, Z+
	LD R18, Z+
	LD R19, Z+
	
	EOR R8, R16
	EOR R9, R17
	EOR R10, R18
	EOR R11, R19

	LD R20, Z+
	LD R21, Z+
	LD R22, Z+
	LD R23, Z+

	EOR R20, R7
	EOR R21, R4
	EOR R22, R5
	EOR R23, R6

	ADD R8, R20
	ADC R9, R21
	ADC R10, R22
	ADC R11, R23

	CLR R20
	LSR R11
	ROR R10
	ROR R9
	ROR R8
	ROR R20

	LSR R11
	ROR R10
	ROR R9
	ROR R8
	ROR R20

	LSR R11
	ROR R10
	ROR R9
	ROR R8
	ROR R20

	EOR R11, R20

	//4_2
	EOR R7, R16
	EOR R4, R17
	EOR R5, R18
	EOR R6, R19

	LD R20, Z+
	LD R21, Z+
	LD R22, Z+
	LD R23, Z+

	EOR R20, R1
	EOR R21, R2
	EOR R22, R3
	EOR R23, R0

	ADD R7, R20
	ADC R4, R21
	ADC R5, R22
	ADC R6, R23

	CLR R20
	LSL R7
	ROL R4
	ROL R5
	ROL R6
	ROL R20

	LSL R7
	ROL R4
	ROL R5
	ROL R6
	ROL R20

	LSL R7
	ROL R4
	ROL R5
	ROL R6
	ROL R20

	EOR R7, R20
	
	//4_3
	EOR R1, R16
	EOR R2, R17
	EOR R3, R18
	EOR R0, R19

	LD R20, Z+
	LD R21, Z+
	LD R22, Z+
	LD R23, Z+

	EOR R20, R12
	EOR R21, R13
	EOR R22, R14
	EOR R23, R15

	ADD R1 , R20
	ADC R2 , R21
	ADC R3 , R22
	ADC R0 , R23

	CLR R20
	LSL R1
	ROL R2
	ROL R3
	ROL R0
	ROL R20
		
	EOR R1, R20

		//STEP 5
	//5_1			
	LD R16, Z+
	LD R17, Z+
	LD R18, Z+
	LD R19, Z+
	
	EOR R12, R16
	EOR R13, R17
	EOR R14, R18
	EOR R15, R19

	LD R20, Z+
	LD R21, Z+
	LD R22, Z+
	LD R23, Z+

	EOR R20, R8
	EOR R21, R9
	EOR R22, R10
	EOR R23, R11

	ADD R12, R20
	ADC R13, R21
	ADC R14, R22
	ADC R15, R23

	CLR R20
	LSR R15
	ROR R14
	ROR R13
	ROR R12
	ROR R20

	LSR R15
	ROR R14
	ROR R13
	ROR R12
	ROR R20

	LSR R15
	ROR R14
	ROR R13
	ROR R12
	ROR R20

	EOR R15, R20

	//5_2
	EOR R8, R16
	EOR R9, R17
	EOR R10, R18
	EOR R11, R19

	LD R20, Z+
	LD R21, Z+
	LD R22, Z+
	LD R23, Z+

	EOR R20, R4
	EOR R21, R5
	EOR R22, R6
	EOR R23, R7

	ADD R8, R20
	ADC R9, R21
	ADC R10, R22
	ADC R11, R23

	CLR R20
	LSL R8
	ROL R9
	ROL R10
	ROL R11
	ROL R20

	LSL R8
	ROL R9
	ROL R10
	ROL R11
	ROL R20

	LSL R8
	ROL R9
	ROL R10
	ROL R11
	ROL R20

	EOR R8, R20
	
	//5_3
	EOR R4, R16
	EOR R5, R17
	EOR R6, R18
	EOR R7, R19

	LD R20, Z+
	LD R21, Z+
	LD R22, Z+
	LD R23, Z+

	EOR R20, R0
	EOR R21, R1
	EOR R22, R2
	EOR R23, R3

	ADD R4 , R20
	ADC R5 , R21
	ADC R6 , R22
	ADC R7 , R23

	CLR R20
	LSL R4
	ROL R5
	ROL R6
	ROL R7
	ROL R20
		
	EOR R4, R20

	//STEP 6
	//6_1			
	LD R16, Z+
	LD R17, Z+
	LD R18, Z+
	LD R19, Z+
	
	EOR R0, R16
	EOR R1, R17
	EOR R2, R18
	EOR R3, R19

	LD R20, Z+
	LD R21, Z+
	LD R22, Z+
	LD R23, Z+

	EOR R20, R12
	EOR R21, R13
	EOR R22, R14
	EOR R23, R15

	ADD R0, R20
	ADC R1, R21
	ADC R2, R22
	ADC R3, R23

	CLR R20
	LSR R3
	ROR R2
	ROR R1
	ROR R0
	ROR R20

	LSR R3
	ROR R2
	ROR R1
	ROR R0
	ROR R20

	LSR R3
	ROR R2
	ROR R1
	ROR R0
	ROR R20

	EOR R3, R20

	//6_2
	EOR R12, R16
	EOR R13, R17
	EOR R14, R18
	EOR R15, R19

	LD R20, Z+
	LD R21, Z+
	LD R22, Z+
	LD R23, Z+

	EOR R20, R9
	EOR R21, R10
	EOR R22, R11
	EOR R23, R8

	ADD R12, R20
	ADC R13, R21
	ADC R14, R22
	ADC R15, R23

	CLR R20
	LSL R12
	ROL R13
	ROL R14
	ROL R15
	ROL R20

	LSL R12
	ROL R13
	ROL R14
	ROL R15
	ROL R20

	LSL R12
	ROL R13
	ROL R14
	ROL R15
	ROL R20

	EOR R12, R20
	
	//6_3
	EOR R9, R16
	EOR R10, R17
	EOR R11, R18
	EOR R8, R19

	LD R20, Z+
	LD R21, Z+
	LD R22, Z+
	LD R23, Z+

	EOR R20, R7
	EOR R21, R4
	EOR R22, R5
	EOR R23, R6

	ADD R9 , R20
	ADC R10 , R21
	ADC R11 , R22
	ADC R8 , R23

	CLR R20
	LSL R9
	ROL R10
	ROL R11
	ROL R8
	ROL R20
		
	EOR R9, R20

	//STEP 7
	//7_1			
	LD R16, Z+
	LD R17, Z+
	LD R18, Z+
	LD R19, Z+
	
	EOR R7, R16
	EOR R4, R17
	EOR R5, R18
	EOR R6, R19

	LD R20, Z+
	LD R21, Z+
	LD R22, Z+
	LD R23, Z+

	EOR R20, R0
	EOR R21, R1
	EOR R22, R2
	EOR R23, R3

	ADD R7, R20
	ADC R4, R21
	ADC R5, R22
	ADC R6, R23

	CLR R20
	LSR R6
	ROR R5
	ROR R4
	ROR R7
	ROR R20

	LSR R6
	ROR R5
	ROR R4
	ROR R7
	ROR R20

	LSR R6
	ROR R5
	ROR R4
	ROR R7
	ROR R20

	EOR R6, R20

	//7_2
	EOR R0, R16
	EOR R1, R17
	EOR R2, R18
	EOR R3, R19

	LD R20, Z+
	LD R21, Z+
	LD R22, Z+
	LD R23, Z+

	EOR R20, R13
	EOR R21, R14
	EOR R22, R15
	EOR R23, R12

	ADD R0, R20
	ADC R1, R21
	ADC R2, R22
	ADC R3, R23

	CLR R20
	LSL R0
	ROL R1
	ROL R2
	ROL R3
	ROL R20

	LSL R0
	ROL R1
	ROL R2
	ROL R3
	ROL R20

	LSL R0
	ROL R1
	ROL R2
	ROL R3
	ROL R20

	EOR R0, R20
	
	//7_3
	EOR R13, R16
	EOR R14, R17
	EOR R15, R18
	EOR R12, R19

	LD R20, Z+
	LD R21, Z+
	LD R22, Z+
	LD R23, Z+

	EOR R20, R8
	EOR R21, R9
	EOR R22, R10
	EOR R23, R11

	ADD R13 , R20
	ADC R14 , R21
	ADC R15 , R22
	ADC R12, R23

	CLR R20
	LSL R13
	ROL R14
	ROL R15
	ROL R12
	ROL R20
		
	EOR R13, R20


		//STEP 4
	//4_1			
	LD R16, Z+
	LD R17, Z+
	LD R18, Z+
	LD R19, Z+
	
	EOR R8, R16
	EOR R9, R17
	EOR R10, R18
	EOR R11, R19

	LD R20, Z+
	LD R21, Z+
	LD R22, Z+
	LD R23, Z+

	EOR R20, R7
	EOR R21, R4
	EOR R22, R5
	EOR R23, R6

	ADD R8, R20
	ADC R9, R21
	ADC R10, R22
	ADC R11, R23

	CLR R20
	LSR R11
	ROR R10
	ROR R9
	ROR R8
	ROR R20

	LSR R11
	ROR R10
	ROR R9
	ROR R8
	ROR R20

	LSR R11
	ROR R10
	ROR R9
	ROR R8
	ROR R20

	EOR R11, R20

	//4_2
	EOR R7, R16
	EOR R4, R17
	EOR R5, R18
	EOR R6, R19

	LD R20, Z+
	LD R21, Z+
	LD R22, Z+
	LD R23, Z+

	EOR R20, R1
	EOR R21, R2
	EOR R22, R3
	EOR R23, R0

	ADD R7, R20
	ADC R4, R21
	ADC R5, R22
	ADC R6, R23

	CLR R20
	LSL R7
	ROL R4
	ROL R5
	ROL R6
	ROL R20

	LSL R7
	ROL R4
	ROL R5
	ROL R6
	ROL R20

	LSL R7
	ROL R4
	ROL R5
	ROL R6
	ROL R20

	EOR R7, R20
	
	//4_3
	EOR R1, R16
	EOR R2, R17
	EOR R3, R18
	EOR R0, R19

	LD R20, Z+
	LD R21, Z+
	LD R22, Z+
	LD R23, Z+

	EOR R20, R12
	EOR R21, R13
	EOR R22, R14
	EOR R23, R15

	ADD R1 , R20
	ADC R2 , R21
	ADC R3 , R22
	ADC R0 , R23

	CLR R20
	LSL R1
	ROL R2
	ROL R3
	ROL R0
	ROL R20
		
	EOR R1, R20


	ST Y+,R0
	ST Y+,R1
	ST Y+,R2
	ST Y+,R3
	
	ST Y+,R4
	ST Y+,R5
	ST Y+,R6
	ST Y+,R7

	ST Y+,R8
	ST Y+,R9
	ST Y+,R10
	ST Y+,R11

	ST Y+,R12
	ST Y+,R13
	ST Y+,R14
	ST Y+,R15



	CLR R1
	POP R29
	POP R28
	POP R17
	POP R16
	POP R15
	POP R14
	POP R13
	POP R12
	POP R11
	POP R10
	POP R9 
	POP R8 
	POP R7 
	POP R6 
	POP R5 
	POP R4 
	POP R3 
	POP R2 
	RET