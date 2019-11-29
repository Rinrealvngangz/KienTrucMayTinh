.MODEL SMALL
.STACK
.DATA
    Mgs1 DB 13,10,"HAY NHAP MOT CHU THUONG (a-z)$"
    Mgs2 DB 13,10,"CHU HOA TUONG UNG LA: $"
    kytu DB ?
.CODE
    MOV AX,@DATA
    MOV DS,AX
    
  KIEMTRA:
    MOV AH,9
    LEA DX,Mgs1
    INT 21H
    
    MOV AH,8
    INT 21H
    CMP AL,'a'
    JL KIEMTRA
    CMP AL,'z'
    JG KIEMTRA   
    SUB AL,20
    MOV KYTU,AL
    
    MOV AH,9
    LEA DX,Mgs2
    INT 21H
       
    MOV AH,2
    MOV DL,KYTU
    INT 21H
    
    MOV AH,4CH
    INT 21H
END