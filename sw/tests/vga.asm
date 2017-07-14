#include defs.asm

;start section (initialize system)
.ORG 0x00000000
start:
    OR R0 R0 R0
    MVIL SP 0x07FF   ;place a top of RAM into SP
    BZ R0 main

;main program
main:
    MVIL R2 0x1000

    MVIL R1 0x0048
    STI R1 R2

    MVIL R1 0x0065
    INC R2 R2
    STI R1 R2

    MVIL R1 0x006c
    INC R2 R2
    STI R1 R2

    MVIL R1 0x006c
    INC R2 R2
    STI R1 R2

    MVIL R1 0x006f
    INC R2 R2
    STI R1 R2

    MVIL R1 0x0021
    INC R2 R2
    STI R1 R2

loop:
    BZ R0 loop
