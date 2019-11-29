.MODEL SMALL
.STACK
.DATA

Msg1 db 13,10,'Nhap 1 ky tu bat ky: $'
Msg2 db 13,10,'5 Ky tu dung truoc la: $' 
Msg3 db 13,10,'5 Ky tu dung sau la: $' 
space db 13,10,'$'
kytu db ?



.CODE
Mov ax,@DATA
mov ds,ax 

;in thong bao
Mov ah,9
lea dx,Msg1 
int 21h


;nhap 1 ky tu 

Mov ah,1 
int 21h
Mov kytu,al 
sub kytu,6h

Mov ah,9
lea dx,Msg2 
int 21h
;dieu kien break
mov cx,5


printLoop1: 
Mov ah,2
inc kytu 
Mov dl,kytu
int 21h
dec cx
 

 
jnz printLoop1  ;nhay neu cx khac 0  ;neu=0 thi break


Mov ah,9
lea dx,Msg3 
int 21h
add kytu,1h


mov bx,5
printLoop2: 
Mov ah,2
inc kytu 
Mov dl,kytu
int 21h
dec bx
 

 
jnz printLoop2  ;nhay neu cx khac 0  ;neu=0 thi break





greeting:
 mov ah,9
 int 21h  
 
 End