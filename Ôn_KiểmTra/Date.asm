include 'emu8086.inc'
.model small
.data
    day db 13,10,'Ngay:',0
    thang db 13,10, 'Thang:',0      
    nam db 13,10, 'Nam:',0    
.code 
     Mov ax,@data
     Mov ds,ax
     
     Mov ah,2Ah
     int 21h
     mov bh,dh
     mov bl,dl
     
     
     ;Ngay
     lea si,day
     Call print_string
     mov al,bl
     xor ah,ah
     call print_num
     
     ;thang
     lea si,thang
     call print_string
     mov al,bh
     xor ah,ah
     call print_num
     
     ;nam
     lea si,nam
     call print_string    
     mov ax,cx
     call print_num
                          
     ret
        
        define_scan_num
        define_print_string
        define_print_num
        define_print_num_uns   
        
        end                   