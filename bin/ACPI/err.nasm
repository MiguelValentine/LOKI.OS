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