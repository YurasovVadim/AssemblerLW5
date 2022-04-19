%include "syscall.mac" 
SECTION .text 
GLOBAL _start
_start:
mov eax, 7
mov ecx, 0 
cpuid
mov eax, 7
mov ecx, 0 
cpuid
mov eax, 1<<8 
and eax, ebx 
jz METKA_2
WRITE BMI2, BMI2.len
step_2: 
mov eax, 7
mov ecx, 0 
cpuid
mov eax, 1<<19
and eax, ebx 
jz METKA_3
WRITE ADX, ADX.len 
EXIT
METKA_2:
WRITE BMIBreak2, BMIBreak2.len 
jmp step_2
METKA_3:
WRITE ADXBreak, ADXBreak.len 
EXIT
SECTION .data
BMI2: DB "BMI2 - ON", 0xA
.len: EQU $ - BMI2
BMIBreak2: DB "BMI2 - OFF", 0xA
.len: EQU $ - BMIBreak2 
ADX: DB "ADX - ON", 0xA
.len: EQU $ - ADX
ADXBreak: DB "ADX - OFF", 0xA
.len: EQU $ - ADXBreak
