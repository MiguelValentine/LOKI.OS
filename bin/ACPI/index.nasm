; ACPI SUPPORT
; Copyright (c) 2016-2017 Miguel Valentine
; All rights reserved.
[bits 64]
EQU_ACPI_SIGNATURE  equ 'RSD PTR '

mov rbx,EQU_ACPI_SIGNATURE
xor rsi,rsi
mov rcx,32768

ACPI_RSDP_SEARCH:
    ;PCI ONLY
    ;The BIOS read-only memory space between 0E0000h and 0FFFFFh.
    ;@ Advanced Configuration and Power Interface Specification 5.2.5.1 Finding the RSDP on IA-PC Systems
    mov rax,[0xE0000+rsi]
    cmp rax,rbx
    je ACPI_RSDP_PARSE
    add rsi,4
    loop ACPI_RSDP_SEARCH

    ;NO RSDP
    hlt

ACPI_RSDP_PARSE:
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
    call ACPI_RSDT_PARSE
    mov al,[EQU_START_RSDP+15]
    cmp al,2
    je ACPI_RSDT_2
    jmp ACPI_DONE
    ACPI_RSDT_2:
    call ACPI_XSDT_PARSE
    jmp ACPI_DONE

ACPI_RSDT_PARSE:
    
    ret

ACPI_XSDT_PARSE:
    ret

ACPI_DONE:
