; Copyright (c) 2016-2017 Miguel Valentine
; All rights reserved.
[bits 16]
SECTION MBR vstart=EQU_START_MBR align=16
    MBR_START:
        cli
        cld
        LIB_A20_ENABLE

        mov ax,cs
        mov ds,ax
        mov es,ax
        mov ss,ax
        xor sp,sp

        mov cx,EQU_SIZE_BOOT/512
        mov esi,EQU_DP_BOOT
        mov di,EQU_START_BOOT

        call MBR_DISK_LOAD

        jmp 0:EQU_START_BOOT
        hlt
    MBR_DISK_LOAD:
        LIB16_BIOS_DISKLOAD
    MBR_PDT:
        LIB_FILL 446
    MBR_END:
        LIB_FILL 510
        dw 0xAA55
        LIB_FILL EQU_SIZE_MBR