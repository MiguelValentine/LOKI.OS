; Copyright (c) 2016-2017 Miguel Valentine
; All rights reserved.

%ifndef LIB
%define LIB

;------------------------------------------------
;   LIB_FILL
;   %1 SIZE
;------------------------------------------------
%macro LIB_FILL 1
    times %1-($-$$) db 0
%endmacro

;------------------------------------------------
;   LIB_A20_ENABLE
;------------------------------------------------
%macro LIB_A20_ENABLE 0
    in  al,EQU_IO_POS_SCAST
    or  al,0x02
    out EQU_IO_POS_SCAST,al
%endmacro

;------------------------------------------------
;   LIB_TEXT
;------------------------------------------------
%macro LIB_TEXT 1
    %%start:
    dw %%end-%%start-2
    dd %1
    %%end:
%endmacro

;------------------------------------------------
;   LIB_NMI_DISABLE
;------------------------------------------------
%macro LIB_NMI_DISABLE 0
    in  al,EQU_IO_CMOS_RTC_NMI
    or  al,0x80
    out EQU_IO_CMOS_RTC_NMI,al
%endmacro

;------------------------------------------------
;   LIB_NMI_ENABLE
;------------------------------------------------
%macro LIB_NMI_ENABLE 0
    in  al,EQU_IO_CMOS_RTC_NMI
    and al,0x7f
    out EQU_IO_CMOS_RTC_NMI,al
%endmacro

;------------------------------------------------
;   LIB_GDT
;   %1基址
;   %2变址
;   %3段基址
;   %4段界限
;   %5G/DB/L/AVL
;   %6P/DLP/S/TYPE
;------------------------------------------------
%macro LIB_GDT 6
    mov dword [%1+%2],(((%3) & 0xffff)<<16) | ((%4) & 0xffff)
    mov dword [%1+%2+0x04],((%3) & 0xff000000) | ((%5)<<20) | ((%4) & 0x000f0000) | ((%6)<<8) | (((%3) & 0x00ff0000)>>16)
    add cx,8
%endmacro

%endif