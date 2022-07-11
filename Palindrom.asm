.model small
.data
mesg1 db 10,13,"Enter String : $"
mesg2 db 10,13,"Reversed String : $" 
mesg3 db 10,13,"String is Palindrome! $"
mesg4 db 10,13,"String is Not Palindrome! $"
str db 20 dup(?)
rev db 20 dup(?)
print macro mesg
    push ax
    push dx
    mov ah,09h
    lea dx,mesg
    int 21h
    pop dx
    pop ax
endm   

printchar macro mesg   
    push ax
    push dx
    mov dl,mesg
    mov ah,02h
    int 21h
    pop dx
    pop ax
endm

.code
mov ax,@data
mov ds,ax
mov cl,00
lea si,str   
print mesg1
back:   mov ah,01h
        int 21h
        cmp al,0DH
        je next0
        mov [si],al
        inc si
        inc cl
        jmp back
        
next0:  print mesg2    
        dec si
        mov ch,cl
        lea di,rev  
        
next:   mov dl,[si]
        mov [di],dl
        printchar [di]
        inc di
        dec si
        dec ch
        jnz next
        
        lea si,str
        lea di,rev   
        
        
next1:  mov al,[si]
        cmp al,[di]
        jne last
        inc si
        inc di
        dec cl
        jnz next1  
        print mesg3
        jmp last1
        
last:   print mesg4
last1:  mov ah,4ch
        int 21h
        end




