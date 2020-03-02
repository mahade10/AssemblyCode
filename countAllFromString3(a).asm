INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H
.DATA

VL DB 0
CNS DB 0
SPACE DB 0
DIGITS DB 0
OTHERS DB 0
.CODE
MOV AX,@DATA
MOV DS,AX
MAIN PROC 
    
    MOV VL,0
    MOV CNS,0
    MOV DIGITS,0
    MOV SPACE,0
    MOV OTHERS,0
  
    MOV AH,1
    FOR:
        INT 21H
        CMP AL,0DH
        JZ END_FOR 
       
       IF:
           CMP AL,65
           JL ELSEIF2
           
           CMP AL,122
           JG ELSEIF2
           
           
       ELSEIF:
         
            
            CMP AL,'A'
            JZ VOWEL
            CMP AL,'E'
            JZ VOWEL
            CMP AL,'I'
            JZ VOWEL
            CMP AL,'O'
            JZ VOWEL
            CMP AL,'U'
            JZ VOWEL
            
            CMP AL,'a'
            JZ VOWEL
            CMP AL,'e'
            JZ VOWEL
            CMP AL,'i'
            JZ VOWEL
            CMP AL,'o'
            JZ VOWEL
            CMP AL,'u'
            JZ VOWEL
             
            CMP AL,97
            JG CONS2 
            
         CONS1:
               CMP AL,90
               JG ELSEIF2 
            
         CONS2:
         
             INC CNS
            JMP FOR
            
       VOWEL:
            INC VL
            JMP FOR     
             
       ELSEIF2:
               CMP AL,' '
               JZ SPC 
               CMP AL,48
               JL ELSE
               CMP AL,56
               JG ELSE
               INC DIGITS
               JMP FOR
        
        ELSE:
              INC OTHERS
              JMP FOR
                     
        SPC:
            INC SPACE
            JMP FOR
            
        END_FOR:
                MOV AH,2
                MOV DL,0AH
                INT 21H
                MOV DL,0DH
                INT 21H
                
        RESULT:
               MOV AH,2
               PRINT 'NUMBER  OF VOWELS: '
               ADD VL,48
               MOV DL,VL
               INT 21H
                
                MOV DL,0AH
                INT 21H
                MOV DL,0DH
                INT 21H 
                
                PRINT 'NUMBER  OF CONSONANTS: '
                ADD CNS,48
               MOV DL,CNS
               INT 21H
               
                MOV DL,0AH
                INT 21H
                MOV DL,0DH
                INT 21H
                
                
                PRINT 'NUMBER  OF DIGITS: '
               ADD DIGITS,48
               MOV DL,DIGITS
               INT 21H
               
                MOV DL,0AH
                INT 21H
                MOV DL,0DH
                INT 21H
                
                
               PRINT 'NUMBER  OF OTHERS: '
               ADD OTHERS,48
               MOV DL,OTHERS
               INT 21H
               
                MOV DL,0AH
                INT 21H
                MOV DL,0DH
                INT 21H
                
                PRINT 'NUMBER  OF SPACES: '
                ADD SPACE,48
               MOV DL,SPACE
               INT 21H            
        END:
        MOV AH,4CH
        INT 21H
        MAIN ENDP
END MAIN
        
