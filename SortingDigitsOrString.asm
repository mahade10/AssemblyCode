INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H
.DATA
STR DB 90 DUP(?)
.CODE
MOV AX,@DATA
MOV DS,AX
MAIN PROC
    MOV SI,0
    MOV CX,0
    
    MOV AH,1
   
    FOR:
         INT 21H
         CMP AL,0DH
         JZ END
         
         MOV STR[SI],AL
         INC SI
         INC CX
         JMP FOR
         
     END:
        DEC SI
        MOV DI,SI
        
        LOOP1:
            DEC DI
            MOV BL,STR[SI]
            CMP BL,STR[DI]
            JG SKIP
            XCHG BL,STR[DI]
            MOV STR[SI],BL
            
        SKIP:
            CMP DI,0
            JNE LOOP1
            
         CMP SI,1
         JG END
         
         PRINT 'SORTED NUMBERS: '
        mov ah,2
        MOV DL,0AH
        INT 21H
        MOV DL,0DH
        INT 21H  
        
        MOV DI,0
        MOV AH,2
        NEXT:
            MOV DL,STR[DI]
            INT 21H
            INC DI
            CMP DI,CX
            JL NEXT
            
            MOV AH,4CH
            INT 21H 
            MAIN ENDP
END MAIN