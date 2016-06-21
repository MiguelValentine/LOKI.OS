EQU_RSDT_SIGNATURE  equ 'RSDT'

ACPI_RSDT:
    mov rbx,EQU_START_RSDP
    add rbx,16
    xor rax,rax
    mov eax,[rbx]
    mov rbx,rax

    call ACPI_RSDT_HANDEL
    jmp ACPI_RSDT_DONE

    ACPI_RSDT_HANDEL:
        mov rax,[rbx]
        cmp eax,EQU_RSDT_SIGNATURE
        jne ACPI_ERR_3
        
        ;copy
        mov ecx,[rbx+4]

        cld
        mov rsi,rbx
        mov rdi,EQU_START_RSDT
        rep movsb

        xor rcx,rcx
        mov ecx,[EQU_START_RSDT+4]
        sub rcx,36

        ACPI_RSDT_HEADER_CHECK:
            cmp rcx,0
            je ACPI_RSDT_HANDEL_DONE

            mov rbx,rcx
            sub rbx,4
            add rbx,EQU_START_RSDT+36
            mov rbx,[rbx]

            call ACPI_DESC

            sub rcx,4
            jmp ACPI_RSDT_HEADER_CHECK

        hlt

    ACPI_RSDT_HANDEL_DONE:
        ret

ACPI_RSDT_DONE:
hlt