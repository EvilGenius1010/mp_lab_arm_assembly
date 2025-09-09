        AREA ADDITION, CODE, READONLY
        ENTRY
START
        MOV     R0, #0
        LDR     R1, VALUE1
        LDR     R3, MASK
        AND     R1, R1, R3
        ADD     R0, R1, R3
        LDR     R2, VALUE2
        AND     R2, R2, R3
        ADD     R0, R0, R2
        LDR     R4, =RESULT
        STR     R0, [R4]
here    B       here

MASK    DCD     0x0000FFFF
VALUE1  DCW     0xAAAA
        ALIGN
VALUE2  DCW     0x2222

        AREA DATA2, DATA, READWRITE
RESULT  DCD     0x0, 0x0

        END
