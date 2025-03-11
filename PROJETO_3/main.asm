config:
SETB P0.7
SETB P3.4
SETB P3.3
valor equ 05H

ORG 00H
JMP MAIN

MAIN:
	LCALL lerADC
	LCALL converterValor
	LCALL escDisplay
	LJMP MAIN

lerADC:
	CLR P3.6
	SETB P3.6
INTR:
	JB P3.2, INTR
	CLR P3.7
	MOV A, P2
	MOV valor, A
	SETB P3.7
	RET

converterValor:
	MOV A, valor
	MOV B, #28    ; Exemplo 5V: 255 / (255/9)
	DIV AB
	MOV valor, A
	RET

escDisplay:
	mov A, valor
	CJNE A, #1, ed_if2
	MOV A, #0F9H
	MOV P1, A
	SJMP ed_fim

ed_if2:
	CJNE A, #2, ed_if3
	MOV A, #0A4H
	MOV P1, A
	SJMP ed_fim

ed_if3:
	CJNE A, #3, ed_if4
	MOV A, #0B0H
	MOV P1, A
	SJMP ed_fim

ed_if4:
	CJNE A, #4, ed_if5
	MOV A, #99H
	MOV P1, A
	SJMP ed_fim

ed_if5:
	CJNE A, #5, ed_if6
	MOV A, #092H
	MOV P1, A
	SJMP ed_fim

ed_if6:
	CJNE A, #6, ed_if7
	MOV A, #082H
	MOV P1, A
	SJMP ed_fim

ed_if7:
	CJNE A, #7, ed_if8
	MOV A, #0F8H
	MOV P1, A
	SJMP ed_fim

ed_if8:
	CJNE A, #8, ed_if9
	MOV A, #080H
	MOV P1, A
	SJMP ed_fim
	
ed_if9:
	CJNE A, #9, ed_fim
	MOV A, #090H
	MOV P1, A
	SJMP ed_fim
ed_fim:
	RET