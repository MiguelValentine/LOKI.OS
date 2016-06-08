;端口 EQU_IO

;NAME                             ;VALUE

;8237A DMA控制器1 DMA1 ［often used for transfers to floppies.］
;000-00F 8237 DMA controller:
EQU_IO_DMA1_CHANNEL0_ADDR         equ 0x0000
EQU_IO_DMA1_CHANNEL0_COUNT        equ 0x0001
EQU_IO_DMA1_CHANNEL1_ADDR         equ 0x0002
EQU_IO_DMA1_CHANNEL1_COUNT        equ 0x0003
EQU_IO_DMA1_CHANNEL2_ADDR         equ 0x0004
EQU_IO_DMA1_CHANNEL2_COUNT        equ 0x0005
EQU_IO_DMA1_CHANNEL3_ADDR         equ 0x0006
EQU_IO_DMA1_CHANNEL3_COUNT        equ 0x0007
EQU_IO_DMA1_STATUS_COMMAND        equ 0x0008
EQU_IO_DMA1_REQUEST               equ 0x0009
EQU_IO_DMA1_MASK                  equ 0x000A
EQU_IO_DMA1_MODE                  equ 0x000B
EQU_IO_DMA1_CLEAR_MSB_LSB         equ 0x000C
EQU_IO_DMA1_MASTR_CLR_TMP         equ 0x000D
EQU_IO_DMA1_MASK_CLR              equ 0x000E
EQU_IO_DMA1_MASK_MULTIPLE         equ 0x000F

;010-01F 8237 DMA Controller (PS2 model 60 & 80), reserved (AT)

;8259A PIC可编程中断控制器1 PIC1
;020-02F 8259A Master Programmable Interrupt Controller:
EQU_IO_PIC1_COMMAND               equ 0x0020
EQU_IO_PIC1_INTR_MASK             equ 0x0021

;030-03F 8259A Slave Programmable Interrupt Controller (AT,PS2)

;8253/8254|A 定时计数器 PIT
;040-05F 8253 or 8254 Programmable Interval Timer:
EQU_IO_PIT_CHANNEL0_COUNT_DIV     equ 0x0040
EQU_IO_PIT_CHANNEL1_RAM_COUNT     equ 0x0041
EQU_IO_PIT_CHANNEL2_SPEAKER       equ 0x0042
EQU_IO_PIT_MODE_CONTROL           equ 0x0043
EQU_IO_PIT_PS2_EXT_TIMER          equ 0x0044
EQU_IO_PIT_CHANNEL3_CONTROL       equ 0x0047

;8255 可编程外围接口 PPI
;060-067 8255 Programmalbe Peripheral Interface (PC,XT,PCjr):
EQU_IO_PPI_PORTA_KEYBOARD_IO      equ 0x0060
EQU_IO_PPI_PORTB_OUTPUT           equ 0x0061
EQU_IO_PPI_PORTC_INPUT            equ 0x0062
EQU_IO_PPI_COMMAND_MODE_CONTROL   equ 0x0063

;8042 键盘控制器 KC
;060-06f 8042 Keyboard Controller (AT,PS2):
EQU_IO_KC_KEYBOARD_IO             equ 0x0060
EQU_IO_KC_SYSTEM_CONTROL          equ 0x0061
EQU_IO_KC_KEYBOARD_COMMAND_STATUS equ 0x0064

;CMOS 访问CMOS RAM/实时时钟RTC（Real Time Clock)端口 CMOS
;070-07f CMOS:
EQU_IO_CMOS_RTC_NMI               equ 0x0070
EQU_IO_CMOS_RAM_DATA              equ 0x0071

;DMA DMA页面寄存器 DMA
;080-090 DMA Page Registers:
EQU_IO_DMA_MANUFACTURER_CHECK     equ 0x0080
EQU_IO_DMA_CHANNEL2_ADDR_H4       equ 0x0081
EQU_IO_DMA_CHANNEL3_ADDR_H4       equ 0x0082
EQU_IO_DMA_CHANNEL1_ADDR_H4       equ 0x0083

;POS 可编程选项 POS
;090-097 POS/Programmable Option Select (PS2):
EQU_IO_POS_CACP                   equ 0x0090         ;中央仲裁控制
EQU_IO_POS_CSF                    equ 0x0091         ;卡选项反馈
EQU_IO_POS_SCAST                  equ 0x0092         ;系统控制和状态寄存器
EQU_IO_POS_SBE                    equ 0x0094         ;主板设置寄存器
EQU_IO_POS_R1                     equ 0x0095         ;保留位
EQU_IO_POS_AE                     equ 0x0096         ;适配器设置寄存器
EQU_IO_POS_R2                     equ 0x0097         ;保留位

;8259A PIC可编程中断控制器2 PIC2
;0A0-0BF Second 8259 Programmalbe Interrupt Controller (AT,PS2):
EQU_IO_PIC2_COMMAND               equ 0x00A0
EQU_IO_PIC2_INTR_MASK             equ 0x00A1

;8237A DMA控制器2 DMA2 [often used for soundblasters]
;0C0-0DF 8237 DMA Controller 2 (AT):
EQU_IO_DMA2_PTG                   equ 0x00C0
EQU_IO_DMA2_CHANNEL3_SELECTOR     equ 0x00C2

;0E0-0EF Reserved

;FPU 数学协处理器
;0F0-0FF Math Coprocessor (AT,PS2)

;POS 可编程选项 POS
;100-10F POS Programmable Option Select (PS2):

;系统I/O通道
;110-1EF System I/O channel

;DISK 硬盘控制器 DISK1
;170-17F Fixed disk 1 (AT):
EQU_IO_DISK1_DATA                 equ 0x0170
EQU_IO_DISK1_ERR                  equ 0x0171
EQU_IO_DISK1_SECTOR_COUNT         equ 0x0172
EQU_IO_DISK1_SECTOR_NUM           equ 0x0173
EQU_IO_DISK1_SYLINDER_LOW         equ 0x0174
EQU_IO_DISK1_SYLINDER_HIGH        equ 0x0175
EQU_IO_DISK1_DRIVE_HEADER         equ 0x0176
EQU_IO_DISK1_STATUS               equ 0x0177

;DISK 硬盘控制器 DISK0
;1F0-1FF Fixed disk 0 (AT):
EQU_IO_DISK0_DATA                 equ 0x01F0
EQU_IO_DISK0_ERR                  equ 0x01F1
EQU_IO_DISK0_SECTOR_COUNT         equ 0x01F2
EQU_IO_DISK0_SECTOR_NUM           equ 0x01F3
EQU_IO_DISK0_SYLINDER_LOW         equ 0x01F4
EQU_IO_DISK0_SYLINDER_HIGH        equ 0x01F5
EQU_IO_DISK0_DRIVE_HEADER         equ 0x01F6
EQU_IO_DISK0_STATUS               equ 0x01F7

;游戏适配器
;200-20F Game Adapter

;ECP 扩展卡接口 ECP
;210-217 Expansion Card Ports (XT):
EQU_IO_ECP_DATA                   equ 0x0210
EQU_IO_ECP_MADDR_CLR              equ 0x0211
EQU_IO_ECP_LADDR                  equ 0x0212
EQU_IO_ECP_EXPANSION_CONTROL      equ 0x0213
EQU_IO_ECP_DATA2                  equ 0x0214
EQU_IO_ECP_ADDR2                  equ 0x0215

;保留
;21F Reserved

;保留
;220-26F Reserved for I/O channel

;PP 并口 PP2
;270-27F Third parallel port (see PARALLEL PORT):
EQU_IO_PP2_DATA                   equ 0x0278
EQU_IO_PP2_STATUS                 equ 0x0279
EQU_IO_PP2_CONTROL                equ 0x027A

;保留
;280-2AF Reserved for I/O channel

;MSM58321RS时钟
;2A2-2A3 MSM58321RS clock

;加强型EGA
;2B0-2DF Alternate EGA, or 3270 PC video (XT, AT)

;加强型EGA
;2E0 Alternate EGA/VGA

;GPIB适配器
;E1 GPIB Adapter (AT)

;数据采集卡
;2E2-2E3 Data acquisition adapter (AT)

;IBM保留
;2E8-2EF COM3 non PS2 UART (Reserved by IBM) (see UART)

;保留
;2F0-2F7 Reserved

;AA 第二串口 AA1
;2F8-2FF COM2 Second Asynchronous Adapter

;原型实验卡
;300-31F Prototype Experimentation Card

;HDC 硬盘控制器 HDC
;320-32F Hard Disk Controller (XT):
EQU_IO_HDC_CONTROLLER_IO_SET      equ 0x0320
EQU_IO_HDC_CONTROLLER_IO          equ 0x0321
EQU_IO_HDC_GEN_CONT_SELECT        equ 0x0322
EQU_IO_HDC_DMA_IMR                equ 0x0323
EQU_IO_HDC_DISK_STATUS            equ 0x0324

;保留
;330-33F Reserved for XT/370

;340-35F Reserved for I/O channel

;360-36F PC Network

;FDC 软盘控制器 FDC1
;370-377 Floppy disk controller (except PCjr):
EQU_IO_FDC1_DIGITAL_OUTPUT        equ 0x0372
EQU_IO_FDC1_CONTROLLER_STATUS     equ 0x0374
EQU_IO_FDC1_CONTROLLER_DATA1      equ 0x0375
EQU_IO_FDC1_CONTROLLER_DATA2      equ 0x0376
EQU_IO_FDC1_DIGITAL_INPUT         equ 0x0377

;PP 第二并口打印机 PP1
;378-37F Second Parallel Printer (see PARALLEL PORT):
EQU_IO_PP1_DATA                   equ 0x0378
EQU_IO_PP1_STATUS                 equ 0x0379
EQU_IO_PP1_CONTROL                equ 0x037A

;SDLC 第二二进制同步数据适配器 SDLC1
;380-38F Secondary Binary Synchronous Data Link Control (SDLC) adapter:

;集群适配器
;390-39F Cluster Adapter

;SDLC 第一二进制同步数据适配器 SDLC0
;3A0-3AF Primary Binary Synchronous Data Link Control (SDLC) adapter:

;6845 单色显示适配器 MDA
;3B0-3BF Monochrome Display Adapter (write only, see 6845):
EQU_IO_MDA_A                      equ 0x03B0
EQU_IO_MDA_B                      equ 0x03B1
EQU_IO_MDA_C                      equ 0x03B2
EQU_IO_MDA_D                      equ 0x03B3
EQU_IO_MDA_E                      equ 0x03B4
EQU_IO_MDA_F                      equ 0x03B5
EQU_IO_MDA_G                      equ 0x03B6
EQU_IO_MDA_H                      equ 0x03B7
EQU_IO_MDA_CONTROL                equ 0x03B8
EQU_IO_MDA_COLOR                  equ 0x03B9
EQU_IO_MDA_STATUS                 equ 0x03BA
EQU_IO_MDA_LIGHT_PEN              equ 0x03BB

;PP 第一并口打印机 PP0
;3BC-3BF Primary Parallel Printer Adapter (see PARALLEL PORT):
EQU_IO_PP0_DATA                   equ 0x03BC
EQU_IO_PP0_STATUS                 equ 0x03BD
EQU_IO_PP0_CONTROL                equ 0x03BE

;VGA 显示适配器 VGA
;3C0-3CF EGA/VGA:
EQU_IO_VGA_ATTR_SEQU              equ 0x03C0
EQU_IO_VGA_VIDEO_ATTR             equ 0x03C1
EQU_IO_VGA_INPUT_STATUS           equ 0x03C2
EQU_IO_VGA_VIDEO_SUB_EN           equ 0x03C3
EQU_IO_VGA_SEQU_INDEX             equ 0x03C4
EQU_IO_VGA_SEQU                   equ 0x03C5
EQU_IO_VGA_VIDEO_DAC_PEL_MASK     equ 0x03C6
EQU_IO_VGA_VIDEO_DAC_STATE        equ 0x03C7
EQU_IO_VGA_VIDEO_DAC_PEL_ADDR     equ 0x03C8
EQU_IO_VGA_VIDEO_DAC              equ 0x03C9
EQU_IO_VGA_GRAPHICS2_POS          equ 0x03CA
EQU_IO_VGA_GRAPHICS1_POS          equ 0x03CC
EQU_IO_VGA_FEATURE_CONTROL        equ 0x03CD
EQU_IO_VGA_GRAPHICS_INDEX         equ 0x03CE
EQU_IO_VGA_OTHER_GRAPHICS         equ 0x03CF

;6845 彩色图形显示器适配器 CGMA
;3D0-3DF Color Graphics Monitor Adapter (ports 3D0-3DB are write only, see 6845):
EQU_IO_CGMA_A                     equ 0x03D0
EQU_IO_CGMA_B                     equ 0x03D1
EQU_IO_CGMA_C                     equ 0x03D2
EQU_IO_CGMA_D                     equ 0x03D3
EQU_IO_CGMA_E                     equ 0x03D4
EQU_IO_CGMA_F                     equ 0x03D5
EQU_IO_CGMA_G                     equ 0x03D6
EQU_IO_CGMA_H                     equ 0x03D7
EQU_IO_CGMA_CONTROL               equ 0x03D8
EQU_IO_CGMA_COLOR                 equ 0x03D9
EQU_IO_CGMA_STATUS                equ 0x03DA
EQU_IO_CGMA_LIGHT_PEN_CLR         equ 0x03DB
EQU_IO_CGMA_LIGHT_PEN_PRESET      equ 0x03DC
EQU_IO_CGMA_CRT_PAGE              equ 0x03DF

;3E8-3EF COM3 non PS2 UART (Reserved by IBM) (see UART)

;FDC 软盘控制器 FDC0
;3F0-3F7 Floppy disk controller (except PCjr):
EQU_IO_FDC0_STATUSA               equ 0x03F0
EQU_IO_FDC0_STATUSB               equ 0x03F1
EQU_IO_FDC0_CONTROL               equ 0x03F2
EQU_IO_FDC0_CONTROLLER_STATUS     equ 0x03F4
EQU_IO_FDC0_DATA                  equ 0x03F5
EQU_IO_FDC0_CONTROLLER_DATA2      equ 0x03F6
EQU_IO_FDC0_DIGITAL_INPUT         equ 0x03F7

;AA 第一串口 AA0
;3F8-3FF COM1 Primary Asynchronous Adapter (see UART)3F0 Diskette controller status A:

