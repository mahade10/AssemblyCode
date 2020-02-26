.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC
    MOV CX,4 
    MOV AX,0
    XOR DX,DX
    TOP:
       ADD DX,AX
       INC AX
       LOOP TOP
       
     
       ADD DX,48
       MOV AH,2
       INT 21H
       MOV AH,4CH
       INT 21H
       MAIN ENDP
END MAIN