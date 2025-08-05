	AREA ASCENDING, CODE, READONLY    ; Define memory area
ENTRY                             ; Entry point of the program
	MOV R8, #4                        ; Set R8 = 4 (Array size)
	LDR R2, CVALUE                    ; Load address of code region into R2
	LDR R3, DVALUE                    ; Load address of data region into R3
	LOOP0 LDR R1, [R2], #4            ; Load value from code region (post-increment by 4)
	STR R1, [R3], #4                  ; Store value into data region (post-increment by 4)
	SUBS R8, R8, #1                   ; Decrement counter R8
	CMP R8, #0                        ; Compare R8 with 0
	BNE LOOP0                         ; If not zero, loop again
	
	START1 MOV R5, #3                 ; Set R5 = 3 (loop index, N - 1)
	MOV R7, #0                        ; Reset exchange flag
LOOP LDR R1, DVALUE              ; Load base address of data region
	ADD R1, R1, R5, LSL #2            ; Calculate address of R5-th element (word-aligned)
	LDR R3, [R1]                      ; Load second number
	LDR R2, [R1, #-4]                 ; Load first number
	CMP R2, R3                        ; Compare first and second
	BLT LOOP2                         ; If R2 < R3, no exchange needed
	STR R2, [R1], #-4                 ; Exchange: Move R2 to earlier slot
	STR R3, [R1]                      ; Move R3 to later slot
	MOV R7, #1                        ; Set flag: exchange happened
LOOP SUBS R5, R5, #1             ; Decrement loop index
	CMP R5, #0                        ; Compare with 0
	BNE LOOP1                         ; Loop again if not done
	CMP R7, #0                        ; Was any exchange made?
	BNE START1                        ; If yes, start another pass
s	B s

CVALUE DCD 0X44444444
	   DCD 0X11111111
	   DCD 0X33333333
	   DCD 0X22222222
		
	AREA DATA1,DATA,READWRITE
DVALUE DCD 0X00000000
	END
