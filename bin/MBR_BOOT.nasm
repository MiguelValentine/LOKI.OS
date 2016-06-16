; Copyright (c) 2016-2017 Miguel Valentine
; All rights reserved.
[bits 16]
SECTION BOOT vstart=EQU_START_BOOT align=16
    BOOT_START:
        call BOOT_CLS

    BOOT_LONGMODE_CHECK:
        mov eax,0x80000000
        cpuid
        cmp eax,0x80000001
        setnb al
        jb BOOT_LONGMODE_CHECK_DONE
        mov eax,0x80000001
        cpuid
        bt edx,29
        setc al
        BOOT_LONGMODE_CHECK_DONE:
            movzx eax,al
            test eax,eax
            jz BOOT_LONGMODE_DISABLE

    LIB_NMI_DISABLE
    LIB_A20_ENABLE

    BOOT_LOAD_KERNEL:
        
    BOOT_GDT_INSTALL:
        mov eax,EQU_START_GDT
        shr eax,4
        mov ds,ax

        xor cx,cx

        LIB_GDT 0,0,0,0,0,0
        
        LIB_GDT 0,EQU_GDT_X64_CODE    ,0  ,0xFFFFF    ,1010B  ,0x98
        LIB_GDT 0,EQU_GDT_X64_DATA    ,0  ,0xFFFFF    ,1000B  ,0x92

        dec cx

        mov word [cs:BOOT_GDT_SEC],cx
        lgdt [cs:BOOT_GDT_SEC]

        hlt


    BOOT_IDT_INSTALL:

    BOOT_PAE:
        mov eax,cr4
        bts eax,5
        mov cr4,eax
    BOOT_PAGING:
    BOOT_LONG_MODE:
        mov ecx,EQU_MSR_EFER
        rdmsr
        bts eax,8
        wrmsr
    BOOT_IA32E:
        mov eax,cr0
        bts eax,0
        bts eax,31
        mov cr0,eax

        ;JMP
    hlt

    BOOT_LONGMODE_DISABLE:
        mov ebx,BOOT_TEXT_LONGMODE_DISABLE
        call BOOT_PRINT
        hlt
    BOOT_TEXT_LONGMODE_DISABLE:
        LIB_TEXT 'X64 architecture only,Halt!'
    BOOT_CLS:
        LIB16_CLS
    BOOT_PRINT:
        LIB16_PRINT

    BOOT_GDT_SEC:
        dw 0
        dd EQU_START_GDT
    BOOT_IDT_SEC:
        dw 0
        dd EQU_START_IDT

    BOOT_END:
        LIB_FILL EQU_SIZE_BOOT
