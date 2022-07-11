.model small
.data
mesg1 db 10,13,"Enter the Count for Fabonacci Series : $" 
feb db ?
print macro mesg
    push dx
    push ax
    mov ah,09h
    lea dx,mesg
    int 21h
    pop ax
    pop dx
endm
 
.code
mov ax,@data
mov ds,ax
print mesg1
mov ah,01h
int 21h
and al,0Fh
mov cl,al 
lea si,feb
mov al,00h
mov [si],al  

inc si
mov bl,01h 
mov [si],bl 

inc si 
sub cl,02h
back:   add al,bl
        mov [si],al   
       
        xchg al,bl
        inc si
        loop back    
   
mov ah,4ch
int 21h
end       

