SECTION .text 
GLOBAL printhex 
printhex:
mov ebx, 0 
std
mov eax, 10
lea rdi, [hexstr + hexstr.len - 1]
stosb
.oncemore:
mov al, [rsi+rbx] 
and eax, 0x0F
mov al, [hexdigits+rax] 
stosb
mov al, [rsi+rbx]
and eax, 0xF0 
shr eax, 4
mov al, [hexdigits+rax]
stosb
inc rbx
cmp rbx, rcx 
jne .oncemore 
mov rax, 1 
inc rdi
mov rsi, rdi
 
lea rdx, [hexstr + hexstr.len] 
sub rdx, rsi
mov rdi, 1 
syscall
ret
SECTION .data
hexdigits: db '0123456789abcdef'
SECTION .bss
hexstr:
RESB 4096/4+1
.len: EQU $ - hexstr
