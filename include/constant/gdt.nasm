; Copyright (c) 2016-2017 Miguel Valentine
; All rights reserved.

%ifndef MOD_GDT
%define MOD_GDT
;MSR EQU_GDT

;NAME                             ;VALUE
EQU_GDT_X64_CODE                  equ 0x0008
EQU_GDT_X64_DATA                  equ 0x0010

%endif