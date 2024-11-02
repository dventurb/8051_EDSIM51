col1 equ p0.6
col2 equ p0.5
col3 equ p0.4
       
lin1 equ p0.3
lin2 equ p0.2
lin3 equ p0.1
lin4 equ p0.0
       
tecla equ 0h
x equ 01h
y equ 02h
       

mov x, #8
mov y, #48
lcall escCursor

ciclo:
lcall lerteclado
lcall movCursor
lcall escCursor
ljmp ciclo
       
escCursor:
 mov A, y
 add A, x
 mov r0, A
 mov A, #255
 mov @r0, A
 ret
 
apgCursor:
 mov A, y
 add A, x
 mov r0, A
 mov A, #00
 mov @r0, A
 ret      

movCursor:
 mc_if1:
  mov A, tecla
  subb A, #4
  JNZ mc_end_if1
  mov A, x
  JZ mc_end_if1
  lcall apgCursor
  subb A, #1
  mov x, A
  lcall escCursor
  lcall esperar
 mc_end_if1:
       
mc_if2:
 mov A, tecla
 subb A, #6
 JNZ mc_end_if2
 mov A, x
 subb A, #15
 JZ mc_end_if2
 lcall apgCursor
 mov A, x
 add A, #1
 mov x, A
 lcall escCursor
 lcall esperar
 mc_end_if2:
 
mc_if3:
 mov A, tecla
 subb A, #2
 JNZ mc_end_if3
 mov A, y
 subb A, #16
 JZ mc_end_if3
 lcall apgCursor
 mov A, y
 subb A, #16
 mov y, A
 lcall escCursor
 lcall esperar
 mc_end_if3:

mc_if4:
 mov A, tecla
 subb A, #8
 JNZ mc_end_if4
 mov A, y
 subb A, #96
 JZ mc_end_if4
 lcall apgCursor
 mov A, y
 add A, #16
 mov y, A
 lcall escCursor
 lcall esperar
 mc_end_if4:
ret
       

LERTECLADO:
 clr col1
 setb col2
 setb col3
       
 lt_if1:
  JB lin1, lt_fim_if1
  mov tecla, #1
 lt_fim_if1:
       
 lt_if2:
  JB lin2, lt_fim_if2
  mov	tecla, #4
 lt_fim_if2:
       
 lt_if3:
  JB lin3, lt_fim_if3
   mov	tecla, #7
 lt_fim_if3:
       
 lt_if4:
  JB lin4, lt_fim_if4
  mov	tecla, #10
 lt_fim_if4:
       
 clr col2
 setb col1
 setb col3   
  
 lt_if5:
  JB lin1, lt_fim_if5
  mov  tecla, #3
 lt_fim_if5:
       
 lt_if6:
   JB lin2, lt_fim_if6
   mov	tecla, #5
 lt_fim_if6:
       
 lt_if7:
  JB lin3, lt_fim_if7
  mov	tecla, #8
 lt_fim_if7:
       
  lt_if8:
  JB lin4, lt_fim_if8
   mov	tecla, #0
  lt_fim_if8:
      
 clr col3  
 setb col1
 setb col2    

 lt_if9:
  JB lin1, lt_fim_if9
   mov	tecla, #2
  lt_fim_if9:
       
 lt_if10:
  JB lin2, lt_fim_if10
   mov	tecla, #6
  lt_fim_if10:
       
 lt_if11:
  JB lin3, lt_fim_if11
  mov	tecla, #9
  lt_fim_if11:
       
  lt_if12:
   JB lin4, lt_fim_if12
   mov	tecla, #12
  lt_fim_if12:
RET


ESPERAR:
 clr col1
 setb col2
 setb col3
 jnb lin1,ESPERAR
 jnb lin2,ESPERAR
 jnb lin3,ESPERAR

 setb col1
 clr col2
 setb col3
 jnb lin1,ESPERAR
 jnb lin2,ESPERAR
 jnb lin3,ESPERAR

 setb col1
 setb col2
 clr col3
 jnb lin1,ESPERAR
 jnb lin2,ESPERAR
 jnb lin3,ESPERAR
 ret
