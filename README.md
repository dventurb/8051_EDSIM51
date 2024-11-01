<div align="center" style="text-align: center">
<img src="https://dapj.org/wp-content/uploads/2015/04/edsim51-8051-Simulator.png" alt="EDSIM51 Logo"/>
<h3>Projetos em Assembly no EDSIM51</h3>
<p>
  Projetos práticos para a disciplina de Arquitetura e Sistemas de Computadores, no curso de Sistemas Eletrónicos e Computadores. Desenvolvidos diversos projetos que exploram a interação com dispositivos de entrada e saída, utilizando linguagem Assembly no simulador EDSIM51. 
</p>
</div>

# Conteúdo

- [Software](#Software)
- [Diagrama](#Diagrama)
- [Projetos](#Projetos)
- [Conceitos](#Conceitos)


# Software

## EDSIM51
O simulador funciona em Windows, Linux e macOS, por ser baseado em JavaTM, deve funcionar em qualquer sistema operacional que tenha o Java Runtime Environment instalado.
- [Download](https://sourceforge.net/projects/edsim51/)
- [Instruções](https://edsim51.com/installation-instructions/)


# Diagrama
<img src="https://edsim51.wordpress.com/wp-content/uploads/2024/08/logicdiagram.png?w=961" alt="Diagrama"/>

# Projetos

Na disciplina de Arquitetura de Sistemas de Computadores, foram desenvolvidos 15 projetos que exploram a interação com dispositivos de entrada e saída

**Controle de Cursor**:
   Posiciona um cursor na memória (endereço 38h) e permite seu movimento em quatro direções (2 para subir, 8 para descer, 6 para direita, 4 para esquerda) usando o teclado numérico. A posição anterior é apagada antes de cada movimento, e cada tecla deve ser liberada antes da próxima ação.

**Leitura de Teclado e Exibição em 7 Segmentos**:
   Lê a tecla pressionada no teclado numérico e exibe o valor no display de 7 segmentos, mantendo-o até que uma nova tecla seja pressionada.

**Leitura ADC com Exibição de 0 a 9**:
   Lê um valor da unidade de conversão analógico-digital (ADC) e o exibe como um nível entre 0 e 9 no display de 7 segmentos.

**Leitura ADC com Exibição de 0 a 99**:
   Similar ao anterior, mas exibe o valor lido de 0 a 99 na memória.

**Indicador de Nível de Bateria**:
    Monitora o nível de carga de uma bateria, acendendo um LED verde para níveis acima de 4V, vermelho para abaixo de 2V, e amarelo para níveis intermediários.

   **Sequência de Teclas no Teclado Numérico**:
    Armazena em sequência cada tecla pressionada no teclado numérico, começando na posição 20h e avançando para o próximo endereço a cada nova tecla. Também requer que cada tecla seja liberada antes da próxima entrada.

**Sequência de Teclas com Teclado de Switches**:
    Similar ao projeto anterior, mas utilizando um teclado de switches para armazenar as teclas em sequência de memória.

**Contador Up/Down em Display de 7 Segmentos**:
    Um contador que usa duas teclas para incrementar e decrementar o valor exibido no display de 7 segmentos, com rotação entre 0 e 9.

**Contador Up/Down na Memória**:
    Expande o contador anterior para valores de 0 a 99 e armazena os valores diretamente na memória.

**Conversor Binário para Decimal em Display**:
    Ajusta um valor binário e o exibe em formato decimal com três dígitos consecutivos em posições de memória de 20h a 22h.

**Controle de LEDs com Teclado Numérico**:
    Usa teclas de 0 a 8 no teclado numérico para acender em sequência uma quantidade correspondente de LEDs. A quantidade acesa é mantida até a próxima entrada.

**Dado Eletrônico em Memória**:
    Implementa um dado eletrônico, sorteando um número entre 1 e 6, que é exibido na memória.

**Dado Eletrônico em Display de 7 Segmentos**:
    Similar ao anterior, mas exibe o número sorteado no display de 7 segmentos.

**Contagem de Teclas Premidas em Memória**:
    Armazena em memória a contagem de teclas pressionadas.

**Contagem de Teclas Premidas em 7 Segmentos**:
    Exibe a contagem de teclas pressionadas no display de 7 segmentos.



# Conceitos



 ## Arquitetura do 8051
 
  **Arquitetura Harvard:**
     O microcontrolador utiliza a Arquitetura Harvard, ou seja utiliza barramentos separados para as Instruções e para os Dados, melhorando a velocidade de processamento.

  **Acumulador (A):** 
     É o principal registrador, serve principalmente para armazenar resultados de operações aritméticas e lógicas.
     ```asm
     MOV A, #05h          ; Mover o valor 5 para o Acumulador
     ADD A, #05h          ; Adicionar 5 ao valor atual do Acumulador (A = 5 + 5)

     
**Registrador B:** 
    Um registrador secundário utilizado para multiplicação e divisão, trabalha em conjunto com o Acumulador (A) nessas operações.
    ```asm
    MOV A, #06h          ; Mover o valor 5 para o Acumulador
    MOV B, #03h          ; Mover o valor 2 para o Registrador B
    MUL AB               ; Multiplicar A por B e Armazena o resultado no Acumulador (A = 10, B = 2) 



**Registradores (R0 a R7):** 

  ***Funções do R0 e R1***
       Os registradores R0 e R1 tem uma função específica, eles funcionam de forma semelhante a Apontadores em Linguagem C. 
       Por exemplo, podemos armazenar um endereço específico de memória RAM, nos registradores R0 ou R1.
       ```asm
       MOV R0, #30h         ; Endereço da memória 30h para o Registrador R0
       MOV A, #05h          ; Mover o valor 5 para o Acumulador
       MOV @R0, A           ; Armazena o valor 5 na posição de memória 30h (endereço apontado por R0)



  ***Funções dos R2 a R7*** 
      Os Registradores de R2 a R7 são utilizados para armazenar dados temporários, contadores em loops e outras variáveis.
       ```asm
       MOV R3, #05h       ; Mover 5 para o R3
       LOOP:              ; Inicio do LOOP
       DJNZ R3, LOOP      ; Decrementa o valor em R3 e Salta para LOOP enquanto R3 não for 0



## Instruções Básicas

  **MOV:** 
    Utilizado para mover dados de uma localização para outra.
    ```asm
     MOV A, #10h        ; Move o valor hexadecimal 10 para o Acumulador (A)

    
    
  **ADD e SUBB:** 
    Operações aritméticas de soma e subtração. ADD soma valores e SUBB subtrai.
     ```asm
     MOV A, #05h       ; Mover o valor 5 para o Acumulador (A)
     ADD A, #03h       ; Adicionar 3 ao valor em A (A = 5 + 3 = 8)
     MOV B, #02h       ; Move o valor 2 para o registrador B
     SUBB A, B         ; Subtrai o valor de B em A e Armazena em A (A = 8 - 2 = 6)

  
  **INC e DEC:** 
    Instruções de incremento e decremento que aumentam ou diminuem o valor em um registrador.
    ```asm
    MOV R1, #01h      ; Mover o valor hexadecimal 01 para o registrador R1
    INC R1            ; Incrementa o valor em R1 (R1 = 02h)
    MOV 40h, #01h     ; Move o valor hexadecimal 01 para o endereço de memória 40h
    DEC 40h           ; Decrementa o valor na posição de memória 40h (40h = 00h)

    

## Modos de Endereçamento


  **Direto:**
    A instrução acessa diretamente o endereço de memória especificado.
    ```asm
    MOV A, 30h   ; Move o valor do endereço 30h para o acumulador.



  **Indireto:** 
    Um registrador aponta para o endereço de memória desejado.
    ```asm
    MOV R0, #30h     ; Carregar o endereço 30h no registrador R0 (Apontador)
    MOV A, @R0       ; Mover o valor do endereço de memória apontado por R0 para o Acumulador (A) 


## Controlo de Fluxo


  **Instruções de Salto:** 


  ***JMP (Salto Incondicional)***
      O JMP permite que o fluxo do programa salte incondicionalmente para a LABEL indicada.
      ```asm
      JMP LABEL_CRIADA     ; Salta para a END_LABEL
      ...
      LABEL_CRIADA:        ; Destino do salto

    
  ***JNZ (JUMP IF NOT ZERO)***
    O JNZ verifica o conteúdo do Acumulador (A), se o resultado da operação anterior não for zero, o fluxo do programa salta para a LABEL indicada.
  ```asm
    MOV A, #02h       ; Mover o valor de 2 para o Acumulador (A)
    SUBB A, #1        ; Subtrair 1 ao valor do Acumulador (A = 2 - 1)
    JNZ LABEL_CRIADA  ; Verifica o valor do Acumulador, se não for 0 irá salta para LABEL_CRIADA
    ...
    LABEL_CRIADA:
```


  ***JMZ (JUMP IF ZERO)***
     O JMZ verifica se o resultado é zero, se o resultado for zero, o fluxo do programa salta para a LABEL indicada. 
     ```asm
     MOV A, #02h       ; Mover 0 para o acumulador A
     SUBB A, #2        ; Subtrair 2 ao valor do Acumulador (A = 2 - 2)   
     JMZ LABEL_CRIADA  ; Se A é zero, salta para LABEL_CRIADA
     ...
     LABEL_CRIADA:


## Entradas e Saídas (I/O)

 -PORT0 (P0.0 a P0.7): Este porta é utilizada para o teclado numérico de 4x4.
 -PORT1 (P1.0 a P1.7): Esta porta é utilizada para controlar LEDs.

### Estrutura do Teclado Numérico

O teclado numérico tem 4 colunas e 4 linhas, como podemos verificar na figura.

<img src="https://github.com/dventurb/8051_EDSIM51/blob/main/keypad.png" alt="KEYPAD" width="400" height="350" />


Utilizamos P0.0 a P0.3 para as linhas e P0.4 a P0.6 para as colunas, como exemplo:
```asm
; Definição das linhas e colunas do teclado
lin1 equ P0.0 ; Linha 1
lin2 equ P0.1 ; Linha 2
lin3 equ P0.2 ; Linha 3
lin4 equ P0.3 ; Linha 4

col1 equ P0.4 ; Coluna 1
col2 equ P0.5 ; Coluna 2
col3 equ P0.6 ; Coluna 3
```
    

