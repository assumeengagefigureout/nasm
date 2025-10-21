bits 16
org 0x100

    jmp start_code


var0102:    dw 0x5564
var0104:    dw 0xC279
var0106:    dw 0x0000
var0108:    dw 0x0000

start_code:


    mov ax, [var0102]


    push ax


    add al, byte [var0104]


    adc ah, byte [var0104 + 1]


    mov [var0106], ax


    pop ax


    sub al, byte [var0104]


    sbb ah, byte [var0104 + 1]


    mov [var0108], ax

   
    mov ax, [var0106]
    mov ax, [var0108]


 
    mov ax, 0x4C00
    int 0x21
