data1 dw 0x0001
data3 db 0x12
mov ax, [data1]
div word [data1]
add word [data1], 0x1234
xor word [data1], 0x1234
div byte [0xf0]
xor al,[data3]
div byte [data1]

jmp near start
start: mov ax,0
mov byte [data],0
data db 0x55,0xaa
jmp 0x2000:0x5000
mov ax, 21015
mov bl, 10
div bl
and cl,0xf0