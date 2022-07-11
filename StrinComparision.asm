.model small
.data
mesg1 db 10,13,"Enter String 1 : $"
mesg2 db 10,13,"Enter String 2 : $" 
mesg3 db 10,13,"Length of String 1 : $"    
mesg4 db 10,13,"Length of String 2 : $"
mesg5 db 10,13,"Strings are Equal! $"
mesg6 db 10,13,"Strings are Not Equal! $"       
str1 db 40,0,40 dup(?)
str2 db 40,0,40 dup(?)

scan macro src
    push dx
    push ax
    lea dx,src
    mov ah,0Ah
    int 21h
    pop ax
    pop dx
endm

print macro mesg
    push dx
    push ax
    lea dx,mesg
    mov ah,09h
    int 21h
    pop ax
    pop dx   
endm

dispLength macro len
    push dx
    push ax
    push bx 
    mov al,len
    aam
    mov bx,ax
    or bx,3030h
    mov ah,02h
    mov dl,bh
    int 21h
    mov dl,bl
    int 21h 
    pop bx
    pop ax
    pop dx
endm

.code
mov ax,@data
mov ds,ax     
mov es,ax

print mesg1
scan str1
print mesg2
scan str2    
print mesg3
mov al,str1+1
dispLength al
print mesg4
mov al,str2+1
dispLength al


lea si,str1+2
lea di,str2+2
mov cx,40

repe cmpsb
jne fail
print mesg5
jmp exit

fail:print mesg6
exit:mov ah,4ch
     int 21h
     end  