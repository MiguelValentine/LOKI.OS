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
    EQU_SIZE_BOOT               equ 512
    EQU_DP_BOOT                 equ 1

    ;KERNEL
    EQU_START_KERNEL            equ 0x100000
    EQU_SIZE_KERNEL             equ 512
    EQU_DP_KERNEL               equ 1

    ;GDT
    EQU_START_GDT               equ 0x20000

    ;IDT
    EQU_START_IDT               equ 0x30000
%endif