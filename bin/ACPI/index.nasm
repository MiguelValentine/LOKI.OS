; ACPI SUPPORT
; Copyright (c) 2016-2017 Miguel Valentine
; All rights reserved.
[bits 64]

%include "bin/ACPI/RSDP.nasm"

%include "bin/ACPI/RSDT.nasm"


mov al,[EQU_START_RSDP+15]
cmp al,2
je ACPI_XSDT
jmp ACPI_DONE

%include "bin/ACPI/XSDT.nasm"
%include "bin/ACPI/ASSIST/DESC.nasm"
%include "bin/ACPI/ASSIST/SSDT.nasm"
%include "bin/ACPI/ASSIST/DSDT.nasm"
%include "bin/ACPI/ASSIST/MADT.nasm"
%include "bin/ACPI/ASSIST/FADT.nasm"
%include "bin/ACPI/ASSIST/FACS.nasm"
%include "bin/ACPI/ASSIST/SBST.nasm"
%include "bin/ACPI/ASSIST/ECDT.nasm"
%include "bin/ACPI/ASSIST/SRAT.nasm"
%include "bin/ACPI/ASSIST/SLIT.nasm"
%include "bin/ACPI/ASSIST/CPEP.nasm"
%include "bin/ACPI/ASSIST/MSCT.nasm"
%include "bin/ACPI/ASSIST/RASF.nasm"
%include "bin/ACPI/ASSIST/MPST.nasm"
%include "bin/ACPI/ASSIST/BGRT.nasm"
%include "bin/ACPI/ASSIST/FPDT.nasm"
%include "bin/ACPI/ASSIST/GTDT.nasm"
%include "bin/ACPI/err.nasm"

ACPI_DONE:
