INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC
    MOV AH,1
    INT 21H
    MOV AH,0
    
    MOV DL,2
    DIV DL
    CMP AH,0
    JNE ODD
    
    EVEN:
        PRINTN
        PRINT 'EVEN NUMBER'
         MOV AH,4CH
         INT 21H 
    ODD:
        PRINTN
        PRINT 'ODD NUMBER'
        
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN
    
    