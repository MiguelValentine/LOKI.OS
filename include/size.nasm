; Copyright (c) 2016-2017 Miguel Valentine
; All rights reserved.

%ifndef MOD_SIZE
%define MOD_SIZE

    ;NAME                       POSITION & SIZE
    ;MBR
    EQU_START_MBR               equ 0x7c00
    EQU_SIZE_MBR                equ 512
    EQU_DP_MBR                  equ 0

    ;BOOTLOADER
    EQU_START_BOOTLOADER        equ 0x7e00
    EQU_SIZE_BOOTLOADER         equ 512
    EQU_DP_BOOTLOADER           equ 1

%endif