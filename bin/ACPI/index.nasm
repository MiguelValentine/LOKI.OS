; ACPI SUPPORT
; Copyright (c) 2016-2017 Miguel Valentine
; All rights reserved.
[bits 64]
EQU_RSDP_SIGNATURE  equ 'RSD PTR '
EQU_RSDT_SIGNATURE  equ 'RSDT'

mov rbx,EQU_RSDP_SIGNATURE
xor rsi,rsi
mov rcx,32768

ACPI_RSDP_SEARCH:
    ;PCI ONLY
    ;The BIOS read-only memory space between 0E0000h and 0FFFFFh.
    ;@ Advanced Configuration and Power Interface Specification 5.2.5.1 Finding the RSDP on IA-PC Systems
    mov rax,[0xE0000+rsi]
    cmp rax,rbx
    je ACPI_RSDP_HANDEL
    add rsi,8
    loop ACPI_RSDP_SEARCH

    ;NO RSDP
    jmp ACPI_ERR_1
    hlt

ACPI_RSDP_HANDEL:
    mov rbx,rsi
    add rbx,0xE0000
    ;RSDP 指针
    mov qword [EQU_START_RSDP],rbx

    ;Revision -RAX
    xor rax,rax
    mov al,[rbx+15]

    cld

    mov rsi,rbx
    add rsi,8
    mov rdi,EQU_START_RSDP+8

    mov rcx,12

    ;v1.0
    cmp al,0
    je ACPI_RSDP_COPY_1

    cmp al,2
    je ACPI_RSDP_COPY_2

    ;UNKNOW ACPI VERSION
    jmp ACPI_ERR_2
    hlt

ACPI_RSDP_COPY_2:
    xor rcx,rcx
    mov cx,[rbx+20]
    jmp ACPI_RSDP_COPY

ACPI_RSDP_COPY_1:
    jmp ACPI_RSDP_COPY

ACPI_RSDP_COPY:
    rep movsb

ACPI_RSDT:
    mov rbx,EQU_START_RSDP
    add rbx,16
    mov ebx,[rbx]
    and ebx,0xFFFFFFFF
    call ACPI_RSDT_HANDEL
    mov al,[EQU_START_RSDP+15]
    cmp al,2
    je ACPI_RSDT_2
    jmp ACPI_DONE
    ACPI_RSDT_2:
    call ACPI_XSDT_HANDEL
    jmp ACPI_DONE

ACPI_RSDT_HANDEL:
    mov rax,[rbx]
    hlt
    cmp eax,EQU_RSDT_SIGNATURE
    hlt
    jne ACPI_ERR_3

ACPI_RSDT_HANDEL_DONE:
    ret

ACPI_XSDT_HANDEL:
    ret

ACPI_ERR_1:
    mov  rbx,ACPI_TEXT_1
    call BOOT_PRINT_ONELINE
    hlt

ACPI_TEXT_1:
    LIB_TEXT 'NON-EXISTENT RSDP HEADER!'

ACPI_ERR_2:
    mov  rbx,ACPI_TEXT_2
    call BOOT_PRINT_ONELINE
    hlt

ACPI_TEXT_2:
    LIB_TEXT 'UNKNOW RSDP VERSION!'

ACPI_ERR_3:
    mov  rbx,ACPI_TEXT_3
    call BOOT_PRINT_ONELINE
    hlt

ACPI_TEXT_3:
    LIB_TEXT 'ILLEGAL RSDT HEADER!'

ACPI_DONE:
