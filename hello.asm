; hello.asm -- tiny DOS .COM program (8086 real mode)
org 0x100         ; .COM program load offset

start:
    mov ah, 0x09
    mov dx, msg
    int 0x21       ; DOS print string
    mov ax, 0x4C00
    int 0x21       ; exit

msg db 'Hello from 8086 (COM)!', 13, 10, '$'

