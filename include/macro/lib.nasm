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

%endif