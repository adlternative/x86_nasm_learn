cmp ax,bx
jg lbb
jl lbl
je lbz

lbb:
 mov ax,bx
lbl:
 mov bx,[0x1234]
lbz:
 mov cx,[0x1234]
