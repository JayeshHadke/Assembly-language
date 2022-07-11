.model small
.data
arr db 10h,13h,14h,54h,32h
len db $-arr
tofind db 13h
mesg1 db 10,13,"Element Found! $"
mesg2 db 10,13,"Element Not Found! $" 
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
mov cl,len
lea si,arr
mov al,tofind
repeat: cmp al,[si]
        je found
        inc si
        loop repeat
        print mesg2  
        jmp exit
    
found:  print mesg1

exit:   mov ah,4ch
        int 21h
        end
        