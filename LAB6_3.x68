*-----------------------------------------------------------
* Title      : MATRIX TRANSPOSE
* Written by : WAQAS BAKHT
* Date       : OCTOBER 23, 2018
* Description: PRETTY CLEAR ALREADY
*-----------------------------------------------------------
            ORG         $8000
START       BSR         PRINTI

            MOVE.L      #0,D0           *I           
            MOVEA.L     #MATRIX,A0
    
    
L1          CMPI.L      #2,D0
            BGT         PRINTH
            
            MOVE.L      D0,D1           *J
            ADD         #1,D1
            
L2          CMPI.L      #3,D1
           
            BGT         ADDTI
           
            MOVE.W      #4,D2
            MOVE.W      #4,D3
            
            MULU.W      D0,D2
            ADD.W       D1,D2

            
            MULU.W      D1,D3
            ADD.W       D0,D3            

            MOVE.B      (A0,D2.W),D4
            MOVE.B      (A0,D3.W),(A0,D2.W)
            MOVE.B      D4,(A0,D3.W)


            ADD         #1,D1
            BRA         L2

ADDTI       ADD         #1,D0

            BRA         L1

PRINTH      BSR         PRINTI

EXIT        TRAP        #14
            

PRINTI      MOVEA.L     #MATRIX,A0
NEXT        MOVE.B      (A0)+,D1       

PRINT       MOVE        #14,D0
            LEA         SPACE,A1
            TRAP        #15
        
            CMPI.B      #10,(A0)
            BGT         SKIP                 
        
EXSPC       MOVE        #14,D0
            LEA         SPACE,A1
            TRAP        #15
        
SKIP        MOVE        #3,D0
            TRAP        #15

            MOVE.W      A0,D6
            DIVU        #4,D6
        
            CLR.W       D6        
            CMP.L       #$00000000,D6
            BNE         CMPR
            BSR         NEWL   
        
CMPR        CMPA.L      #$00009010,A0

            BNE         NEXT  
            
            RTS

NEWL        MOVEM.L     D0/A1,-(A7)
       
            MOVE        #14,D0
            LEA         CRLF,A1
            TRAP        #15
            MOVEM.L     (A7)+,D0/A1         
            RTS

            ORG         $9000
MATRIX      DC.B        1,2,3,4
            DC.B        5,6,7,8
            DC.B        9,10,11,12
            DC.B        13,14,15,16
SPACE       DC.B        ' ',0
CRLF        DC.B        $d,$a,0 
            END         START        


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
