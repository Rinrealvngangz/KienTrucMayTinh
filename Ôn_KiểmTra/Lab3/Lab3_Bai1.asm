.MODEL SMALL
.STACK
.DATA

Msg1 db 13,10, 'Bay gio la (S)ang,(C)hieu,(T)oi (S/C/T)?$'
Msg2 DB 13,10, 'Chao buoi sang$'
Msg3 DB 13,10, 'Chao buoi chieu$' 
Msg4 DB 13,10, 'Chao buoi Toi$'
Msg5 DB 13,10, 'Xin moi nhap lai$'

KyTu db ?


.CODE

Mov AX,@DATA

MOV DS,AX

Printloop:  

;hien thong bao 
Mov ah,9
lea dx,Msg1
int 21h

;nhap 1 ky tu  
mov ah,1
int 21h
Mov KyTu,al

;so sanh dieu kien
CMP al,'S'
JE chaobuoisang   
CMP al,'s'
JE chaobuoisang 

 
CMP al, 'C'
JE chaobuoichieu
CMP al, 'c'
JE chaobuoichieu

CMP al, 'T'
JE chaobuoitoi
CMP al, 't'
JE chaobuoitoi 

;Lap
Loop Printloop   


;Chuongtrinh
  
   
 chaobuoisang:
 lea dx,Msg2
 Jmp Greeting 
 
 chaobuoichieu:
 lea dx,Msg3
 Jmp Greeting  
 
 
 chaobuoitoi:
 lea dx,Msg4
  
  
 Greeting:
 
 mov ah,9
 int 21h
 
 end     
 
