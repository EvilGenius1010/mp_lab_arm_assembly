		AREA PROGRAM, CODE, READONLY
		ENTRY
			MOV R1,#0xffffffff ;0x means hexadecimal
			MOV R0,#8_257 ;8_also means hexadecimal
			MOV R2,#82 ;if nothing specified, then number is decimal
			MOV R3,#2_1011101 ;2_means binary
			MOV R4,R1
			MOV R5,R2
			END