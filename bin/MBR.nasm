;MBR
;@ MIGUEL VALENTINE
;演示使用

SECTION MBR vstart=EQU_START_MBR align=16

    MBR_START:
;------------------------------------------------
;   MBR_STACK_SET:
;------------------------------------------------
    MBR_STACK_SET:
        mov sp,0

;------------------------------------------------
;   阻止中断
;------------------------------------------------
        cli
        std

;------------------------------------------------
;   MBR_OPERATION:
;   加载bootloader
;------------------------------------------------
    MBR_OPERATION:
        mov si,MBR_DAP
        call MBR_FUNCTION_LOADDISK
        jmp 0:EQU_START_BOOTLOADER
    hlt

;------------------------------------------------
;   MBR_FUNCTION:
;------------------------------------------------
    MBR_FUNCTION_LOADDISK:
        LIB16_BIOS_DISKLOAD
    MBR_DAP:
        LIB_DAP_CREATE 1,EQU_START_BOOTLOADER,EQU_DP_BOOTLOADER

;------------------------------------------------
;   MBR_PT_LIST:
;------------------------------------------------
    LIB_FILL 446
    MBR_PT_LIST:

;------------------------------------------------
;   MBR_END:
;------------------------------------------------
    LIB_FILL 510
        db 0x55,0xaa

    LIB_FILL EQU_SIZE_MBR
    MBR_END:

SECTION BOOTLOADER vstart=EQU_START_BOOTLOADER align=16
    mov ax,0x4444
    hlt
    LIB_FILL EQU_SIZE_BOOTLOADER
    BOOTLOADER_END: