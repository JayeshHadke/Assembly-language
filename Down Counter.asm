.model small
.data
mesg db 10,13,"Counter : $"
blank db 10,13,"$"
.code
mov ax,@data
mov ds,ax
mov ah,09h
lea dx,mesg
int 21h  
mov cx,3939h
back:mov ah,09h
     lea dx,blank
     int 21h
     mov ah,02h
     mov dl,ch
     int 21h
     mov dl,cl
     int 21h
     
     call delay
     dec cl
     cmp cl,30h
     jae back
     
     dec ch
     mov cl,39h
     
     cmp ch,30h
     jae back
     
     mov ah,4ch
     int 21h
     
     delay proc
        push bx
        mov bx,0000FH
        l1:dec bx
        jnz l1
        pop bx
        ret
     endp
     
     end
       