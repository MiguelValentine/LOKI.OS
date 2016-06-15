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
;   LIB_DAP_CREATE
;   %1 数量
;   %2 内存位置
;   %3 磁盘位置
;------------------------------------------------
%macro LIB_DAP_CREATE 3
    db 16               ;size of DAP = 16 = 10h
    db 0                ;unused, should be zero
    dw %1               ;number of sectors to be read
    dd %2               ;segment:offset pointer to the memory buffer to which sectors
    dq %3               ;absolute number of the start of the sectors to be read (1st sector of drive has number 0)
%endmacro

%endif