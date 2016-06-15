%ifndef LIB_16
%define LIB_16

;------------------------------------------------
;   LIB16_BIOS_DISKLOAD
;------------------------------------------------
%macro LIB16_BIOS_DISKLOAD
    push dx
    push ax
    mov dl,CONFIG_MAIN_DISK
    mov ah,0x42
    int 0x13
    pop ax
    pop dx
    ret
%endmacro

%endif