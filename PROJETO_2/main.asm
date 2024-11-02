SetB p0.7
SetB p3.3
SetB p3.4

col1 equ p0.6
col2 equ p0.5
col3 equ p0.4

lin1 equ p0.3
lin2 equ p0.2
lin3 equ p0.1
lin4 equ p0.0

tecla equ 05h
mov tecla, 000h


ciclo:
lcall lerTeclado
lcall escDisplay
ljmp ciclo

apgDisplay:
mov A, #0FFh
mov P1, A
RET

escDisplay:
 ed_if1:
  mov A, tecla
  subb A, #1
  JNZ ed_fim_if1
  mov A, #0F9h
  mov P1, A
 ed_fim_if1:
 ed_if2:
  mov A, tecla
  subb A, #2
  JNZ ed_fim_if2
  mov A, #0A4h
  mov P1, A
 ed_fim_if2:
 ed_if3:
  mov A, tecla
  subb A, #3
  JNZ ed_fim_if3
  mov A, #0B0h
  mov P1, A
 ed_fim_if3:
 ed_if4:
  mov A, tecla
  subb A, #4
  JNZ ed_fim_if4
  mov A, #99h
  mov P1, A
 ed_fim_if4:
 ed_if5:
  mov A, tecla
  subb A, #5
  JNZ ed_fim_if5
  mov A, #092h
  mov P1, A
 ed_fim_if5:
 ed_if6:
  mov A, tecla
  subb A, #6
  JNZ ed_fim_if6
  mov A, #082h
  mov P1, A
 ed_fim_if6:
 ed_if7:
  mov A, tecla
  subb A, #7
  JNZ ed_fim_if7
  mov A, #0F8h
  mov P1, A
 ed_fim_if7:
 ed_if8:
  mov A, tecla
  subb A, #8
  JNZ ed_fim_if8
  mov A, #080h
  mov P1, A
 ed_fim_if8:
 ed_if9:
  mov A, tecla
  subb A, #9
  JNZ ed_fim_if9
  mov A, #090h
  mov P1, A
 ed_fim_if9:
 ed_if10:
  mov A, tecla
  subb A, #11
  JNZ ed_fim_if10
  mov A, #0C0h
  mov P1, A
 ed_fim_if10:
RET

lerTeclado:

clr col1
setb col2
setb col3

 lt_if1:
   JB lin1, lt_fim_if1
   mov tecla, #1
 lt_fim_if1:

 lt_if2:
   JB lin2, lt_fim_if2
   mov tecla, #4
 lt_fim_if2:

 lt_if3:
   JB lin3, lt_fim_if3
   mov tecla, #7
 lt_fim_if3:

setb col1
clr col2
setb col3

 lt_if5:
   JB lin1, lt_fim_if5
   mov tecla, #2
 lt_fim_if5:

 lt_if6:
   JB lin2, lt_fim_if6
   mov tecla, #5
 lt_fim_if6:

 lt_if7:
   JB lin3, lt_fim_if7
   mov tecla, #8
 lt_fim_if7:

 lt_if8:
   JB lin4, lt_fim_if8
   mov tecla, #11
 lt_fim_if8:

setb col1
setb col2
clr col3

 lt_if9:
   JB lin1, lt_fim_if9
   mov tecla, #3
 lt_fim_if9:

 lt_if10:
   JB lin2, lt_fim_if10
   mov tecla, #6
 lt_fim_if10:

 lt_if11:
   JB lin3, lt_fim_if11
   mov tecla, #9
 lt_fim_if11:
RET