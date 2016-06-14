;配置
%include "include/config.nasm"

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
%endif