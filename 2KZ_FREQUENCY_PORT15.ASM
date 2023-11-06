ORG 0000H
SJMP MAIN

MAIN:
    MOV TMOD, #10H   ; Set Timer 1 in Mode 1 (16-bit timer)
    MOV TL1, #01AH    ; Initial value for Timer 1 low byte
    MOV TH1, #0FFH    ; Initial value for Timer 1 high byte
    SETB P1.5        ; Set P1.5 high

LOOP:
    CALL DELAY
    CPL P1.5        ; Toggle P1.5
    SJMP LOOP

DELAY:
    SETB TR1         ; Start Timer 1
DELAY_LOOP:
    JNB TF1, DELAY_LOOP  ; Wait for Timer 1 overflow
    CLR TR1          ; Stop Timer 1
    CLR TF1          ; Clear the overflow flag
    RET

END
