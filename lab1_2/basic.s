        AREA    PROGRAM1, CODE, READONLY
		ENTRY
        MOV     R1, #0x00000012     ; R1 = 18
        MOV     R2, #0x00000005     ; R2 = 5
        ADD     R3, R1, R2
		B       .                       ; Infinite loop to prevent falling off
        END
