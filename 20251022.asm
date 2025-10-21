
bits 16
org  0x100

    jmp  start

VAR1    db  0x35         
RES1    db  0               
RES2    db  0              

VAR2    dd  0x0E2597455    
start:

    mov     al, [VAR1]      
    mov     ah, al
    and     al, 0x0F        
    and     ah, 0xF0        
    shr     ah, 4           
    mov     [RES1], ah      
    mov     [RES2], al      





    mov     ax, [VAR2]      
    mov     dx, [VAR2+2]   


    shl     ax, 1           
    rcl     dx, 1           


    shl     ax, 1
    rcl     dx, 1

    mov     [VAR2],   ax    
    mov     [VAR2+2], dx    


    mov     ax, 0x4C00
    int     0x21
