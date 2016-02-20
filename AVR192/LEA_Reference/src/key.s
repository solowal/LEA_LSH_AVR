﻿	.global LEA_Keyschedule
	.type LEA_Keyschedule, @function
  
	; operand b: r21:r20
	; operand a: r23:r22
	; operand r: r25:r24
  
	LEA_Keyschedule:

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
	MOVW R26, R22//key
	MOVW R28, R20//delta
	MOVW R30, R24//round

	LD R0, X+
	LD R1, X+
	LD R2, X+
	LD R3, X+
	LD R4, X+
	LD R5, X+
	LD R6, X+
	LD R7, X+
	LD R8, X+
	LD R9, X+
	LD R10,X+
	LD R11,X+
	LD R12,X+
	LD R13,X+
	LD R14,X+
	LD R15,X+


	//ROUND 0
	//T[0]
	LDD R23, Y+0
	LDD R24, Y+1
	LDD R25, Y+2
	LDD R26, Y+3
	CLR R27

	ADD R0, R23
	ADC R1, R24
	ADC R2, R25
	ADC R3, R26
	CLR R16

	LSL R0
	ROL R1
	ROL R2
	ROL R3
	ROL R16
	EOR R0, R16
	
	//T[1]
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	EOR R23, R27

	ADD R4, R23
	ADC R5, R24
	ADC R6, R25
	ADC R7, R26
	CLR R16

	LSL R4
	ROL R5
	ROL R6
	ROL R7
	ROL R16
	
	LSL R4
	ROL R5
	ROL R6
	ROL R7
	ROL R16

	LSL R4
	ROL R5
	ROL R6
	ROL R7
	ROL R16	
	EOR R4, R16	
	
	//T[2]
	CLR R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	EOR R23, R27

	ADD R8,  R23
	ADC R9,  R24
	ADC R10, R25
	ADC R11, R26
	
	CLR R16
	LSR R11
	ROR R10
	ROR R9
	ROR R8
	ROR R16
	
	LSR R11
	ROR R10
	ROR R9
	ROR R8
	ROR R16

	EOR R16, R11
	MOV R11, R10
	MOV R10, R9
	MOV R9,  R8
	MOV R8,  R16
	
	//T[3]
	CLR R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	EOR R23, R27

	ADD R12,  R23
	ADC R13,  R24
	ADC R14,  R25
	ADC R15,  R26
	
	CLR R16
	LSL R12
	ROL R13
	ROL R14
	ROL R15
	ROL R16

	LSL R12
	ROL R13
	ROL R14
	ROL R15
	ROL R16

	LSL R12
	ROL R13
	ROL R14
	ROL R15
	ROL R16
	
	EOR R16, R12
	
	MOV R12, R15
	MOV R15, R14
	MOV R14, R13
	MOV R13, R16
	
	//STORE
	ST Z+, R4
	ST Z+, R5
	ST Z+, R6
	ST Z+, R7

	ST Z+, R12
	ST Z+, R13
	ST Z+, R14
	ST Z+, R15

	ST Z+, R8
	ST Z+, R9
	ST Z+, R10
	ST Z+, R11

	ST Z+, R0
	ST Z+, R1
	ST Z+, R2
	ST Z+, R3


	//ROUND 1
	//T[0]
	LDD R23, Y+4
	LDD R24, Y+5
	LDD R25, Y+6
	LDD R26, Y+7
	CLR R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	EOR R23, R27
	
	ADD R0, R23
	ADC R1, R24
	ADC R2, R25
	ADC R3, R26
	CLR R16

	LSL R0
	ROL R1
	ROL R2
	ROL R3
	ROL R16
	EOR R0, R16
	
	//T[1]
	CLR R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	EOR R23, R27

	ADD R4, R23
	ADC R5, R24
	ADC R6, R25
	ADC R7, R26
	CLR R16

	LSL R4
	ROL R5
	ROL R6
	ROL R7
	ROL R16
	
	LSL R4
	ROL R5
	ROL R6
	ROL R7
	ROL R16

	LSL R4
	ROL R5
	ROL R6
	ROL R7
	ROL R16	
	EOR R4, R16	
	
	//T[2]
	CLR R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	EOR R23, R27

	ADD R8,  R23
	ADC R9,  R24
	ADC R10, R25
	ADC R11, R26
	
	CLR R16
	LSR R11
	ROR R10
	ROR R9
	ROR R8
	ROR R16
	
	LSR R11
	ROR R10
	ROR R9
	ROR R8
	ROR R16

	EOR R16, R11
	MOV R11, R10
	MOV R10, R9
	MOV R9,  R8
	MOV R8,  R16
	
	//T[3]
	CLR R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	EOR R23, R27

	ADD R12,  R23
	ADC R13,  R24
	ADC R14,  R25
	ADC R15,  R26
	
	CLR R16
	LSL R12
	ROL R13
	ROL R14
	ROL R15
	ROL R16

	LSL R12
	ROL R13
	ROL R14
	ROL R15
	ROL R16

	LSL R12
	ROL R13
	ROL R14
	ROL R15
	ROL R16
	
	EOR R16, R12
	
	MOV R12, R15
	MOV R15, R14
	MOV R14, R13
	MOV R13, R16
	
	//STORE
	ST Z+, R4
	ST Z+, R5
	ST Z+, R6
	ST Z+, R7

	ST Z+, R12
	ST Z+, R13
	ST Z+, R14
	ST Z+, R15

	ST Z+, R8
	ST Z+, R9
	ST Z+, R10
	ST Z+, R11

	ST Z+, R0
	ST Z+, R1
	ST Z+, R2
	ST Z+, R3

	//ROUND 2
	//T[0]
	LDD R23, Y+8
	LDD R24, Y+9
	LDD R25, Y+10
	LDD R26, Y+11
	CLR R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	EOR R23, R27
	
	ADD R0, R23
	ADC R1, R24
	ADC R2, R25
	ADC R3, R26
	CLR R16

	LSL R0
	ROL R1
	ROL R2
	ROL R3
	ROL R16
	EOR R0, R16
	
	//T[1]
	CLR R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	EOR R23, R27

	ADD R4, R23
	ADC R5, R24
	ADC R6, R25
	ADC R7, R26
	CLR R16

	LSL R4
	ROL R5
	ROL R6
	ROL R7
	ROL R16
	
	LSL R4
	ROL R5
	ROL R6
	ROL R7
	ROL R16

	LSL R4
	ROL R5
	ROL R6
	ROL R7
	ROL R16	
	EOR R4, R16	
	
	//T[2]
	CLR R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	EOR R23, R27

	ADD R8,  R23
	ADC R9,  R24
	ADC R10, R25
	ADC R11, R26
	
	CLR R16
	LSR R11
	ROR R10
	ROR R9
	ROR R8
	ROR R16
	
	LSR R11
	ROR R10
	ROR R9
	ROR R8
	ROR R16

	EOR R16, R11
	MOV R11, R10
	MOV R10, R9
	MOV R9,  R8
	MOV R8,  R16
	
	//T[3]
	CLR R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	EOR R23, R27

	ADD R12,  R23
	ADC R13,  R24
	ADC R14,  R25
	ADC R15,  R26
	
	CLR R16
	LSL R12
	ROL R13
	ROL R14
	ROL R15
	ROL R16

	LSL R12
	ROL R13
	ROL R14
	ROL R15
	ROL R16

	LSL R12
	ROL R13
	ROL R14
	ROL R15
	ROL R16
	
	EOR R16, R12
	
	MOV R12, R15
	MOV R15, R14
	MOV R14, R13
	MOV R13, R16
	
	//STORE
	ST Z+, R4
	ST Z+, R5
	ST Z+, R6
	ST Z+, R7

	ST Z+, R12
	ST Z+, R13
	ST Z+, R14
	ST Z+, R15

	ST Z+, R8
	ST Z+, R9
	ST Z+, R10
	ST Z+, R11

	ST Z+, R0
	ST Z+, R1
	ST Z+, R2
	ST Z+, R3

	//ROUND 3
	//T[0]
	LDD R23, Y+12
	LDD R24, Y+13
	LDD R25, Y+14
	LDD R26, Y+15
	CLR R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	EOR R23, R27
	
	ADD R0, R23
	ADC R1, R24
	ADC R2, R25
	ADC R3, R26
	CLR R16

	LSL R0
	ROL R1
	ROL R2
	ROL R3
	ROL R16
	EOR R0, R16
	
	//T[1]
	CLR R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	EOR R23, R27

	ADD R4, R23
	ADC R5, R24
	ADC R6, R25
	ADC R7, R26
	CLR R16

	LSL R4
	ROL R5
	ROL R6
	ROL R7
	ROL R16
	
	LSL R4
	ROL R5
	ROL R6
	ROL R7
	ROL R16

	LSL R4
	ROL R5
	ROL R6
	ROL R7
	ROL R16	
	EOR R4, R16	
	
	//T[2]
	CLR R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	EOR R23, R27

	ADD R8,  R23
	ADC R9,  R24
	ADC R10, R25
	ADC R11, R26
	
	CLR R16
	LSR R11
	ROR R10
	ROR R9
	ROR R8
	ROR R16
	
	LSR R11
	ROR R10
	ROR R9
	ROR R8
	ROR R16

	EOR R16, R11
	MOV R11, R10
	MOV R10, R9
	MOV R9,  R8
	MOV R8,  R16
	
	//T[3]
	CLR R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	EOR R23, R27

	ADD R12,  R23
	ADC R13,  R24
	ADC R14,  R25
	ADC R15,  R26
	
	CLR R16
	LSL R12
	ROL R13
	ROL R14
	ROL R15
	ROL R16

	LSL R12
	ROL R13
	ROL R14
	ROL R15
	ROL R16

	LSL R12
	ROL R13
	ROL R14
	ROL R15
	ROL R16
	
	EOR R16, R12
	
	MOV R12, R15
	MOV R15, R14
	MOV R14, R13
	MOV R13, R16
	
	//STORE
	ST Z+, R4
	ST Z+, R5
	ST Z+, R6
	ST Z+, R7

	ST Z+, R12
	ST Z+, R13
	ST Z+, R14
	ST Z+, R15

	ST Z+, R8
	ST Z+, R9
	ST Z+, R10
	ST Z+, R11

	ST Z+, R0
	ST Z+, R1
	ST Z+, R2
	ST Z+, R3

	//ROUND 4
	//T[0]
	LDD R23, Y+0
	LDD R24, Y+1
	LDD R25, Y+2
	LDD R26, Y+3

	CLR R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	EOR R23, R27

	ADD R0, R23
	ADC R1, R24
	ADC R2, R25
	ADC R3, R26
	CLR R16

	LSL R0
	ROL R1
	ROL R2
	ROL R3
	ROL R16
	EOR R0, R16
	
	//T[1]
	CLR R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	EOR R23, R27

	ADD R4, R23
	ADC R5, R24
	ADC R6, R25
	ADC R7, R26
	CLR R16

	LSL R4
	ROL R5
	ROL R6
	ROL R7
	ROL R16
	
	LSL R4
	ROL R5
	ROL R6
	ROL R7
	ROL R16

	LSL R4
	ROL R5
	ROL R6
	ROL R7
	ROL R16	
	EOR R4, R16	
	
	//T[2]
	CLR R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	EOR R23, R27

	ADD R8,  R23
	ADC R9,  R24
	ADC R10, R25
	ADC R11, R26
	
	CLR R16
	LSR R11
	ROR R10
	ROR R9
	ROR R8
	ROR R16
	
	LSR R11
	ROR R10
	ROR R9
	ROR R8
	ROR R16

	EOR R16, R11
	MOV R11, R10
	MOV R10, R9
	MOV R9,  R8
	MOV R8,  R16
	
	//T[3]
	CLR R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	EOR R23, R27

	ADD R12,  R23
	ADC R13,  R24
	ADC R14,  R25
	ADC R15,  R26
	
	CLR R16
	LSL R12
	ROL R13
	ROL R14
	ROL R15
	ROL R16

	LSL R12
	ROL R13
	ROL R14
	ROL R15
	ROL R16

	LSL R12
	ROL R13
	ROL R14
	ROL R15
	ROL R16
	
	EOR R16, R12
	
	MOV R12, R15
	MOV R15, R14
	MOV R14, R13
	MOV R13, R16
	
	//STORE
	ST Z+, R4
	ST Z+, R5
	ST Z+, R6
	ST Z+, R7

	ST Z+, R12
	ST Z+, R13
	ST Z+, R14
	ST Z+, R15

	ST Z+, R8
	ST Z+, R9
	ST Z+, R10
	ST Z+, R11

	ST Z+, R0
	ST Z+, R1
	ST Z+, R2
	ST Z+, R3


	//ROUND 5
	//T[0]
	LDD R23, Y+4
	LDD R24, Y+5
	LDD R25, Y+6
	LDD R26, Y+7

	CLR R27
	LSR R26
	ROR R25
	ROR R24
	ROR R23
	ROR R27
	LSR R26
	ROR R25
	ROR R24
	ROR R23
	ROR R27
	LSR R26	
	ROR R25
	ROR R24
	ROR R23
	ROR R27

	EOR R27, R26
	MOV R26, R25
	MOV R25, R24
	MOV R24, R23
	MOV R23, R27

	ADD R0, R23
	ADC R1, R24
	ADC R2, R25
	ADC R3, R26
	CLR R16

	LSL R0
	ROL R1
	ROL R2
	ROL R3
	ROL R16
	EOR R0, R16
	
	//T[1]
	CLR R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	EOR R23, R27

	ADD R4, R23
	ADC R5, R24
	ADC R6, R25
	ADC R7, R26
	CLR R16

	LSL R4
	ROL R5
	ROL R6
	ROL R7
	ROL R16
	
	LSL R4
	ROL R5
	ROL R6
	ROL R7
	ROL R16

	LSL R4
	ROL R5
	ROL R6
	ROL R7
	ROL R16	
	EOR R4, R16	
	
	//T[2]
	CLR R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	EOR R23, R27

	ADD R8,  R23
	ADC R9,  R24
	ADC R10, R25
	ADC R11, R26
	
	CLR R16
	LSR R11
	ROR R10
	ROR R9
	ROR R8
	ROR R16
	
	LSR R11
	ROR R10
	ROR R9
	ROR R8
	ROR R16

	EOR R16, R11
	MOV R11, R10
	MOV R10, R9
	MOV R9,  R8
	MOV R8,  R16
	
	//T[3]
	CLR R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	EOR R23, R27

	ADD R12,  R23
	ADC R13,  R24
	ADC R14,  R25
	ADC R15,  R26
	
	CLR R16
	LSL R12
	ROL R13
	ROL R14
	ROL R15
	ROL R16

	LSL R12
	ROL R13
	ROL R14
	ROL R15
	ROL R16

	LSL R12
	ROL R13
	ROL R14
	ROL R15
	ROL R16
	
	EOR R16, R12
	
	MOV R12, R15
	MOV R15, R14
	MOV R14, R13
	MOV R13, R16
	
	//STORE
	ST Z+, R4
	ST Z+, R5
	ST Z+, R6
	ST Z+, R7

	ST Z+, R12
	ST Z+, R13
	ST Z+, R14
	ST Z+, R15

	ST Z+, R8
	ST Z+, R9
	ST Z+, R10
	ST Z+, R11

	ST Z+, R0
	ST Z+, R1
	ST Z+, R2
	ST Z+, R3

	//ROUND 6
	//T[0]
	LDD R23, Y+8
	LDD R24, Y+9
	LDD R25, Y+10
	LDD R26, Y+11

	CLR R27	
	LSR R26
	ROR R25
	ROR R24
	ROR R23
	ROR R27
	LSR R26	
	ROR R25
	ROR R24
	ROR R23
	ROR R27

	EOR R27, R26
	MOV R26, R25
	MOV R25, R24
	MOV R24, R23
	MOV R23, R27

	ADD R0, R23
	ADC R1, R24
	ADC R2, R25
	ADC R3, R26
	CLR R16

	LSL R0
	ROL R1
	ROL R2
	ROL R3
	ROL R16
	EOR R0, R16
	
	//T[1]
	CLR R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	EOR R23, R27

	ADD R4, R23
	ADC R5, R24
	ADC R6, R25
	ADC R7, R26
	CLR R16

	LSL R4
	ROL R5
	ROL R6
	ROL R7
	ROL R16
	
	LSL R4
	ROL R5
	ROL R6
	ROL R7
	ROL R16

	LSL R4
	ROL R5
	ROL R6
	ROL R7
	ROL R16	
	EOR R4, R16	
	
	//T[2]
	CLR R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	EOR R23, R27

	ADD R8,  R23
	ADC R9,  R24
	ADC R10, R25
	ADC R11, R26
	
	CLR R16
	LSR R11
	ROR R10
	ROR R9
	ROR R8
	ROR R16
	
	LSR R11
	ROR R10
	ROR R9
	ROR R8
	ROR R16

	EOR R16, R11
	MOV R11, R10
	MOV R10, R9
	MOV R9,  R8
	MOV R8,  R16
	
	//T[3]
	CLR R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	EOR R23, R27

	ADD R12,  R23
	ADC R13,  R24
	ADC R14,  R25
	ADC R15,  R26
	
	CLR R16
	LSL R12
	ROL R13
	ROL R14
	ROL R15
	ROL R16

	LSL R12
	ROL R13
	ROL R14
	ROL R15
	ROL R16

	LSL R12
	ROL R13
	ROL R14
	ROL R15
	ROL R16
	
	EOR R16, R12
	
	MOV R12, R15
	MOV R15, R14
	MOV R14, R13
	MOV R13, R16
	
	//STORE
	ST Z+, R4
	ST Z+, R5
	ST Z+, R6
	ST Z+, R7

	ST Z+, R12
	ST Z+, R13
	ST Z+, R14
	ST Z+, R15

	ST Z+, R8
	ST Z+, R9
	ST Z+, R10
	ST Z+, R11

	ST Z+, R0
	ST Z+, R1
	ST Z+, R2
	ST Z+, R3


	//ROUND 7
	//T[0]
	LDD R23, Y+12
	LDD R24, Y+13
	LDD R25, Y+14
	LDD R26, Y+15

	CLR R27		
	LSR R26	
	ROR R25
	ROR R24
	ROR R23
	ROR R27

	EOR R27, R26
	MOV R26, R25
	MOV R25, R24
	MOV R24, R23
	MOV R23, R27

	ADD R0, R23
	ADC R1, R24
	ADC R2, R25
	ADC R3, R26
	CLR R16

	LSL R0
	ROL R1
	ROL R2
	ROL R3
	ROL R16
	EOR R0, R16
	
	//T[1]
	CLR R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	EOR R23, R27

	ADD R4, R23
	ADC R5, R24
	ADC R6, R25
	ADC R7, R26
	CLR R16

	LSL R4
	ROL R5
	ROL R6
	ROL R7
	ROL R16
	
	LSL R4
	ROL R5
	ROL R6
	ROL R7
	ROL R16

	LSL R4
	ROL R5
	ROL R6
	ROL R7
	ROL R16	
	EOR R4, R16	
	
	//T[2]
	CLR R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	EOR R23, R27

	ADD R8,  R23
	ADC R9,  R24
	ADC R10, R25
	ADC R11, R26
	
	CLR R16
	LSR R11
	ROR R10
	ROR R9
	ROR R8
	ROR R16
	
	LSR R11
	ROR R10
	ROR R9
	ROR R8
	ROR R16

	EOR R16, R11
	MOV R11, R10
	MOV R10, R9
	MOV R9,  R8
	MOV R8,  R16
	
	//T[3]
	CLR R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	EOR R23, R27

	ADD R12,  R23
	ADC R13,  R24
	ADC R14,  R25
	ADC R15,  R26
	
	CLR R16
	LSL R12
	ROL R13
	ROL R14
	ROL R15
	ROL R16

	LSL R12
	ROL R13
	ROL R14
	ROL R15
	ROL R16

	LSL R12
	ROL R13
	ROL R14
	ROL R15
	ROL R16
	
	EOR R16, R12
	
	MOV R12, R15
	MOV R15, R14
	MOV R14, R13
	MOV R13, R16
	
	//STORE
	ST Z+, R4
	ST Z+, R5
	ST Z+, R6
	ST Z+, R7

	ST Z+, R12
	ST Z+, R13
	ST Z+, R14
	ST Z+, R15

	ST Z+, R8
	ST Z+, R9
	ST Z+, R10
	ST Z+, R11

	ST Z+, R0
	ST Z+, R1
	ST Z+, R2
	ST Z+, R3

	//ROUND 8
	//T[0]
	/*LDD R23, Y+0
	LDD R24, Y+1
	LDD R25, Y+2
	LDD R26, Y+3

	CLR R27		
	LSR R26	
	ROR R25
	ROR R24
	ROR R23
	ROR R27*/

	LDD R23, Y+3
	LDD R24, Y+0
	LDD R25, Y+1
	LDD R26, Y+2


	ADD R0, R23
	ADC R1, R24
	ADC R2, R25
	ADC R3, R26
	CLR R16

	LSL R0
	ROL R1
	ROL R2
	ROL R3
	ROL R16
	EOR R0, R16
	
	//T[1]
	CLR R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	EOR R23, R27

	ADD R4, R23
	ADC R5, R24
	ADC R6, R25
	ADC R7, R26
	CLR R16

	LSL R4
	ROL R5
	ROL R6
	ROL R7
	ROL R16
	
	LSL R4
	ROL R5
	ROL R6
	ROL R7
	ROL R16

	LSL R4
	ROL R5
	ROL R6
	ROL R7
	ROL R16	
	EOR R4, R16	
	
	//T[2]
	CLR R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	EOR R23, R27

	ADD R8,  R23
	ADC R9,  R24
	ADC R10, R25
	ADC R11, R26
	
	CLR R16
	LSR R11
	ROR R10
	ROR R9
	ROR R8
	ROR R16
	
	LSR R11
	ROR R10
	ROR R9
	ROR R8
	ROR R16

	EOR R16, R11
	MOV R11, R10
	MOV R10, R9
	MOV R9,  R8
	MOV R8,  R16
	
	//T[3]
	CLR R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	EOR R23, R27

	ADD R12,  R23
	ADC R13,  R24
	ADC R14,  R25
	ADC R15,  R26
	
	CLR R16
	LSL R12
	ROL R13
	ROL R14
	ROL R15
	ROL R16

	LSL R12
	ROL R13
	ROL R14
	ROL R15
	ROL R16

	LSL R12
	ROL R13
	ROL R14
	ROL R15
	ROL R16
	
	EOR R16, R12
	
	MOV R12, R15
	MOV R15, R14
	MOV R14, R13
	MOV R13, R16
	
	//STORE
	ST Z+, R4
	ST Z+, R5
	ST Z+, R6
	ST Z+, R7

	ST Z+, R12
	ST Z+, R13
	ST Z+, R14
	ST Z+, R15

	ST Z+, R8
	ST Z+, R9
	ST Z+, R10
	ST Z+, R11

	ST Z+, R0
	ST Z+, R1
	ST Z+, R2
	ST Z+, R3


	//ROUND 1
	//T[0]
	LDD R23, Y+7
	LDD R24, Y+4
	LDD R25, Y+5
	LDD R26, Y+6
	CLR R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	EOR R23, R27
	
	ADD R0, R23
	ADC R1, R24
	ADC R2, R25
	ADC R3, R26
	CLR R16

	LSL R0
	ROL R1
	ROL R2
	ROL R3
	ROL R16
	EOR R0, R16
	
	//T[1]
	CLR R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	EOR R23, R27

	ADD R4, R23
	ADC R5, R24
	ADC R6, R25
	ADC R7, R26
	CLR R16

	LSL R4
	ROL R5
	ROL R6
	ROL R7
	ROL R16
	
	LSL R4
	ROL R5
	ROL R6
	ROL R7
	ROL R16

	LSL R4
	ROL R5
	ROL R6
	ROL R7
	ROL R16	
	EOR R4, R16	
	
	//T[2]
	CLR R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	EOR R23, R27

	ADD R8,  R23
	ADC R9,  R24
	ADC R10, R25
	ADC R11, R26
	
	CLR R16
	LSR R11
	ROR R10
	ROR R9
	ROR R8
	ROR R16
	
	LSR R11
	ROR R10
	ROR R9
	ROR R8
	ROR R16

	EOR R16, R11
	MOV R11, R10
	MOV R10, R9
	MOV R9,  R8
	MOV R8,  R16
	
	//T[3]
	CLR R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	EOR R23, R27

	ADD R12,  R23
	ADC R13,  R24
	ADC R14,  R25
	ADC R15,  R26
	
	CLR R16
	LSL R12
	ROL R13
	ROL R14
	ROL R15
	ROL R16

	LSL R12
	ROL R13
	ROL R14
	ROL R15
	ROL R16

	LSL R12
	ROL R13
	ROL R14
	ROL R15
	ROL R16
	
	EOR R16, R12
	
	MOV R12, R15
	MOV R15, R14
	MOV R14, R13
	MOV R13, R16
	
	//STORE
	ST Z+, R4
	ST Z+, R5
	ST Z+, R6
	ST Z+, R7

	ST Z+, R12
	ST Z+, R13
	ST Z+, R14
	ST Z+, R15

	ST Z+, R8
	ST Z+, R9
	ST Z+, R10
	ST Z+, R11

	ST Z+, R0
	ST Z+, R1
	ST Z+, R2
	ST Z+, R3

	//ROUND 2
	//T[0]
	LDD R23, Y+11
	LDD R24, Y+8
	LDD R25, Y+9
	LDD R26, Y+10
	CLR R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	EOR R23, R27
	
	ADD R0, R23
	ADC R1, R24
	ADC R2, R25
	ADC R3, R26
	CLR R16

	LSL R0
	ROL R1
	ROL R2
	ROL R3
	ROL R16
	EOR R0, R16
	
	//T[1]
	CLR R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	EOR R23, R27

	ADD R4, R23
	ADC R5, R24
	ADC R6, R25
	ADC R7, R26
	CLR R16

	LSL R4
	ROL R5
	ROL R6
	ROL R7
	ROL R16
	
	LSL R4
	ROL R5
	ROL R6
	ROL R7
	ROL R16

	LSL R4
	ROL R5
	ROL R6
	ROL R7
	ROL R16	
	EOR R4, R16	
	
	//T[2]
	CLR R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	EOR R23, R27

	ADD R8,  R23
	ADC R9,  R24
	ADC R10, R25
	ADC R11, R26
	
	CLR R16
	LSR R11
	ROR R10
	ROR R9
	ROR R8
	ROR R16
	
	LSR R11
	ROR R10
	ROR R9
	ROR R8
	ROR R16

	EOR R16, R11
	MOV R11, R10
	MOV R10, R9
	MOV R9,  R8
	MOV R8,  R16
	
	//T[3]
	CLR R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	EOR R23, R27

	ADD R12,  R23
	ADC R13,  R24
	ADC R14,  R25
	ADC R15,  R26
	
	CLR R16
	LSL R12
	ROL R13
	ROL R14
	ROL R15
	ROL R16

	LSL R12
	ROL R13
	ROL R14
	ROL R15
	ROL R16

	LSL R12
	ROL R13
	ROL R14
	ROL R15
	ROL R16
	
	EOR R16, R12
	
	MOV R12, R15
	MOV R15, R14
	MOV R14, R13
	MOV R13, R16
	
	//STORE
	ST Z+, R4
	ST Z+, R5
	ST Z+, R6
	ST Z+, R7

	ST Z+, R12
	ST Z+, R13
	ST Z+, R14
	ST Z+, R15

	ST Z+, R8
	ST Z+, R9
	ST Z+, R10
	ST Z+, R11

	ST Z+, R0
	ST Z+, R1
	ST Z+, R2
	ST Z+, R3

	//ROUND 3
	//T[0]
	LDD R23, Y+15
	LDD R24, Y+12
	LDD R25, Y+13
	LDD R26, Y+14
	CLR R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	EOR R23, R27
	
	ADD R0, R23
	ADC R1, R24
	ADC R2, R25
	ADC R3, R26
	CLR R16

	LSL R0
	ROL R1
	ROL R2
	ROL R3
	ROL R16
	EOR R0, R16
	
	//T[1]
	CLR R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	EOR R23, R27

	ADD R4, R23
	ADC R5, R24
	ADC R6, R25
	ADC R7, R26
	CLR R16

	LSL R4
	ROL R5
	ROL R6
	ROL R7
	ROL R16
	
	LSL R4
	ROL R5
	ROL R6
	ROL R7
	ROL R16

	LSL R4
	ROL R5
	ROL R6
	ROL R7
	ROL R16	
	EOR R4, R16	
	
	//T[2]
	CLR R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	EOR R23, R27

	ADD R8,  R23
	ADC R9,  R24
	ADC R10, R25
	ADC R11, R26
	
	CLR R16
	LSR R11
	ROR R10
	ROR R9
	ROR R8
	ROR R16
	
	LSR R11
	ROR R10
	ROR R9
	ROR R8
	ROR R16

	EOR R16, R11
	MOV R11, R10
	MOV R10, R9
	MOV R9,  R8
	MOV R8,  R16
	
	//T[3]
	CLR R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	EOR R23, R27

	ADD R12,  R23
	ADC R13,  R24
	ADC R14,  R25
	ADC R15,  R26
	
	CLR R16
	LSL R12
	ROL R13
	ROL R14
	ROL R15
	ROL R16

	LSL R12
	ROL R13
	ROL R14
	ROL R15
	ROL R16

	LSL R12
	ROL R13
	ROL R14
	ROL R15
	ROL R16
	
	EOR R16, R12
	
	MOV R12, R15
	MOV R15, R14
	MOV R14, R13
	MOV R13, R16
	
	//STORE
	ST Z+, R4
	ST Z+, R5
	ST Z+, R6
	ST Z+, R7

	ST Z+, R12
	ST Z+, R13
	ST Z+, R14
	ST Z+, R15

	ST Z+, R8
	ST Z+, R9
	ST Z+, R10
	ST Z+, R11

	ST Z+, R0
	ST Z+, R1
	ST Z+, R2
	ST Z+, R3

	//ROUND 4
	//T[0]
	LDD R23, Y+3
	LDD R24, Y+0
	LDD R25, Y+1
	LDD R26, Y+2

	CLR R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	EOR R23, R27

	ADD R0, R23
	ADC R1, R24
	ADC R2, R25
	ADC R3, R26
	CLR R16

	LSL R0
	ROL R1
	ROL R2
	ROL R3
	ROL R16
	EOR R0, R16
	
	//T[1]
	CLR R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	EOR R23, R27

	ADD R4, R23
	ADC R5, R24
	ADC R6, R25
	ADC R7, R26
	CLR R16

	LSL R4
	ROL R5
	ROL R6
	ROL R7
	ROL R16
	
	LSL R4
	ROL R5
	ROL R6
	ROL R7
	ROL R16

	LSL R4
	ROL R5
	ROL R6
	ROL R7
	ROL R16	
	EOR R4, R16	
	
	//T[2]
	CLR R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	EOR R23, R27

	ADD R8,  R23
	ADC R9,  R24
	ADC R10, R25
	ADC R11, R26
	
	CLR R16
	LSR R11
	ROR R10
	ROR R9
	ROR R8
	ROR R16
	
	LSR R11
	ROR R10
	ROR R9
	ROR R8
	ROR R16

	EOR R16, R11
	MOV R11, R10
	MOV R10, R9
	MOV R9,  R8
	MOV R8,  R16
	
	//T[3]
	CLR R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	EOR R23, R27

	ADD R12,  R23
	ADC R13,  R24
	ADC R14,  R25
	ADC R15,  R26
	
	CLR R16
	LSL R12
	ROL R13
	ROL R14
	ROL R15
	ROL R16

	LSL R12
	ROL R13
	ROL R14
	ROL R15
	ROL R16

	LSL R12
	ROL R13
	ROL R14
	ROL R15
	ROL R16
	
	EOR R16, R12
	
	MOV R12, R15
	MOV R15, R14
	MOV R14, R13
	MOV R13, R16
	
	//STORE
	ST Z+, R4
	ST Z+, R5
	ST Z+, R6
	ST Z+, R7

	ST Z+, R12
	ST Z+, R13
	ST Z+, R14
	ST Z+, R15

	ST Z+, R8
	ST Z+, R9
	ST Z+, R10
	ST Z+, R11

	ST Z+, R0
	ST Z+, R1
	ST Z+, R2
	ST Z+, R3

	
	//ROUND 5
	//T[0]
	LDD R23, Y+7
	LDD R24, Y+4
	LDD R25, Y+5
	LDD R26, Y+6

	CLR R27
	LSR R26
	ROR R25
	ROR R24
	ROR R23
	ROR R27
	LSR R26
	ROR R25
	ROR R24
	ROR R23
	ROR R27
	LSR R26	
	ROR R25
	ROR R24
	ROR R23
	ROR R27

	EOR R27, R26
	MOV R26, R25
	MOV R25, R24
	MOV R24, R23
	MOV R23, R27

	ADD R0, R23
	ADC R1, R24
	ADC R2, R25
	ADC R3, R26
	CLR R16

	LSL R0
	ROL R1
	ROL R2
	ROL R3
	ROL R16
	EOR R0, R16
	
	//T[1]
	CLR R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	EOR R23, R27

	ADD R4, R23
	ADC R5, R24
	ADC R6, R25
	ADC R7, R26
	CLR R16

	LSL R4
	ROL R5
	ROL R6
	ROL R7
	ROL R16
	
	LSL R4
	ROL R5
	ROL R6
	ROL R7
	ROL R16

	LSL R4
	ROL R5
	ROL R6
	ROL R7
	ROL R16	
	EOR R4, R16	
	
	//T[2]
	CLR R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	EOR R23, R27

	ADD R8,  R23
	ADC R9,  R24
	ADC R10, R25
	ADC R11, R26
	
	CLR R16
	LSR R11
	ROR R10
	ROR R9
	ROR R8
	ROR R16
	
	LSR R11
	ROR R10
	ROR R9
	ROR R8
	ROR R16

	EOR R16, R11
	MOV R11, R10
	MOV R10, R9
	MOV R9,  R8
	MOV R8,  R16
	
	//T[3]
	CLR R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	EOR R23, R27

	ADD R12,  R23
	ADC R13,  R24
	ADC R14,  R25
	ADC R15,  R26
	
	CLR R16
	LSL R12
	ROL R13
	ROL R14
	ROL R15
	ROL R16

	LSL R12
	ROL R13
	ROL R14
	ROL R15
	ROL R16

	LSL R12
	ROL R13
	ROL R14
	ROL R15
	ROL R16
	
	EOR R16, R12
	
	MOV R12, R15
	MOV R15, R14
	MOV R14, R13
	MOV R13, R16
	
	//STORE
	ST Z+, R4
	ST Z+, R5
	ST Z+, R6
	ST Z+, R7

	ST Z+, R12
	ST Z+, R13
	ST Z+, R14
	ST Z+, R15

	ST Z+, R8
	ST Z+, R9
	ST Z+, R10
	ST Z+, R11

	ST Z+, R0
	ST Z+, R1
	ST Z+, R2
	ST Z+, R3

	//ROUND 6
	//T[0]
	LDD R23, Y+11
	LDD R24, Y+8
	LDD R25, Y+9
	LDD R26, Y+10

	CLR R27	
	LSR R26
	ROR R25
	ROR R24
	ROR R23
	ROR R27
	LSR R26	
	ROR R25
	ROR R24
	ROR R23
	ROR R27

	EOR R27, R26
	MOV R26, R25
	MOV R25, R24
	MOV R24, R23
	MOV R23, R27

	ADD R0, R23
	ADC R1, R24
	ADC R2, R25
	ADC R3, R26
	CLR R16

	LSL R0
	ROL R1
	ROL R2
	ROL R3
	ROL R16
	EOR R0, R16
	
	//T[1]
	CLR R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	EOR R23, R27

	ADD R4, R23
	ADC R5, R24
	ADC R6, R25
	ADC R7, R26
	CLR R16

	LSL R4
	ROL R5
	ROL R6
	ROL R7
	ROL R16
	
	LSL R4
	ROL R5
	ROL R6
	ROL R7
	ROL R16

	LSL R4
	ROL R5
	ROL R6
	ROL R7
	ROL R16	
	EOR R4, R16	
	
	//T[2]
	CLR R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	EOR R23, R27

	ADD R8,  R23
	ADC R9,  R24
	ADC R10, R25
	ADC R11, R26
	
	CLR R16
	LSR R11
	ROR R10
	ROR R9
	ROR R8
	ROR R16
	
	LSR R11
	ROR R10
	ROR R9
	ROR R8
	ROR R16

	EOR R16, R11
	MOV R11, R10
	MOV R10, R9
	MOV R9,  R8
	MOV R8,  R16
	
	//T[3]
	CLR R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	EOR R23, R27

	ADD R12,  R23
	ADC R13,  R24
	ADC R14,  R25
	ADC R15,  R26
	
	CLR R16
	LSL R12
	ROL R13
	ROL R14
	ROL R15
	ROL R16

	LSL R12
	ROL R13
	ROL R14
	ROL R15
	ROL R16

	LSL R12
	ROL R13
	ROL R14
	ROL R15
	ROL R16
	
	EOR R16, R12
	
	MOV R12, R15
	MOV R15, R14
	MOV R14, R13
	MOV R13, R16
	
	//STORE
	ST Z+, R4
	ST Z+, R5
	ST Z+, R6
	ST Z+, R7

	ST Z+, R12
	ST Z+, R13
	ST Z+, R14
	ST Z+, R15

	ST Z+, R8
	ST Z+, R9
	ST Z+, R10
	ST Z+, R11

	ST Z+, R0
	ST Z+, R1
	ST Z+, R2
	ST Z+, R3


	//ROUND 7
	//T[0]
	LDD R23, Y+15
	LDD R24, Y+12
	LDD R25, Y+13
	LDD R26, Y+14

	CLR R27		
	LSR R26	
	ROR R25
	ROR R24
	ROR R23
	ROR R27

	EOR R27, R26
	MOV R26, R25
	MOV R25, R24
	MOV R24, R23
	MOV R23, R27

	ADD R0, R23
	ADC R1, R24
	ADC R2, R25
	ADC R3, R26
	CLR R16

	LSL R0
	ROL R1
	ROL R2
	ROL R3
	ROL R16
	EOR R0, R16
	
	//T[1]
	CLR R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	EOR R23, R27

	ADD R4, R23
	ADC R5, R24
	ADC R6, R25
	ADC R7, R26
	CLR R16

	LSL R4
	ROL R5
	ROL R6
	ROL R7
	ROL R16
	
	LSL R4
	ROL R5
	ROL R6
	ROL R7
	ROL R16

	LSL R4
	ROL R5
	ROL R6
	ROL R7
	ROL R16	
	EOR R4, R16	
	
	//T[2]
	CLR R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	EOR R23, R27

	ADD R8,  R23
	ADC R9,  R24
	ADC R10, R25
	ADC R11, R26
	
	CLR R16
	LSR R11
	ROR R10
	ROR R9
	ROR R8
	ROR R16
	
	LSR R11
	ROR R10
	ROR R9
	ROR R8
	ROR R16

	EOR R16, R11
	MOV R11, R10
	MOV R10, R9
	MOV R9,  R8
	MOV R8,  R16
	
	//T[3]
	CLR R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	EOR R23, R27

	ADD R12,  R23
	ADC R13,  R24
	ADC R14,  R25
	ADC R15,  R26
	
	CLR R16
	LSL R12
	ROL R13
	ROL R14
	ROL R15
	ROL R16

	LSL R12
	ROL R13
	ROL R14
	ROL R15
	ROL R16

	LSL R12
	ROL R13
	ROL R14
	ROL R15
	ROL R16
	
	EOR R16, R12
	
	MOV R12, R15
	MOV R15, R14
	MOV R14, R13
	MOV R13, R16
	
	//STORE
	ST Z+, R4
	ST Z+, R5
	ST Z+, R6
	ST Z+, R7

	ST Z+, R12
	ST Z+, R13
	ST Z+, R14
	ST Z+, R15

	ST Z+, R8
	ST Z+, R9
	ST Z+, R10
	ST Z+, R11

	ST Z+, R0
	ST Z+, R1
	ST Z+, R2
	ST Z+, R3

	//ROUND 8
	//T[0]
	/*LDD R23, Y+0
	LDD R24, Y+1
	LDD R25, Y+2
	LDD R26, Y+3

	CLR R27		
	LSR R26	
	ROR R25
	ROR R24
	ROR R23
	ROR R27*/

	LDD R23, Y+2
	LDD R24, Y+3
	LDD R25, Y+0
	LDD R26, Y+1


	ADD R0, R23
	ADC R1, R24
	ADC R2, R25
	ADC R3, R26
	CLR R16

	LSL R0
	ROL R1
	ROL R2
	ROL R3
	ROL R16
	EOR R0, R16
	
	//T[1]
	CLR R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	EOR R23, R27

	ADD R4, R23
	ADC R5, R24
	ADC R6, R25
	ADC R7, R26
	CLR R16

	LSL R4
	ROL R5
	ROL R6
	ROL R7
	ROL R16
	
	LSL R4
	ROL R5
	ROL R6
	ROL R7
	ROL R16

	LSL R4
	ROL R5
	ROL R6
	ROL R7
	ROL R16	
	EOR R4, R16	
	
	//T[2]
	CLR R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	EOR R23, R27

	ADD R8,  R23
	ADC R9,  R24
	ADC R10, R25
	ADC R11, R26
	
	CLR R16
	LSR R11
	ROR R10
	ROR R9
	ROR R8
	ROR R16
	
	LSR R11
	ROR R10
	ROR R9
	ROR R8
	ROR R16

	EOR R16, R11
	MOV R11, R10
	MOV R10, R9
	MOV R9,  R8
	MOV R8,  R16
	
	//T[3]
	CLR R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	EOR R23, R27

	ADD R12,  R23
	ADC R13,  R24
	ADC R14,  R25
	ADC R15,  R26
	
	CLR R16
	LSL R12
	ROL R13
	ROL R14
	ROL R15
	ROL R16

	LSL R12
	ROL R13
	ROL R14
	ROL R15
	ROL R16

	LSL R12
	ROL R13
	ROL R14
	ROL R15
	ROL R16
	
	EOR R16, R12
	
	MOV R12, R15
	MOV R15, R14
	MOV R14, R13
	MOV R13, R16
	
	//STORE
	ST Z+, R4
	ST Z+, R5
	ST Z+, R6
	ST Z+, R7

	ST Z+, R12
	ST Z+, R13
	ST Z+, R14
	ST Z+, R15

	ST Z+, R8
	ST Z+, R9
	ST Z+, R10
	ST Z+, R11

	ST Z+, R0
	ST Z+, R1
	ST Z+, R2
	ST Z+, R3


	//ROUND 1
	//T[0]
	LDD R23, Y+6
	LDD R24, Y+7
	LDD R25, Y+4
	LDD R26, Y+5
	CLR R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	EOR R23, R27
	
	ADD R0, R23
	ADC R1, R24
	ADC R2, R25
	ADC R3, R26
	CLR R16

	LSL R0
	ROL R1
	ROL R2
	ROL R3
	ROL R16
	EOR R0, R16
	
	//T[1]
	CLR R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	EOR R23, R27

	ADD R4, R23
	ADC R5, R24
	ADC R6, R25
	ADC R7, R26
	CLR R16

	LSL R4
	ROL R5
	ROL R6
	ROL R7
	ROL R16
	
	LSL R4
	ROL R5
	ROL R6
	ROL R7
	ROL R16

	LSL R4
	ROL R5
	ROL R6
	ROL R7
	ROL R16	
	EOR R4, R16	
	
	//T[2]
	CLR R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	EOR R23, R27

	ADD R8,  R23
	ADC R9,  R24
	ADC R10, R25
	ADC R11, R26
	
	CLR R16
	LSR R11
	ROR R10
	ROR R9
	ROR R8
	ROR R16
	
	LSR R11
	ROR R10
	ROR R9
	ROR R8
	ROR R16

	EOR R16, R11
	MOV R11, R10
	MOV R10, R9
	MOV R9,  R8
	MOV R8,  R16
	
	//T[3]
	CLR R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	EOR R23, R27

	ADD R12,  R23
	ADC R13,  R24
	ADC R14,  R25
	ADC R15,  R26
	
	CLR R16
	LSL R12
	ROL R13
	ROL R14
	ROL R15
	ROL R16

	LSL R12
	ROL R13
	ROL R14
	ROL R15
	ROL R16

	LSL R12
	ROL R13
	ROL R14
	ROL R15
	ROL R16
	
	EOR R16, R12
	
	MOV R12, R15
	MOV R15, R14
	MOV R14, R13
	MOV R13, R16
	
	//STORE
	ST Z+, R4
	ST Z+, R5
	ST Z+, R6
	ST Z+, R7

	ST Z+, R12
	ST Z+, R13
	ST Z+, R14
	ST Z+, R15

	ST Z+, R8
	ST Z+, R9
	ST Z+, R10
	ST Z+, R11

	ST Z+, R0
	ST Z+, R1
	ST Z+, R2
	ST Z+, R3

	//ROUND 2
	//T[0]
	LDD R23, Y+10
	LDD R24, Y+11
	LDD R25, Y+8
	LDD R26, Y+9
	CLR R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	EOR R23, R27
	
	ADD R0, R23
	ADC R1, R24
	ADC R2, R25
	ADC R3, R26
	CLR R16

	LSL R0
	ROL R1
	ROL R2
	ROL R3
	ROL R16
	EOR R0, R16
	
	//T[1]
	CLR R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	EOR R23, R27

	ADD R4, R23
	ADC R5, R24
	ADC R6, R25
	ADC R7, R26
	CLR R16

	LSL R4
	ROL R5
	ROL R6
	ROL R7
	ROL R16
	
	LSL R4
	ROL R5
	ROL R6
	ROL R7
	ROL R16

	LSL R4
	ROL R5
	ROL R6
	ROL R7
	ROL R16	
	EOR R4, R16	
	
	//T[2]
	CLR R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	EOR R23, R27

	ADD R8,  R23
	ADC R9,  R24
	ADC R10, R25
	ADC R11, R26
	
	CLR R16
	LSR R11
	ROR R10
	ROR R9
	ROR R8
	ROR R16
	
	LSR R11
	ROR R10
	ROR R9
	ROR R8
	ROR R16

	EOR R16, R11
	MOV R11, R10
	MOV R10, R9
	MOV R9,  R8
	MOV R8,  R16
	
	//T[3]
	CLR R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	EOR R23, R27

	ADD R12,  R23
	ADC R13,  R24
	ADC R14,  R25
	ADC R15,  R26
	
	CLR R16
	LSL R12
	ROL R13
	ROL R14
	ROL R15
	ROL R16

	LSL R12
	ROL R13
	ROL R14
	ROL R15
	ROL R16

	LSL R12
	ROL R13
	ROL R14
	ROL R15
	ROL R16
	
	EOR R16, R12
	
	MOV R12, R15
	MOV R15, R14
	MOV R14, R13
	MOV R13, R16
	
	//STORE
	ST Z+, R4
	ST Z+, R5
	ST Z+, R6
	ST Z+, R7

	ST Z+, R12
	ST Z+, R13
	ST Z+, R14
	ST Z+, R15

	ST Z+, R8
	ST Z+, R9
	ST Z+, R10
	ST Z+, R11

	ST Z+, R0
	ST Z+, R1
	ST Z+, R2
	ST Z+, R3

	//ROUND 3
	//T[0]
	LDD R23, Y+14
	LDD R24, Y+15
	LDD R25, Y+12
	LDD R26, Y+13
	CLR R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	EOR R23, R27
	
	ADD R0, R23
	ADC R1, R24
	ADC R2, R25
	ADC R3, R26
	CLR R16

	LSL R0
	ROL R1
	ROL R2
	ROL R3
	ROL R16
	EOR R0, R16
	
	//T[1]
	CLR R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	EOR R23, R27

	ADD R4, R23
	ADC R5, R24
	ADC R6, R25
	ADC R7, R26
	CLR R16

	LSL R4
	ROL R5
	ROL R6
	ROL R7
	ROL R16
	
	LSL R4
	ROL R5
	ROL R6
	ROL R7
	ROL R16

	LSL R4
	ROL R5
	ROL R6
	ROL R7
	ROL R16	
	EOR R4, R16	
	
	//T[2]
	CLR R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	EOR R23, R27

	ADD R8,  R23
	ADC R9,  R24
	ADC R10, R25
	ADC R11, R26
	
	CLR R16
	LSR R11
	ROR R10
	ROR R9
	ROR R8
	ROR R16
	
	LSR R11
	ROR R10
	ROR R9
	ROR R8
	ROR R16

	EOR R16, R11
	MOV R11, R10
	MOV R10, R9
	MOV R9,  R8
	MOV R8,  R16
	
	//T[3]
	CLR R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	EOR R23, R27

	ADD R12,  R23
	ADC R13,  R24
	ADC R14,  R25
	ADC R15,  R26
	
	CLR R16
	LSL R12
	ROL R13
	ROL R14
	ROL R15
	ROL R16

	LSL R12
	ROL R13
	ROL R14
	ROL R15
	ROL R16

	LSL R12
	ROL R13
	ROL R14
	ROL R15
	ROL R16
	
	EOR R16, R12
	
	MOV R12, R15
	MOV R15, R14
	MOV R14, R13
	MOV R13, R16
	
	//STORE
	ST Z+, R4
	ST Z+, R5
	ST Z+, R6
	ST Z+, R7

	ST Z+, R12
	ST Z+, R13
	ST Z+, R14
	ST Z+, R15

	ST Z+, R8
	ST Z+, R9
	ST Z+, R10
	ST Z+, R11

	ST Z+, R0
	ST Z+, R1
	ST Z+, R2
	ST Z+, R3

	//ROUND 4
	//T[0]
	LDD R23, Y+2
	LDD R24, Y+3
	LDD R25, Y+0
	LDD R26, Y+1

	CLR R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	EOR R23, R27

	ADD R0, R23
	ADC R1, R24
	ADC R2, R25
	ADC R3, R26
	CLR R16

	LSL R0
	ROL R1
	ROL R2
	ROL R3
	ROL R16
	EOR R0, R16
	
	//T[1]
	CLR R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	EOR R23, R27

	ADD R4, R23
	ADC R5, R24
	ADC R6, R25
	ADC R7, R26
	CLR R16

	LSL R4
	ROL R5
	ROL R6
	ROL R7
	ROL R16
	
	LSL R4
	ROL R5
	ROL R6
	ROL R7
	ROL R16

	LSL R4
	ROL R5
	ROL R6
	ROL R7
	ROL R16	
	EOR R4, R16	
	
	//T[2]
	CLR R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	EOR R23, R27

	ADD R8,  R23
	ADC R9,  R24
	ADC R10, R25
	ADC R11, R26
	
	CLR R16
	LSR R11
	ROR R10
	ROR R9
	ROR R8
	ROR R16
	
	LSR R11
	ROR R10
	ROR R9
	ROR R8
	ROR R16

	EOR R16, R11
	MOV R11, R10
	MOV R10, R9
	MOV R9,  R8
	MOV R8,  R16
	
	//T[3]
	CLR R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	EOR R23, R27

	ADD R12,  R23
	ADC R13,  R24
	ADC R14,  R25
	ADC R15,  R26
	
	CLR R16
	LSL R12
	ROL R13
	ROL R14
	ROL R15
	ROL R16

	LSL R12
	ROL R13
	ROL R14
	ROL R15
	ROL R16

	LSL R12
	ROL R13
	ROL R14
	ROL R15
	ROL R16
	
	EOR R16, R12
	
	MOV R12, R15
	MOV R15, R14
	MOV R14, R13
	MOV R13, R16
	
	//STORE
	ST Z+, R4
	ST Z+, R5
	ST Z+, R6
	ST Z+, R7

	ST Z+, R12
	ST Z+, R13
	ST Z+, R14
	ST Z+, R15

	ST Z+, R8
	ST Z+, R9
	ST Z+, R10
	ST Z+, R11

	ST Z+, R0
	ST Z+, R1
	ST Z+, R2
	ST Z+, R3

	
	//ROUND 5
	//T[0]
	LDD R23, Y+6
	LDD R24, Y+7
	LDD R25, Y+4
	LDD R26, Y+5

	CLR R27
	LSR R26
	ROR R25
	ROR R24
	ROR R23
	ROR R27
	LSR R26
	ROR R25
	ROR R24
	ROR R23
	ROR R27
	LSR R26	
	ROR R25
	ROR R24
	ROR R23
	ROR R27

	EOR R27, R26
	MOV R26, R25
	MOV R25, R24
	MOV R24, R23
	MOV R23, R27

	ADD R0, R23
	ADC R1, R24
	ADC R2, R25
	ADC R3, R26
	CLR R16

	LSL R0
	ROL R1
	ROL R2
	ROL R3
	ROL R16
	EOR R0, R16
	
	//T[1]
	CLR R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	EOR R23, R27

	ADD R4, R23
	ADC R5, R24
	ADC R6, R25
	ADC R7, R26
	CLR R16

	LSL R4
	ROL R5
	ROL R6
	ROL R7
	ROL R16
	
	LSL R4
	ROL R5
	ROL R6
	ROL R7
	ROL R16

	LSL R4
	ROL R5
	ROL R6
	ROL R7
	ROL R16	
	EOR R4, R16	
	
	//T[2]
	CLR R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	EOR R23, R27

	ADD R8,  R23
	ADC R9,  R24
	ADC R10, R25
	ADC R11, R26
	
	CLR R16
	LSR R11
	ROR R10
	ROR R9
	ROR R8
	ROR R16
	
	LSR R11
	ROR R10
	ROR R9
	ROR R8
	ROR R16

	EOR R16, R11
	MOV R11, R10
	MOV R10, R9
	MOV R9,  R8
	MOV R8,  R16
	
	//T[3]
	CLR R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	EOR R23, R27

	ADD R12,  R23
	ADC R13,  R24
	ADC R14,  R25
	ADC R15,  R26
	
	CLR R16
	LSL R12
	ROL R13
	ROL R14
	ROL R15
	ROL R16

	LSL R12
	ROL R13
	ROL R14
	ROL R15
	ROL R16

	LSL R12
	ROL R13
	ROL R14
	ROL R15
	ROL R16
	
	EOR R16, R12
	
	MOV R12, R15
	MOV R15, R14
	MOV R14, R13
	MOV R13, R16
	
	//STORE
	ST Z+, R4
	ST Z+, R5
	ST Z+, R6
	ST Z+, R7

	ST Z+, R12
	ST Z+, R13
	ST Z+, R14
	ST Z+, R15

	ST Z+, R8
	ST Z+, R9
	ST Z+, R10
	ST Z+, R11

	ST Z+, R0
	ST Z+, R1
	ST Z+, R2
	ST Z+, R3

	//ROUND 6
	//T[0]
	LDD R23, Y+10
	LDD R24, Y+11
	LDD R25, Y+8
	LDD R26, Y+9

	CLR R27	
	LSR R26
	ROR R25
	ROR R24
	ROR R23
	ROR R27
	LSR R26	
	ROR R25
	ROR R24
	ROR R23
	ROR R27

	EOR R27, R26
	MOV R26, R25
	MOV R25, R24
	MOV R24, R23
	MOV R23, R27

	ADD R0, R23
	ADC R1, R24
	ADC R2, R25
	ADC R3, R26
	CLR R16

	LSL R0
	ROL R1
	ROL R2
	ROL R3
	ROL R16
	EOR R0, R16
	
	//T[1]
	CLR R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	EOR R23, R27

	ADD R4, R23
	ADC R5, R24
	ADC R6, R25
	ADC R7, R26
	CLR R16

	LSL R4
	ROL R5
	ROL R6
	ROL R7
	ROL R16
	
	LSL R4
	ROL R5
	ROL R6
	ROL R7
	ROL R16

	LSL R4
	ROL R5
	ROL R6
	ROL R7
	ROL R16	
	EOR R4, R16	
	
	//T[2]
	CLR R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	EOR R23, R27

	ADD R8,  R23
	ADC R9,  R24
	ADC R10, R25
	ADC R11, R26
	
	CLR R16
	LSR R11
	ROR R10
	ROR R9
	ROR R8
	ROR R16
	
	LSR R11
	ROR R10
	ROR R9
	ROR R8
	ROR R16

	EOR R16, R11
	MOV R11, R10
	MOV R10, R9
	MOV R9,  R8
	MOV R8,  R16
	
	//T[3]
	CLR R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	EOR R23, R27

	ADD R12,  R23
	ADC R13,  R24
	ADC R14,  R25
	ADC R15,  R26
	
	CLR R16
	LSL R12
	ROL R13
	ROL R14
	ROL R15
	ROL R16

	LSL R12
	ROL R13
	ROL R14
	ROL R15
	ROL R16

	LSL R12
	ROL R13
	ROL R14
	ROL R15
	ROL R16
	
	EOR R16, R12
	
	MOV R12, R15
	MOV R15, R14
	MOV R14, R13
	MOV R13, R16
	
	//STORE
	ST Z+, R4
	ST Z+, R5
	ST Z+, R6
	ST Z+, R7

	ST Z+, R12
	ST Z+, R13
	ST Z+, R14
	ST Z+, R15

	ST Z+, R8
	ST Z+, R9
	ST Z+, R10
	ST Z+, R11

	ST Z+, R0
	ST Z+, R1
	ST Z+, R2
	ST Z+, R3


	//ROUND 7
	//T[0]
	LDD R23, Y+14
	LDD R24, Y+15
	LDD R25, Y+12
	LDD R26, Y+13

	CLR R27		
	LSR R26	
	ROR R25
	ROR R24
	ROR R23
	ROR R27

	EOR R27, R26
	MOV R26, R25
	MOV R25, R24
	MOV R24, R23
	MOV R23, R27

	ADD R0, R23
	ADC R1, R24
	ADC R2, R25
	ADC R3, R26
	CLR R16

	LSL R0
	ROL R1
	ROL R2
	ROL R3
	ROL R16
	EOR R0, R16
	
	//T[1]
	CLR R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	EOR R23, R27

	ADD R4, R23
	ADC R5, R24
	ADC R6, R25
	ADC R7, R26
	CLR R16

	LSL R4
	ROL R5
	ROL R6
	ROL R7
	ROL R16
	
	LSL R4
	ROL R5
	ROL R6
	ROL R7
	ROL R16

	LSL R4
	ROL R5
	ROL R6
	ROL R7
	ROL R16	
	EOR R4, R16	
	
	//T[2]
	CLR R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	EOR R23, R27

	ADD R8,  R23
	ADC R9,  R24
	ADC R10, R25
	ADC R11, R26
	
	CLR R16
	LSR R11
	ROR R10
	ROR R9
	ROR R8
	ROR R16
	
	LSR R11
	ROR R10
	ROR R9
	ROR R8
	ROR R16

	EOR R16, R11
	MOV R11, R10
	MOV R10, R9
	MOV R9,  R8
	MOV R8,  R16
	
	//T[3]
	CLR R27
	LSL R23
	ROL R24
	ROL R25
	ROL R26
	ROL R27
	EOR R23, R27

	ADD R12,  R23
	ADC R13,  R24
	ADC R14,  R25
	ADC R15,  R26
	
	CLR R16
	LSL R12
	ROL R13
	ROL R14
	ROL R15
	ROL R16

	LSL R12
	ROL R13
	ROL R14
	ROL R15
	ROL R16

	LSL R12
	ROL R13
	ROL R14
	ROL R15
	ROL R16
	
	EOR R16, R12
	
	MOV R12, R15
	MOV R15, R14
	MOV R14, R13
	MOV R13, R16
	
	//STORE
	ST Z+, R4
	ST Z+, R5
	ST Z+, R6
	ST Z+, R7

	ST Z+, R12
	ST Z+, R13
	ST Z+, R14
	ST Z+, R15

	ST Z+, R8
	ST Z+, R9
	ST Z+, R10
	ST Z+, R11

	ST Z+, R0
	ST Z+, R1
	ST Z+, R2
	ST Z+, R3

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