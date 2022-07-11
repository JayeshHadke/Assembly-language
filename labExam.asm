.model small  
.data
sarr dw 1000h,2000h,3000h,4000h     ;source array
darr dw 4 dup(?)                    ;destination array
len equ 4                           ;length of array 
.code
mov ax,@data
mov ds,ax

lea si,sarr                         ;load effective address on si of source array which will be use as indirect addressing mode
lea di,darr                         ;load effective address on di of destination array which will be use as indirect addressing mode
mov dx,00h                          ;coping 00h into dx , use as temp for adding all content of array
mov cl,len                           ;coping array size for loop instruction from len to cl

back:   mov ax,[si]                 ;coping [si] pointed value into ax ,where [si] pointing to the source array by indirect addressing mode
        mov [di],ax                 ;coping back [si] pointed value to [di]pointed address which was stored temporary in ax, where [di] pointing to 
                                    ;destination array by indirect
                                    ;addressing mode
        add dx,ax                   ;adding value of dx and ax and storing back to dx, where dx is temp register and ax pointing to the content of array 
                                    ;at the instence
        inc si
        inc si                      ;increamenting si for pointing next location of source array two times
        inc di
        inc di                      ;increamenting di for pointing next location of destination array two times
        loop back                   ;loop back to back label and decrementing cl and checks jne
                                    ;if loop doesnot satisfies jne ,then come out of the loop
mov ah,4ch
int 21h
end