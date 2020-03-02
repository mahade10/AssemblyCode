INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H
.DATA
STR DB 80 DUP(?)
 N DB ?
.CODE
MOV AX,@DATA
MOV DS,AX
MAIN PROC
    MOV SI,100
    MOV AH,1
    FOR:
        INT 21H
        CMP AL,0DH
        JZ END_FOR
        
        IF:
            CMP AL,65
            JL ELSEIF
            CMP AL,90
            JG ELSEIF
            ADD AL,32
            JMP ELSE
            
         ELSEIF:
                CMP AL,97
                JL ELSE
                CMP AL,122
                JG ELSE
                SUB AL,32
                JMP ELSE
                
                
         ELSE:
                       
        
             MOV STR[SI],AL
             INC SI
             INC N
            JMP FOR
        
        END_FOR:
        mov ah,2
        MOV DL,0AH
        INT 21H
        MOV DL,0DH
        INT 21H
         
        MOV SI,100
        DEC N 
        PRINT 'RESULT : '
       ANS:
        
        
        MOV DL,STR[SI]
        
        MOV AH,2
        INT 21H
        CMP N,0
        JZ END
        INC SI
        DEC N
        JMP ANS
        
        END:
        MOV AH,4CH
        INT 21H
        MAIN ENDP
END MAIN
        