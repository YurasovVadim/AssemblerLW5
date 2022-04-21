%include "syscall.mac"
SECTION .text
GLOBAL _start
_start:
  mov eax, 7
  mov ecx, 0
  cpuid

  and ebx, 00080000h
  cmp ebx, 0  
  je label_ADX_off
  WRITE ADcX_on, ADcX_on.len
  WRITE ADoX_on, ADoX_on.len
  jmp label_toMulx

label_ADX_off:
  WRITE ADcX_off, ADcX_off.len
  WRITE ADoX_off, ADoX_off.len

label_toMulx:
  mov eax, 7
  mov ecx, 0
  cpuid
  and ebx, 00000100h
  cmp ebx, 0
  je label_BMI2_off
  WRITE BMI2_on, BMI2_on.len
  EXIT

label_BMI2_off:
  WRITE BMI2_off, BMI2_off.len
  
  EXIT
SECTION .data
ADcX_on: 
  DB "adcx:  ON", 0xA
  .len: EQU $ - ADcX_on
ADcX_off: 
  DB "adcx:  OFF", 0xA
  .len: EQU $ - ADcX_off
ADoX_on: 
  DB "adox:  ON", 0xA
  .len: EQU $ - ADoX_on
ADoX_off: 
  DB "adox:  OFF", 0xA
  .len: EQU $ - ADoX_off
BMI2_on: 
  DB "MULX: ON", 0xA
  .len: EQU $ - BMI2_on
BMI2_off: 
  DB "MULX:  OFF", 0xA
  .len: EQU $ - BMI2_off

ADXBreak: DB "ADX - OFF", 0xA
.len: EQU $ - ADXBreak
