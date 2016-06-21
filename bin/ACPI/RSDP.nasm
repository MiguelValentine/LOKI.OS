EQU_RSDP_SIGNATURE  equ 'RSD PTR '

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