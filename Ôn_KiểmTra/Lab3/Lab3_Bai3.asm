.MODEL SMALL
.STACK
.DATA

Msg1 db 13,10,'Cac ky tu HOA trong bang ma ASC $'
Msg2 db 13,10,'Ky tu sau khi xuat la: $'


kytu db ?



.CODE
Mov ax,@DATA
mov ds,ax 

;in thong bao 1
Mov ah,9
lea dx,Msg1 
int 21h
;in thong bao 2
mov ah,9
lea dx,Msg2 
int 21h
MOV AH, 2 ;in 1 ky tu        
            
MOV DL, 'A' ;Ky tu dau tien       


;Ham hien thi ky tu 
 
PrintLoop:      ;Vong lap PrintLoop: 
INT 21h     
INC DL

cmp DL,'Z'
jg greeting
 
 LOOP PrintLoop 
 
greeting:
 mov ah,9
 int 21h  
 
 end