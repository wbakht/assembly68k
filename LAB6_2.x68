*-----------------------------------------------------------
* Title      : STRING COMPARISONS
* Written by : WAQAS BAKHT
* Date       : OCTOBER,23,2018
* Description: CHECKS TWO STRINGS TO SEE IF THEY ARE THE SAME
*-----------------------------------------------------------
            ORG         $8000
START       MOVEA.L     #P1,A0          
            MOVEA.L     #P2,A1
            MOVE.B      #$FF,D0
        

    
LOOP        CMP.B       (A1)+,(A0)+
            BEQ         WHILE  
            
            MOVE.B      #$00,D0
            BRA         FALSE

WHILE       CMPI.B      #$0D,(A0)
            BEQ         TRUE
            CMPI.B      #$FF,D0
            BNE         FALSE
            
            BRA         LOOP
            
TRUE        MOVE        #14,D0        
            LEA         M1,A1
            TRAP        #15
            BRA         EXIT
            
FALSE       MOVE.B      #14,D0
            LEA         M2,A1
            TRAP        #15 
        

EXIT        TRAP        #14

            ORG         $9000
P1          DC.B        'FREEDUM',$0D
            ORG         $9020

P2          DC.B        'FREEDUMB',$0D

M1          DC.B        'MATCH',0
M2          DC.B        'NOMATCH',0
            END         START


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
