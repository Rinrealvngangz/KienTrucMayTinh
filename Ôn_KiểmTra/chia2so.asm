.model small
.stack 100h
.data
 
  msg7 db 13,10,'num 1:$'
  msg8 db 13,10,'num 2:$'
  res1 db 13,10,'ket qua:$'
  num1 dw ?
  num2 dw ?
  
.code
  mov ax,@data
  mov ds,ax 
  
  nhap_num1:
  
   mov ah,9
   lea dx,msg7
   int 21h   
   call Nhap_Thap_Phan 
   
   cmp dx,0
   je nhap_num1 
   mov num1,bx 
  
   nhap_num2:
  
   mov ah,9
   lea dx,msg8
   int 21h  
   call Nhap_Thap_Phan 
   
   cmp dx,0
   je nhap_num2 
   mov num2,bx  
   
    mov ah,9
   lea dx,res1
   int 21h 
   xor dx,dx
   mov ax,num1
   mov bx,num2
   div bx    
   call Xuat_Thap_Phan 
   
     mov ah,4ch
      int 21h
     
     
     ;ham thu tuc
     
     ;nhap thap phan
   Nhap_Thap_Phan proc
      push ax
      push cx
      push si
      
      xor bx,bx
      
      input:
         mov ah,1
         int 21h
         
         cmp al,0Dh
         je break
         
         cmp al,'0'
         jb xuly_loi
           
         cmp al,'9'
         ja xuly_loi
         
         and al,0Fh
         mov cl,al
         xor ch,ch
         
         mov ax,bx
         mov si,10
         mul si
         mov bx,ax
         add bx,cx
         
         jmp input
         
         xuly_loi:
             xor bx,bx
             mov dx,0
             jmp exit
             
        break:
           
           mov dx,1  
           
        exit:  
           
           pop si
           pop cx
           pop ax
           
       ret
         Nhap_Thap_Phan endp
          
    ;xuat thap phan
      Xuat_Thap_Phan proc
       push ax
       push bx
       push cx
       push dx
       
       mov bx,10
       xor cx,cx
       
       
       xuly_stack:
       
          xor dx,dx
          div bx
          push dx
          inc cx
          
          cmp ax,0
          ja xuly_stack
          
       print:
          pop dx
          or dx,30h
          mov ah,2
          int 21h
       loop print
       
       
       pop dx
       pop cx
       pop bx
       pop ax
       
       ret
        Xuat_Thap_Phan endp                       
           
       ;thu tuc chu vi
       
       Tinh_chu_vi proc
        
        push bx
        
         add bx,cx
         
         mov ax,2
         mul bx
         
         pop bx
         ret
         Tinh_chu_vi endp
       
       
end