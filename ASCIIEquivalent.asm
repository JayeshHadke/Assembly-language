.model small
.data
mesg db 10,13,"Enter any Alphanumeric Character : $"
mesg1 db 10,13,"ASCII equivalent : $" 
.code
mov ax,@data
mov ds,ax
lea dx,mesg
mov ah,09h
int 21h
mov ah,01h
int 21h  
mov bl,al

push ax
mov ah,09h
lea dx,mesg1
int 21h
pop ax

mov cl,04h
shr al,cl
cmp al,0Ah
jb l1
add al,07h
l1: add al,30h
    mov dl,al
    mov ah,02h
    int 21h
    
and bl,0Fh
cmp bl,0Ah
jb l2 
add bl,07h
l2: add bl,30h
    mov dl,bl
    mov ah,02h
    int 21h
    
mov ah,4ch
int 21h
end