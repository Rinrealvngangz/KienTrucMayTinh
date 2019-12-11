.model small
.stack 100h
.data
  msg1 db 13,10,'Ngay:$'
  msg2 db 13,10,'Thang:$'
  msg3 db 13,10,'Nam:$'
  msg4 db 13,10,'gio:$'
  msg5 db 13,10,'phut:$'
  msg6 db 13,10,'giay:$'
  msg7 db 13,10,'chieu dai:$'
  msg8 db 13,10,'chieu rong:$'
  res1 db 13,10,'chu vi:$'
  gio db ?
  phut db ?
  giay db ?
  ngay db ?
  thang db ?
  nam dw ?
  dai dw ?
  rong dw ?
  
.code
  mov ax,@data
  mov ds,ax 
  
  nhap_dai:
  
   mov ah,9
   lea dx,msg7
   int 21h  
    
   call Nhap_Thap_Phan 
   
   cmp dx,0
   je nhap_dai 
   mov dai,bx 
  
   nhap_rong:
  
   mov ah,9
   lea dx,msg8
   int 21h  
    
   call Nhap_Thap_Phan 
   
   cmp dx,0
   je nhap_rong 
   mov rong,bx  
   
    mov ah,9
   lea dx,res1
   int 21h
   mov dai,bx
   mov rong,cx  
   call  Tinh_chu_vi 
    
   call Xuat_Thap_Phan 
   
   
   
   mov ah,2Ah
   int 21h
   
   mov ngay,dl
   mov thang,dh
   mov nam,cx
   
   
   mov ah,2ch
   int 21h
   mov gio,ch
   mov phut,cl
   mov giay,dh
    mov ah,9
   lea dx,msg1
    int 21h
   
   mov al,ngay
   xor ah,ah
   
   call Xuat_Thap_Phan
   
   
   
    mov ah,9
   lea dx,msg2
    int 21h
   
   mov al,thang
   xor ah,ah
   
   call Xuat_Thap_Phan
   
    mov ah,9
   lea dx,msg3
    int 21h
   
   mov ax,nam
  
   call Xuat_Thap_Phan
   
    mov ah,9
   lea dx,msg4
    int 21h
   
   mov al ,gio
   xor ah,ah
   
   call Xuat_Thap_Phan
   
    mov ah,9
   lea dx,msg5
    int 21h
   
   mov al ,phut
   xor ah,ah
   
   call Xuat_Thap_Phan
   
    mov ah,9
   lea dx,msg6
    int 21h
   
   mov al ,giay
   xor ah,ah
   
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