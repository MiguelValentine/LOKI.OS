; Copyright (c) 2016-2017 Miguel Valentine
; All rights reserved.

;配置
%include "include/config/index.nasm"

;常量
%include "include/constant/index.nasm"

;宏
%include "include/macro/index.nasm"

%if CONFIG_BOOT_STYLE
    ;UEFI
    %include "bin/UEFI.nasm"
%else
    ;LEGACY-BIOS BOOT
    %include "bin/MBR.nasm"
    %include "bin/MBR_BOOT.nasm"
%endif

%include "bin/KERNEL.nasm"