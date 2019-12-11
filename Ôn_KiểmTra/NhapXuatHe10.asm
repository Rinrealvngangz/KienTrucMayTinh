.model small
.stack 100h
.data
  msg1 db 13,10,'Nhap so thap phan:$'
  msg2 db 13,10,'so thap phan sau khi nhap la:$'

.code

  mov ax,@data
  mov ds,ax 
  
 nhap_10:  
         mov ah,9
         lea dx,msg1
         int 21h
         call Nhap_Thap_Phan 
         cmp dx,0
        je nhap_10
          
       mov ah,9
       lea dx,msg2
       int 21h
       mov ax,bx   
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
           

end
  