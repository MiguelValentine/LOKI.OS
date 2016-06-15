; Copyright (c) 2016-2017 Miguel Valentine
; All rights reserved.

%ifndef MOD_CONFIG
%define MOD_CONFIG

%include "include/size.nasm"

;启动方式
;0 MBR
;1 UEFI
CONFIG_BOOT_STYLE           equ 0

;载体
;0x80 第一硬盘
CONFIG_MAIN_DISK            equ 0x80

%endif