INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H
.DATA
STR DB 80 DUP(?)

.CODE
MOV AX,@DATA
MOV DS,AX
MAIN PROC
    MOV SI,0
    MOV AH,1
    FOR:
        INT 21H
        CMP AL,0DH
        JZ END_FOR 
        
        MOV STR[SI],AL
        INC SI
        JMP FOR
        
        END_FOR:
        mov ah,2
        MOV DL,0AH
        INT 21H
        MOV DL,0DH
        INT 21H
         
        DEC SI
        PRINT 'RESULT : '
       ANS:
        
        
        MOV DL,STR[SI]
        
        MOV AH,2
        INT 21H
        CMP SI,0
        JZ END
        DEC SI
        JMP ANS
        
        END:
        MOV AH,4CH
        INT 21H
        MAIN ENDP
END MAIN
        