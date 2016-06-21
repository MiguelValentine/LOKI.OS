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
        
    BOOT_GDT_INSTALL:
        mov eax,EQU_START_GDT
        shr eax,4
        mov ds,ax

        xor cx,cx

        LIB_GDT 0,0,0,0,0,0
        
        LIB_GDT 0,EQU_GDT_X64_CODE    ,0        ,0xFFFFF    ,1010B  ,0x98
        LIB_GDT 0,EQU_GDT_X64_DATA    ,0        ,0xFFFFF    ,1000B  ,0x92

        dec cx

        mov word [cs:BOOT_GDT_SEC],cx
        lgdt [cs:BOOT_GDT_SEC]

    BOOT_IDT_INSTALL:
        mov eax,EQU_START_IDT
        shr eax,4
        mov ds,ax

        xor cx,cx

        LIB_IDT 0,0,0,0,0,0

        dec cx

        mov word [cs:BOOT_IDT_SEC],cx
        lidt [cs:BOOT_IDT_SEC]

    BOOT_PAE:
        mov eax,cr4
        bts eax,5
        mov cr4,eax

    BOOT_PAGING:
        ;MAP 1G ADDRESS - FLAT
        mov eax,EQU_START_PDT
        shr eax,4
        mov ds,ax

        xor esi,esi
        xor edi,edi
        mov cx,512
        .PDE_ONE:
            mov eax,edi
            mov ebx,edi
            and edi,0xfffff
            or  edi,(0x80|111B)&0xfff
            mov dword [esi],edi

            and eax,0xfff00000
            shr eax,20
            mov dword [esi+0x04],eax

            mov edi,ebx
            add esi,0x08
            add edi,0x2

            loop .PDE_ONE

        mov eax,EQU_START_PDPT
        shr eax,4
        mov ds,ax

        LIB_PDPTE 0,0,EQU_START_PDT,111B,0

        mov eax,EQU_START_PML4T
        shr eax,4
        mov ds,ax

        LIB_PML4E 0,0,EQU_START_PDPT,111B,0

    BOOT_PML4T:
        mov eax,EQU_START_PML4T
        mov cr3,eax

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

        jmp EQU_GDT_X64_CODE:BOOT_X64

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

[bits 64]
    BOOT_X64:
        mov ax,EQU_GDT_X64_DATA
        mov ds,ax
        mov es,ax
        mov fs,ax
        mov gs,ax
        mov ss,ax
        mov rsp,0x80000
    BOOT_ACPI:
        %include "bin/ACPI/index.nasm"

        hlt
    BOOT_PRINT_ONELINE:
        mov rdi,0xB8000
        xor rcx,rcx
        mov cx,[rbx]
        add rbx,2
        BOOT_PRINT_ONELINE_CHAR:
            mov ah,7
            mov al,[rbx]
            mov [rdi],ax
            add rdi,2
            inc rbx
            loop BOOT_PRINT_ONELINE_CHAR
        ret
    BOOT_END:
        LIB_FILL EQU_SIZE_BOOT