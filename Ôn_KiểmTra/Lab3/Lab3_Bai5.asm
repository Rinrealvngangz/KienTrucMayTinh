.MODEL SMALL
.STACK
.DATA

Msg1 db 13,10,'Nhap 1 ky tu bat ky: $'
Msg2 db 13,10,'Ky tu sau khi xuat la: $' 
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


printLoop: 
Mov ah,2
inc kytu 
Mov dl,kytu
int 21h
dec cx
 
mov ah,9
lea dx,space
int 21h 
 
jnz printLoop  ;nhay neu cx khac 0  ;neu=0 thi break

greeting:
 mov ah,9
 int 21h  
 
 End