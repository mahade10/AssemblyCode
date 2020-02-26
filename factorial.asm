.MODEL SMALL
.STACK 100H
.DATA 
 n DB ?
 FACT DB ?
.CODE
MAIN PROC
    
    MOV AH,1
    INT 21H
    
    SUB AL,30H
    MOV BL,AL
    CMP AL,0
    JZ ZERO
    
     NOT_ZERO:
        
        MOV n,AL
        DEC n
        FOR:
            CMP n,0 
            mov BL,AL
            JE ENDFOR
            MUL n
            DEC n
            JMP FOR
    
    
    ZERO:
         MOV AH,2
        MOV DL,0AH
        INT 21H
        MOV DL,0DH
        INT 21H
      
        MOV DL,1
        ADD DL,30H
        MOV AH,2
        INT 21H 
        
        MOV AH,4CH
        INT 21H
        
    ENDFOR:
             MOV AH,2
             MOV DL,0AH
             INT 21H
             MOV DL,0DH
             INT 21H 
            
            XOR DL,DL
         
            MOV DL,BL
            ADD DL,30H
            MOV AH,2
           
            INT 21H 
        
            MOV AH,4CH
            INT 21H    
        
       MAIN ENDP
END MAIN