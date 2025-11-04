bits 16
org 0x0100

start:

    mov byte [ODDNUM],  0
    mov byte [EVENNUM], 0

    lea bx, [VAR]     
    mov cx, 10        

count_loop:
    mov al, [bx]      
    test al, 1        
    jnz is_odd

is_even:
    inc byte [EVENNUM]
    jmp finish

is_odd:
    inc byte [ODDNUM]

finish:
    inc bx
    loop count_loop

    mov ah, 0x4C
    xor al, al
    int 21h


VAR  db 14, -25, 66, -17, 78, -33, 46, -96, 71, 80
ODDNUM  db 0
EVENNUM db 0
