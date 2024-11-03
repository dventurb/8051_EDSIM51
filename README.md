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


<p align="center"><strong>Controle de Cursor</strong></p>

Posiciona um cursor na memória (endereço 38h) e permite seu movimento em quatro direções (2 para subir, 8 para descer, 6 para direita, 4 para esquerda) usando o teclado numérico. A posição anterior é apagada antes de cada movimento, e cada tecla deve ser liberada antes da próxima ação.


<p align="center"><strong>Leitura de Teclado e Exibição em 7 Segmentos</strong></p>

Lê a tecla pressionada no teclado numérico e exibe o valor no display de 7 segmentos, mantendo-o até que uma nova tecla seja pressionada.


<p align="center"><strong>Leitura ADC com Exibição de 0 a 9</strong></p>

 Lê um valor da unidade de conversão analógico-digital (ADC) e o exibe como um nível entre 0 e 9 no display de 7 segmentos.


<p align="center"><strong>Leitura ADC com Exibição de 0 a 99</strong></p>

Similar ao anterior, mas exibe o valor lido de 0 a 99 na memória.

<p align="center"><strong>Indicador de Nível de Bateria</strong></p>

Monitora o nível de carga de uma bateria, acendendo um LED verde para níveis acima de 4V, vermelho para abaixo de 2V, e amarelo para níveis intermediários.


<p align="center"><strong>Sequência de Teclas no Teclado Numérico</strong></p>
   
Armazena em sequência cada tecla pressionada no teclado numérico, começando na posição 20h e avançando para o próximo endereço a cada nova tecla. Também requer que cada tecla seja liberada antes da próxima entrada.


<p align="center"><strong>Sequência de Teclas com Teclado de Switches</strong></p>

Similar ao projeto anterior, mas utilizando um teclado de switches para armazenar as teclas em sequência de memória.


<p align="center"><strong>Contador Up/Down em Display de 7 Segmentos</strong></p>

Um contador que usa duas teclas para incrementar e decrementar o valor exibido no display de 7 segmentos, com rotação entre 0 e 9.


<p align="center"><strong>Contador Up/Down na Memória</strong></p>

Expande o contador anterior para valores de 0 a 99 e armazena os valores diretamente na memória.


<p align="center"><strong>Conversor Binário para Decimal em Display</strong></p>

Ajusta um valor binário e o exibe em formato decimal com três dígitos consecutivos em posições de memória de 20h a 22h.


<p align="center"><strong>Controle de LEDs com Teclado Numérico</strong></p>

Usa teclas de 0 a 8 no teclado numérico para acender em sequência uma quantidade correspondente de LEDs. A quantidade acesa é mantida até a próxima entrada.


<p align="center"><strong>Dado Eletrônico em Memória</strong></p>

Implementa um dado eletrônico, sorteando um número entre 1 e 6, que é exibido na memória.


<p align="center"><strong>Dado Eletrônico em Display de 7 Segmentos</strong></p>

Similar ao anterior, mas exibe o número sorteado no display de 7 segmentos.


<p align="center"><strong>Contagem de Teclas Premidas em Memória</strong></p>

Armazena em memória a contagem de teclas pressionadas.


<p align="center"><strong>Contagem de Teclas Premidas em 7 Segmentos</strong></p>

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
```

     
**Registrador B:** 
    Um registrador secundário utilizado para multiplicação e divisão, trabalha em conjunto com o Acumulador (A) nessas operações.
  ```asm
    MOV A, #06h          ; Mover o valor 5 para o Acumulador
    MOV B, #03h          ; Mover o valor 2 para o Registrador B
    MUL AB               ; Multiplicar A por B e Armazena o resultado no Acumulador (A = 10, B = 2)
```



**Registradores (R0 a R7):** 

  ***Funções do R0 e R1***
       Os registradores R0 e R1 tem uma função específica, eles funcionam de forma semelhante a Apontadores em Linguagem C. 
       Por exemplo, podemos armazenar um endereço específico de memória RAM, nos registradores R0 ou R1.
  ```asm
       MOV R0, #30h         ; Endereço da memória 30h para o Registrador R0
       MOV A, #05h          ; Mover o valor 5 para o Acumulador
       MOV @R0, A           ; Armazena o valor 5 na posição de memória 30h (endereço apontado por R0)
```



  ***Funções dos R2 a R7*** 
      Os Registradores de R2 a R7 são utilizados para armazenar dados temporários, contadores em loops e outras variáveis.
  ```asm
       MOV R3, #05h       ; Mover 5 para o R3
       LOOP:              ; Inicio do LOOP
       DJNZ R3, LOOP      ; Decrementa o valor em R3 e Salta para LOOP enquanto R3 não for 0
  ```



## Instruções Básicas

  **MOV:** 
    Utilizado para mover dados de uma localização para outra.
  ```asm
     MOV A, #10h        ; Move o valor hexadecimal 10 para o Acumulador (A)
```

    
    
  **ADD e SUBB:** 
    Operações aritméticas de soma e subtração. ADD soma valores e SUBB subtrai.
   ```asm
     MOV A, #05h       ; Mover o valor 5 para o Acumulador (A)
     ADD A, #03h       ; Adicionar 3 ao valor em A (A = 5 + 3 = 8)
     MOV B, #02h       ; Move o valor 2 para o registrador B
     SUBB A, B         ; Subtrai o valor de B em A e Armazena em A (A = 8 - 2 = 6)
   ```

  
  **INC e DEC:** 
    Instruções de incremento e decremento que aumentam ou diminuem o valor em um registrador.
  ```asm
    MOV R1, #01h      ; Mover o valor hexadecimal 01 para o registrador R1
    INC R1            ; Incrementa o valor em R1 (R1 = 02h)
    MOV 40h, #01h     ; Move o valor hexadecimal 01 para o endereço de memória 40h
    DEC 40h           ; Decrementa o valor na posição de memória 40h (40h = 00h)
```

    

## Modos de Endereçamento


  **Direto:**
    A instrução acessa diretamente o endereço de memória especificado.
  ```asm
    MOV A, 30h   ; Move o valor do endereço 30h para o acumulador.
```



  **Indireto:** 
    Um registrador aponta para o endereço de memória desejado.
  ```asm
    MOV R0, #30h     ; Carregar o endereço 30h no registrador R0 (Apontador)
    MOV A, @R0       ; Mover o valor do endereço de memória apontado por R0 para o Acumulador (A)
```


## Controlo de Fluxo


  **Instruções de Salto:** 


  ***JMP (Salto Incondicional)***
      O JMP permite que o fluxo do programa salte incondicionalmente para a LABEL indicada.
  ```asm
      JMP LABEL_CRIADA     ; Salta para a END_LABEL
      ...
      LABEL_CRIADA:        ; Destino do salto
  ```

    
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
```


## Entradas e Saídas (I/O)

 **PORT0 (P0.0 a P0.6):** Esta porta é utilizada para o teclado númerico de 4x4. O P0.7 não faz parte no teclado númerico.
 
 **PORT1 (P1.0 a P1.7):** Esta porta é utilizada para controlar o Display de 7 Segmentos e os LEDs. 
 
 **PORT2 (P2.0 a P2.7):** Esta porta é utilizada para ler sinais analógicos, convertendo-os em digitais (ADC). 

 **PORT0.7 (P0.7):** Este pino é o Chip Select (CS) do Decoder, é necessário ativa-lo para utilizar o Display de 7 Segmentos.

 **PORT3.0 (P3.0):** Este pino é utilizado para controlar o estado de o motor, representa o primeiro Bit de Controlo. 

 **PORT3.1 (P3.1):** Semelhante ao P3.0, serve como segundo Bit de Controlo para o motor.

 **PORT3.2 (P3.2):** Este pino é utilizado para interrupções do ADC, quando uma conversão ADC é concluída, ele gera uma interrupção, informado que os dados estão prontos para leitura.

 **PORT3.3 (P3.3):** Este pino é uma entrada do Decoder (A0), utilizar para selecionar qual Display de 7 Segmentos deve ser ativado.

 **PORT3.4 (P3.4):** Assim como P3.3, este pino é também uma entrada do Decoder, funciona em conjunto com P3.3 para selecionar um dos Displays de 7 Segmentos.

 **PORT3.5 (P3.5):** Este pino é utilizado para ler dados do sensor do motor, fornece informação sobre velocidade do motor.

 **PORT3.6 (P3.6):** Este pino é utilizado para escrever dados no ADC.

 **PORT3.7 (P3.7):** Este pino serve para leitura de dados do ADC, fornece o valor digital da conversão analógica.

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

; Definir com 0 a coluna que iremos utilizar (col1) e verifica as linhas que estão pressionadas desta coluna (lin1, lin2, lin3, lin4).
clr col1
setb col2
setb col3
       
JB lin1
JB lin2
JB lin3
JB lin4

```

### Display de 7 Segmentos 

#### 1º: Ativar o Chip Select (CS) do Decoder no pino P0.7.
 <img src="https://i.imgur.com/B49ZFZV.png" alt="CS" width="450" height="370" />
 
```asm

 CLR P0.7   ; Desativar o Pino P0.7 (CS do Decoder)
 SETB P0.7  ; Ativar o Pino P0.7 (CS do Decoder)

```

 
 
#### 2º: Selecionar o display desejado utilizando os pinos A1 e A0 (P3.4 e P3.3).
  <img src="https://i.imgur.com/yzGgWLo.png" alt="A1A2" width="450" height="350" />
  
```asm
 ; Neste exemplo estamos a definir o uso do Display 0 

 CLR P3.4   ; A1 = 0 
 CLR P3.3   ; A0 = 0

```

  
 
#### 3º: Escrever os números nos displays utilizando os pinos P1.0 a P1.7 que estão conectados aos segmentos dos displays.**
  <img src="https://i.imgur.com/zyGJjRj.png" alt="LEDS" width="450" height="350" />
  
  **No caso dos Displays de 7 segmentos é cátodo comum, significa que para ativar um segmento é feito com CLR, enquanto que para desativar é feito com SETB.**
  
```asm

; Neste exemplo estamos da definir o número 1 nos segmentos

 SETB P1.0         ; Desativa o segmento A
 CLR P1.1         ; Ativa o segmento B
 CLR P1.2         ; Ativa o segmento C
 SETB P1.3         ; Desativa o segmento D
 SETB P1.4         ; Desativa o segmento E
 SETB P1.5         ; Desativa o segmento F
 SETB P1.6          ; Desativa o segmento G
 SETB P1.7          ; Desativa o segmento do Ponto Decimal

```



    

