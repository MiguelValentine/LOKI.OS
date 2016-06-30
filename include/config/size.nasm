; Copyright (c) 2016-2017 Miguel Valentine
; All rights reserved.

%ifndef MOD_SIZE
%define MOD_SIZE

    ;NAME                       POSITION & SIZE
    ;MBR
    EQU_START_MBR               equ 0x7c00
    EQU_SIZE_MBR                equ 512
    EQU_DP_MBR                  equ 0

    ;BOOT
    EQU_START_BOOT              equ 0x7e00
    EQU_SIZE_BOOT               equ 4096
    EQU_DP_BOOT                 equ 1

    ;KERNEL
    EQU_START_KERNEL            equ 0x100000
    EQU_SIZE_KERNEL             equ 512
    EQU_DP_KERNEL               equ 9

    ;GDT
    EQU_START_GDT               equ 0x20000

    ;SMRAM
    EQU_START_SMRAM             equ 0x30000

    ;IDT
    EQU_START_IDT               equ 0x40000

    ;PML4T
    EQU_START_PML4T             equ 0x41000
    ;PDPT
    EQU_START_PDPT              equ 0x42000
    ;PDT
    EQU_START_PDT               equ 0x50000

    ;ACPI
    EQU_START_RSDP              equ 0x60000
    EQU_START_RSDT              equ 0x61000

    ;PCI(E)
    EQU_START_PCI               equ 0x70000

    ;STACK
    EQU_START_STACK             equ 0x80000
%endif