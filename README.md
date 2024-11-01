<div align="center" style="text-align: center">
<img src="https://dapj.org/wp-content/uploads/2015/04/edsim51-8051-Simulator.png" alt="EDSIM51 Logo"/>
<h3>Projetos em Assembly no EDSIM51</h3>
<p>
  Projetos práticos para a disciplina de Arquitetura e Sistemas de Computadores, no curso de Sistemas Eletrónicos e Computadores. Desenvolvidos diversos projetos que exploram a interação com dispositivos de entrada e saída, utilizando linguagem Assembly no simulador EDSIM51. 
</p>
</div>

# Conteúdo

- [Resumo](#Resumo)
- [Software](#Software)
- [Diagrama](#Diagrama)
- [Projetos](#Projetos)
- [Conceitos] (#Conceitos)


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
     
**Registrador B:** 
    Um registrador secundário utilizado para multiplicação e divisão, trabalha junto com o Acumulador (A) nessas operações.

**Registradores (R0 a R7):** 

  ***Funções do R0 e R1***
       Os registradores R0 e R1 tem uma função específica, eles funcionam de forma semelhante a Apontadores em Linguagem C. 
       Por exemplo, podemos armazenar um endereço específico de memória RAM, nos registradores R0 ou R1.
       
       MOV R0, #30h         ; Endereço da memória 30h para o Registrador R0
       MOV A, #05h          ; Mover o valor 5 para o Acumulador
       MOV @R0, A           ; Armazena o valor 5 na posição de memória 30h (endereço apontado por R0)


  ***Funções dos R2 a R7*** 
      Os Registradores de R2 a R7 são utilizados para armazenar dados temporários, contadores em loops e outras variáveis.


    

