; boot.asm - prints string using BIOS teletype (int 0x10 AH=0x0E)
org 0x7c00

start:
    cli
    xor ax, ax
    mov ds, ax     ; 数据段 0，使后续字符串地址简化（我们用相对）
    mov si, msg
    call print_string
    hlt

print_string:
    lodsb
    or al, al
    jz .done
    mov ah, 0x0E
    int 0x10
    jmp print_string
.done:
    ret

msg db 'Hello from 8086 boot!', 0

; fill to 510 bytes, and write boot signature 0x55AA
times 510 - ($ - $$) db 0
dw 0xAA55

