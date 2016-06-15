;ACPI SUPPORT
;@ MIGUEL VALENTINE
;@ Advanced Configuration and Power Interface Specification

EQU_ACPI_SIGNATURE  equ 'RSD PTR '

ACPI_RSDP_SEARCH:
    ;PCI ONLY
    ;The BIOS read-only memory space between 0E0000h and 0FFFFFh.
    ;@ Advanced Configuration and Power Interface Specification 5.2.5.1 Finding the RSDP on IA-PC Systems
    