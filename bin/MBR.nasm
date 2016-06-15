; Copyright (c) 2016-2017 Miguel Valentine
; All rights reserved.
[bits 16]
SECTION MBR vstart=EQU_START_MBR align=16

    MBR_START:

    cli
    LIB_A20_ENABLE

    mov sp,0

    call MBR_CLS

    mov cx,1
    mov esi,EQU_DP_BOOTLOADER
    mov di,EQU_START_BOOTLOADER

    call MBR_DISK_LOAD

    jmp 0:EQU_START_BOOTLOADER
    hlt


    MBR_TEST:
        db 16
        db 0
        dw EQU_SIZE_BOOTLOADER/512
        dd EQU_START_BOOTLOADER
        dq EQU_DP_BOOTLOADER
    MBR_DISK_LOAD:
        LIB16_BIOS_DISKLOAD
    MBR_CLS:
        LIB16_CLS
    MBR_PDT:
        LIB_FILL 446
    MBR_END:
        LIB_FILL 510
        dw 0xAA55
        LIB_FILL EQU_SIZE_MBR

SECTION BOOTLOADER vstart=EQU_START_BOOTLOADER align=16
    mov ax,0x4444
    hlt