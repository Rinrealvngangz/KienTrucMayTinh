.MODEL SMALL
.STACK
.DATA 

Msg1 db 13,10, 'Nhap 1 phim bat ky: $'
Msg2 db 13,10,'Ky tu da nhap la chu$'
Msg3 db 13,10, 'Ky tu da nhap la so$'
Msg4 db 13,10, 'Ky tu da nhap khac chu/so$'

Kytu db ?    


.CODE

Mov ax,@DATA 
Mov ds,ax 

;thong bao nhap
Mov ah,9
lea dx,Msg1
int 21h
;nhap 1 ky tu
Mov ah,1
int 21h
Mov Kytu,al 
;kiem tra so
Cmp al,'0'
Jb kytukhac
Cmp al,'9'
Jbe kytuso


;kiem tra chu HOA

Cmp al,'A'
Jb kytukhac
Cmp al,'Z'
jbe kytuchu

;kiem tra chu thuong

Cmp al,'a'
Jb kytukhac
Cmp al,'z'
Jbe kytuchu

jmp kytukhac


;ham chuc nang 

;ham in so 
kytuso:
mov ah,9
lea dx,Msg3
jmp greeting
 
;ham in chu
kytuchu:
mov ah,9
lea dx,Msg2
jmp greeting


;ham in ky tu khac so/chu
kytukhac:
mov ah,9
lea dx,Msg4

greeting:
   Mov ah,9
   int 21h
             
End             