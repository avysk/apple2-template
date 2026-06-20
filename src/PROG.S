        ORG     $2000
        DSK     ../build/PROG
        TYP     BIN

        USE     ../monitor/MONITOR.S

EXIT    EQU     $03D0   ; Apple II ROM EXIT

START   LDA     #$8D
        JSR     COUT

        LDX     #0
]LOOP   LDA     MSG,X
        BEQ     DONE
        JSR     COUT
        INX
        BNE     ]LOOP

DONE    JMP     EXIT

MSG     ASC     "HELLO WORLD!"
        HEX     8D
        HEX     00

        END
