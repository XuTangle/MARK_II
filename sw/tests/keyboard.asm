#include defs.asm

;start section (initialize system)
.ORG 0x00000000
start:
    OR R0 R0 R0
    MVIL SP 0x07FF   ;place a top of RAM into SP
    BZ R0 main

.ORG 0x00000034 ;KEYBOARD ISR
    CALL KEYBOARD_ISR
    RETI

;main program
.ORG 0x00000050
main:
    ;config uart0 to 1200 baud 8n1
    MVIL R1 0x02ED
    MVIH R1 0x0000
    ST R1 UCR0
    ;enable interrupt from keyboard
    MVIL R1 0x0000
    MVIH R1 0x0004
    ST R1 INTMR
    ;enable led
    MVIL R1 0x00FF
    MVIH R1 0x0000
    ST R1 DDRA
loop:
    BZ R0 loop

;service routine for keyboard
KEYBOARD_ISR:
    LD KEYBOARD R1
    ST R1 UDR0
    ST R1 PORTA
    RET

