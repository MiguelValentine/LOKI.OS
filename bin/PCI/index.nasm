        mov rbx,BOOT_MESSAGE
        call BOOT_PRINT64_ONELINE
        mov rbx,BOOT_MESSAGE1
        call BOOT_PRINT64_ONELINE
    BOOT_FAST_PCI:
        xor rax,rax
        xor rsi,rsi
        mov rdx,2
        ;BUS
        BOOT_FAST_PCI_BUS:
        xor rbx,rbx
            ;DEV
            BOOT_FAST_PCI_DEV:
            xor rcx,rcx
                ;FUNC
                BOOT_FAST_PCI_FUNC:
                    push rax
                    push rbx
                    push rcx
                    call BOOT_FAST_PCI_GEN_CONFIG
                    mov edi,eax
                    mov dx,EQU_IO_PCI_CONFIG_ADDR
                    out dx,eax
                    mov dx,EQU_IO_PCI_CONFIG_DATA
                    in  eax,dx
                    cmp eax,0xFFFFFFFF
                    je BOOT_FAST_PCI_FUNC_FINISH
                    BOOT_FAST_PCI_SAVE:
                    mov [EQU_START_PCI+rsi],edi
                    mov [EQU_START_PCI+rsi+4],eax
                    add rsi,8
                    BOOT_FAST_PCI_PRINT:

                    mov edx,eax
                    mov word [BOOT_MESSAGE_CACHE+2],'0x'

                    mov ebx,BOOT_MESSAGE_CACHE+4
                    call BOOT_HEX2ASCII_32

                    mov word [BOOT_MESSAGE_CACHE+22],'0x'
                    mov ebx,BOOT_MESSAGE_CACHE+24
                    mov eax,edi
                    call BOOT_HEX2ASCII_32

                    shr edx,24
                    .x1:
                    cmp edx,0x01
                    jne .x2
                    mov dword [BOOT_MESSAGE_CACHE+39],'Mass'
                    mov dword [BOOT_MESSAGE_CACHE+43],' Sto'
                    mov dword [BOOT_MESSAGE_CACHE+47],'rage'
                    mov dword [BOOT_MESSAGE_CACHE+51],' Con'
                    mov dword [BOOT_MESSAGE_CACHE+55],'trol'
                    mov dword [BOOT_MESSAGE_CACHE+59],'ler'
                    jmp .xx

                    .x2:
                    cmp edx,0x02
                    jne .x3
                    mov dword [BOOT_MESSAGE_CACHE+39],'Netw'
                    mov dword [BOOT_MESSAGE_CACHE+43],'ork '
                    mov dword [BOOT_MESSAGE_CACHE+47],'Cont'
                    mov dword [BOOT_MESSAGE_CACHE+51],'roll'
                    mov dword [BOOT_MESSAGE_CACHE+55],'er'
                    mov dword [BOOT_MESSAGE_CACHE+59],''
                    jmp .xx

                    .x3:
                    cmp edx,0x03
                    jne .x4
                    mov dword [BOOT_MESSAGE_CACHE+39],'Disp'
                    mov dword [BOOT_MESSAGE_CACHE+43],'lay '
                    mov dword [BOOT_MESSAGE_CACHE+47],'Cont'
                    mov dword [BOOT_MESSAGE_CACHE+51],'roll'
                    mov dword [BOOT_MESSAGE_CACHE+55],'er'
                    mov dword [BOOT_MESSAGE_CACHE+59],''
                    jmp .xx

                    .x4:
                    cmp edx,0x04
                    jne .x5
                    mov dword [BOOT_MESSAGE_CACHE+39],'Mult'
                    mov dword [BOOT_MESSAGE_CACHE+43],'imed'
                    mov dword [BOOT_MESSAGE_CACHE+47],'ia D'
                    mov dword [BOOT_MESSAGE_CACHE+51],'evic'
                    mov dword [BOOT_MESSAGE_CACHE+55],'e'
                    mov dword [BOOT_MESSAGE_CACHE+59],''
                    jmp .xx

                    .x5:
                    cmp edx,0x05
                    jne .x6
                    mov dword [BOOT_MESSAGE_CACHE+39],'Memo'
                    mov dword [BOOT_MESSAGE_CACHE+43],'ry C'
                    mov dword [BOOT_MESSAGE_CACHE+47],'ontr'
                    mov dword [BOOT_MESSAGE_CACHE+51],'olle'
                    mov dword [BOOT_MESSAGE_CACHE+55],'r'
                    mov dword [BOOT_MESSAGE_CACHE+59],''
                    jmp .xx

                    .x6:
                    cmp edx,0x06
                    jne .x7
                    mov dword [BOOT_MESSAGE_CACHE+39],'Brid'
                    mov dword [BOOT_MESSAGE_CACHE+43],'ge D'
                    mov dword [BOOT_MESSAGE_CACHE+47],'evic'
                    mov dword [BOOT_MESSAGE_CACHE+51],'e'
                    mov dword [BOOT_MESSAGE_CACHE+55],''
                    mov dword [BOOT_MESSAGE_CACHE+59],''
                    jmp .xx

                    .x7:
                    cmp edx,0x07
                    jne .x8
                    mov dword [BOOT_MESSAGE_CACHE+39],'Simp'
                    mov dword [BOOT_MESSAGE_CACHE+43],'le C'
                    mov dword [BOOT_MESSAGE_CACHE+47],'omm '
                    mov dword [BOOT_MESSAGE_CACHE+51],'Cont'
                    mov dword [BOOT_MESSAGE_CACHE+55],'roll'
                    mov dword [BOOT_MESSAGE_CACHE+59],'ers'
                    jmp .xx

                    .x8:
                    cmp edx,0x08
                    jne .x9
                    mov dword [BOOT_MESSAGE_CACHE+39],'Base'
                    mov dword [BOOT_MESSAGE_CACHE+43],' Sys'
                    mov dword [BOOT_MESSAGE_CACHE+47],'tem '
                    mov dword [BOOT_MESSAGE_CACHE+51],'Peri'
                    mov dword [BOOT_MESSAGE_CACHE+55],'pher'
                    mov dword [BOOT_MESSAGE_CACHE+59],'als'
                    jmp .xx

                    .x9:
                    cmp edx,0x09
                    jne .xa
                    mov dword [BOOT_MESSAGE_CACHE+39],'Inpu'
                    mov dword [BOOT_MESSAGE_CACHE+43],'t De'
                    mov dword [BOOT_MESSAGE_CACHE+47],'vice'
                    mov dword [BOOT_MESSAGE_CACHE+51],''
                    mov dword [BOOT_MESSAGE_CACHE+55],''
                    mov dword [BOOT_MESSAGE_CACHE+59],''
                    jmp .xx

                    .xa:
                    cmp edx,0x0a
                    jne .xb
                    mov dword [BOOT_MESSAGE_CACHE+39],'Dock'
                    mov dword [BOOT_MESSAGE_CACHE+43],'ing '
                    mov dword [BOOT_MESSAGE_CACHE+47],'Stat'
                    mov dword [BOOT_MESSAGE_CACHE+51],'ions'
                    mov dword [BOOT_MESSAGE_CACHE+55],''
                    mov dword [BOOT_MESSAGE_CACHE+59],''
                    jmp .xx

                    .xb:
                    cmp edx,0x0b
                    jne .xc
                    mov dword [BOOT_MESSAGE_CACHE+39],'Proc'
                    mov dword [BOOT_MESSAGE_CACHE+43],'esso'
                    mov dword [BOOT_MESSAGE_CACHE+47],'rts'
                    mov dword [BOOT_MESSAGE_CACHE+51],''
                    mov dword [BOOT_MESSAGE_CACHE+55],''
                    mov dword [BOOT_MESSAGE_CACHE+59],''
                    jmp .xx

                    .xc:
                    cmp edx,0x0c
                    jne .clean
                    mov dword [BOOT_MESSAGE_CACHE+39],'Seri'
                    mov dword [BOOT_MESSAGE_CACHE+43],'al b'
                    mov dword [BOOT_MESSAGE_CACHE+47],'us C'
                    mov dword [BOOT_MESSAGE_CACHE+51],'ontr'
                    mov dword [BOOT_MESSAGE_CACHE+55],'olle'
                    mov dword [BOOT_MESSAGE_CACHE+59],'rs'
                    jmp .xx

                    .clean:
                    mov dword [BOOT_MESSAGE_CACHE+39],'Unkn'
                    mov dword [BOOT_MESSAGE_CACHE+43],'ow'
                    mov dword [BOOT_MESSAGE_CACHE+47],' Dev'
                    mov dword [BOOT_MESSAGE_CACHE+51],'ice'
                    mov dword [BOOT_MESSAGE_CACHE+55],''
                    mov dword [BOOT_MESSAGE_CACHE+59],''

                    .xx:

                    mov rbx,BOOT_MESSAGE_CACHE
                    call BOOT_PRINT64_ONELINE
                    BOOT_FAST_PCI_FUNC_FINISH:
                    mov edx,2
                    pop rcx
                    pop rbx
                    pop rax
                inc ecx
                cmp ecx,8
                jne BOOT_FAST_PCI_FUNC
            inc ebx
            cmp ebx,32
            jne BOOT_FAST_PCI_DEV
        inc eax
        cmp eax,256
        jne BOOT_FAST_PCI_BUS
    BOOT_MASS_STORAGE:
        mov eax,[EQU_START_PCI]
        cmp eax,0
        je BOOT_MASS_STORAGE_ERR

        mov rsi,7
    BOOT_MASS_STORAGE_CHECK:
        mov al,[EQU_START_PCI+rsi]
        cmp al,1
        je BOOT_MASS_STORAGE_NEXT
        cmp al,0
        je BOOT_MASS_STORAGE_ERR
        add rsi,8
        jmp BOOT_MASS_STORAGE_CHECK
    BOOT_MASS_STORAGE_NEXT:
        sub rsi,7
        mov eax,[EQU_START_PCI+rsi]

        and eax,0xFFFFFF03
        or  eax,9<<2

        mov dx,EQU_IO_PCI_CONFIG_ADDR
        out dx,eax
        mov dx,EQU_IO_PCI_CONFIG_DATA
        in  eax,dx
    hlt
        mov [EQU_START_PCI_IDE],ax
        mov dx,ax
        add dx,2
        in  al,dx

        hlt
    TEST_LIST:


    BOOT_MASS_STORAGE_ERR:
        mov rbx,BOOT_MESSAGE2
        call BOOT_PRINT64_ONELINE

    BOOT_FAST_PCI_GEN_CONFIG:
        shl eax,16
        shl ebx,11
        shl ecx,8
        shl edx,2
        or  eax,0x80000000
        or  eax,ebx
        or  eax,ecx
        or  eax,edx
        ret

    BOOT_PRINT64_ONELINE:
        mov rdi,0xB8000
        xor rax,rax
        mov al,[BOOT_PRINT64_LINE]
        mov cl,160
        mul cl
        add rdi,rax
        xor rcx,rcx
        mov cx,[rbx]
        add rbx,2
        BOOT_PRINT_ONELINE_CHAR:
            mov ah,7
            mov al,[rbx]
            mov [rdi],ax
            add rdi,2
            inc rbx
            loop BOOT_PRINT_ONELINE_CHAR
        add byte [BOOT_PRINT64_LINE],1
        jmp BOOT_PRINT64_END
    BOOT_PRINT64_LINE:
        db 0
    BOOT_PRINT64_END:
        ret

    BOOT_HEX2ASCII_32:
        push rdx
        push rcx
        push rdi
        push rsi

        mov esi,eax
        xor rdi,rdi
        BOOE_HEX2ASCII_32_ONECHAR:
        mov edx,esi
        mov rcx,rdi

        xor rax,rax
        mov al,4
        mul cl
        mov cl,al
        shr edx,cl

        and dl,0xF
        cmp dl,10
        jl BOOE_HEX2ASCII_32_NUM
        add dl,7
        BOOE_HEX2ASCII_32_NUM:
        add dl,0x30

        push rdi
        mov rax,rdi
        mov eax,7
        sub eax,edi
        mov edi,eax
        mov [ebx+edi],dl
        pop rdi

        inc rdi
        cmp rdi,8
        jne BOOE_HEX2ASCII_32_ONECHAR

        pop rsi
        pop rdi
        pop rcx
        pop rdx
        ret

    BOOT_MESSAGE:
        LIB_TEXT 'PCI DEVICE CHECK'
    BOOT_MESSAGE1:
        LIB_TEXT 'ClassCode           ADDRESS          TYPE'
    BOOT_MESSAGE2:
        LIB_TEXT 'Does not support PCI(E)! halt!!!'
    BOOT_MESSAGE_CACHE:
        LIB_TEXT '   '