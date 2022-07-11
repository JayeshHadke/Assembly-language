.model small
.data
mesg db 10,13,"The Current Time : "
hour db 2 dup(0),':'
min db 2 dup(0),':'
sec db 2 dup(0),':'
msec db 2 dup(0),'$'  
.code
mov ax,@data
mov ds,ax
call currentTime
mov ah,09h
lea dx,mesg
int 21h
mov ah,4ch
int 21h


currentTime proc
    mov ah,2ch
    int 21h
    
    mov al,ch
    aam
    or ax,3030h
    mov hour,ah
    mov hour+1,al
    
    mov al,cl
    aam
    or ax,3030h
    mov min,ah
    mov min+1,al
    
    mov al,dh
    aam
    or ax,3030h
    mov sec,ah
    mov sec+1,al
    
    mov al,dl
    aam
    or ax,3030h
    mov msec,ah
    mov msec+1,al
    ret
endp
end
