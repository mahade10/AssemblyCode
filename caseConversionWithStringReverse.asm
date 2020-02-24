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
      
    NEXT:
         INT 21H
         CMP AL,0DH
         JZ EXIT 
         
         MOV STR[SI],AL
         CMP STR[SI,'z'
         JG IGNORE
         
         CMP STR[SI],'A'
         JL IGNORE
         
         CMP STR[SI],90
         JG IGNORE
         
         CMP STR[SI],96
         JG LESS 
         
         ADD STR[SI],64
         
         LESS:
             SUB STR[SI],32
             
         IGNORE:
               INC SI
               JMP NEXT
               
    EXIT:
        DEC SI
        MOV AH,2
        MOV DL,0AH
        INT 21H
        MOV DL,0DH
        INT 21H
        
        
    OUTPUT:
          MOV DL,STR[SI] 
          int 21h 
          DEC SI
          CMP SI,-1
          JZ SESH
          
           JMP OUTPUT
           
    SESH:
        MOV AH,4CH
        INT 21H
        
    MAIN ENDP
END MAIN
               
        
                       
             
            
         
         
