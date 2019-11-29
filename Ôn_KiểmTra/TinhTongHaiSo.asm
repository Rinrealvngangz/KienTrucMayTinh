.MODEL SMALL
.STACK
.DATA
      Msg1 DB 10,13, 'Nhap so thu nhat:$'
      Msg2 DB 10,13, 'Nhap so thu hai:$'
      Msg3 DB 10,13, 'Tong hai so la:$'
      
      So1 DB ?
      So2 DB ?
      Tong DB ?
       
.CODE
     Mov ax,@Data
     Mov ds,ax
     
nhapsothu1:
     ;xuat thong 1 bao ra man hinh
     Mov ah,9h
     lea dx,msg1
     int 21h
     ;nhap 1 ki tu tu ban phim
     Mov ah,1h
     int 21h 
     
     ;kiem tra nho hon ki tu '0'
     Cmp al,'0'
     Jb nhapsothu1  
     ;kiem tra lon hon  ki tu '9'
      Cmp al,'9'
      Ja nhapsothu1
     Sub al,30h
     Mov So1,al
     
nhapsothu2:     
      ;xuat thong 2 bao ra man hinh
      Mov ah,9h
     lea dx,msg2
     int 21h
     ;nhap 1 ki tu tu ban phim
     Mov ah,1h
     int 21h
     
      ;kiem tra neu nho hon ki tu '0'
     Cmp al,'0'
     Jb nhapsothu2  
     ;kiem tra neu lon hon  ki tu '9'
      Cmp al,'9'
      Ja nhapsothu2 
      
     Sub al,30h
     Mov So2,al  
     ;xuat thong 2 bao ra man hinh
      Mov ah,9h
     lea dx,msg3
     int 21h   
     
     Mov al,So1
     Mov bl,So2
     Add al,bl 
     Add al,30h
    
    Mov Tong,al
    Mov ah,2h
    Mov dl,Tong  
    Int 21h
    
    
    Mov ah, 4ch;
    int 21h
END
