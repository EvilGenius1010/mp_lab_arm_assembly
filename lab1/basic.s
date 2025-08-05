        AREA    PROGRAM1, CODE, READONLY
        EXPORT  __main          ; Make 'main' visible to the linker as entry point

__main
        MOV     R1, #0x00000012     ; R1 = 18
        MOV     R2, #0x00000005     ; R2 = 5
        ADD     R3, R1, R2
        END
