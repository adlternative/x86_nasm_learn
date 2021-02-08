mov byte [0x00],'L'
mov [0x00],al
;mov [0x01],'L'           ;错误'L'可以是1~2B
;mov [0x1001],'L'         ;错误'L'可以是1~2B
;mov [0x00],'L'           ;错误
;mov byte al,bx           ;错误 长度不同,加单位没用
;mov ax,bl                ;错误 长度不同
mov [0x01],bl             ;正确只能取bl
mov [0x01],bh             ;正确只能取bh
mov [0x01],bx             ;正确只能取bl
mov ah,0x05               ;正确 dst通用寄存器1B，       src立即数1B
;mov byte ah,0xff05        ;错误 dst通用寄存器1B+byte    src立即数2B
mov ax,0x05               ;正确 dst通用寄存器2B,        src立即数1B
;mov [0x1c],0xf000        ;错误 dst内存单元,            src立即数可以1~2B
mov word [0x1c],0xf000    ;正确 dst内存单元指定传送大小 src立即数可以1~2B
;mov al,0x55aa            ;错误 dst通用寄存器1B         src立即数2B
;mov ds,0x6000            ;错误   段寄存器                 立即数2B
;mov ds,al                ;错误   段寄存器2B               通用寄存器1B
;mov [0x06] 0x55aa        ;错误   内存单元1B               立即数2B
mov ds,bx                 ;正确
mov es,cx                 ;正确
mov ax,0x02               ;正确   通用寄存器2B                 通用寄存器1B
mov word [0x0a],ax        ;正确   内存单元1B+word            通用寄存器2B
mov [0x0a],ax             ;正确   内存单元1B                 通用寄存器2B
;mov ax,bl                ;错误   通用寄存器2B             通用寄存器1B
mov byte [0x00],'c'       ;正确
;mov [0x00],'c'           ;错误   内存单元1B               立即数可以1~2B
mov ax,[0xf000]           ;正确  通用寄存器2B             内存单元2B
mov [0x01],ax             ;正确    内存单元1B               通用寄存器2B
;mov [0x02],[0xf000]      ;错误    内存单元                 内存单元
mov ds,[0x03]             ;正确   段寄存器2B              内存单元1B
;总结：
;内存单元，立即数，通用寄存器，段寄存器 C(4,2)=6种不同的方式，1B or 2B 总共24种
;错误情况：
;   dst内存单元(1B or 2B),src立即数(1B or 2B) 需要单位
;   dst通用寄存器(1B or 2B),src通用寄存器(1B or 2B) 错误 加单位没用
;   dst通用寄存器(1B),src立即数(>=2B) 越界，加单位没用
;   dst内存单元(1B or 2B),src内存单元(1B or 2B) 错误 两个内存单元直接传递
;   dst段寄存器(2B) 立即数2B
;   dst段寄存器(2B) 通用寄存器1B 错误 加单位没用


