bits 16
org 0x100

start_code:


    mov ax, [var0100]

    push ax
    add  al, byte [var0102]
    adc  ah, byte [var0102 + 1]
    mov  [var0104], ax

    pop  ax
    sub  al, byte [var0102]
    sbb  ah, byte [var0102 + 1]
    mov  [var0106], ax


    mov ax, [var0104]
    mov ax, [var0106]


    mov ax, 0x4C00
    int 0x21


align 2
var0100:    dw 0x5564
var0102:    dw 0xC279
var0104:    dw 0x0000
var0106:    dw 0x0000
