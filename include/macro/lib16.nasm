; Copyright (c) 2016-2017 Miguel Valentine
; All rights reserved.

%ifndef LIB16
%define LIB16

;------------------------------------------------
;   LIB16_BIOS_DISKLOAD
;------------------------------------------------
%macro LIB16_BIOS_DISKLOAD
    xor eax, eax
    push eax
    push esi
    push es
    push di
    push cx
    push word 0x10

    mov ah,0x42

    mov dl,CONFIG_MAIN_DISK

    mov si,sp
    int 0x13
    add sp,0x10
    ret
%endmacro

;------------------------------------------------
;   LIB16_CLS
;------------------------------------------------
%macro LIB16_CLS 0
    pusha
    mov ax, 0x0600
    xor cx, cx
    xor bh, 0x0f
    mov dh, 24
    mov dl, 79
    int 0x10
    mov ah, 02
    mov bh, 0
    mov dx, 0
    int 0x10        
    popa
    ret
%endmacro

;------------------------------------------------
;   LIB16_PRINT
;------------------------------------------------
%macro LIB16_PRINT 0
    push ax
    push cx
    push es
    mov di,0
    mov cx,[bx]
    mov ax,0xB800
    mov es,ax
    add bx,2
    %%LIB16_PRINT_CHAR:
        mov ah,7
        mov al,[bx]
        mov [es:di],ax
        add di,2
        inc bx
        loop %%LIB16_PRINT_CHAR
    pop es
    pop cx
    pop ax
    ret
%endmacro

%endif