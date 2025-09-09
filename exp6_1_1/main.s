IO0DIR EQU 0XE0028008
IO0SET EQU 0XE0028004
IO0CLR EQU 0XE002800C
	
	AREA CHANG,CODE,READONLY
		EXPORT __main
__main
	ENTRY
		LDR r1,=IO0DIR
		LDR r0,=0xF0FF0000
		STR R0,[R1]
		LDR r2, =IO0SET
		LDR r3,=IO0CLR
S		STR R0, [R3]
		LDR R1,=0X803F0000; To display 0 on rightmost segment
		STR R1, [R2]
		BL DELAY
		STR R0, [R3]
		LDR R1,=0X40060000; To display 1 on third segment
		STR R1, [R2]
		BL DELAY
		STR R0, [R3]
		LDR R1,=0X205B0000; To display 2 on second segment
		STR R1, [R2]
		BL DELAY
		STR R0, [R3]
		LDR R1,=0X104F0000; To display 3 on leftmost segment
		STR R1, [R2]
		BL DELAY
		B S
DELAY
		LDR r5, =0x2FF; Delay program to retain the bit for some time. SUBS r5, r5, #1
delay 	SUBS R5,R5,#1
		BNE delay
		BX LR
		
		END