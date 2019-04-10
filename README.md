# Why Bandeirantes?

Bandeirantes é a denominação dada aos sertanistas do período colonial, que, a partir do início do século XVI, penetraram no interior da América do Sul em busca de riquezas minerais, sobretudo o ouro e a prata, abundantes na América espanhola. Contribuíram, em grande parte, para a expansão territorial do Brasil além dos limites impostos pelo Tratado de Tordesilhas, ocupando o Centro Oeste e o Sul do Brasil. E foram os descobridores do ouro em Minas Gerais, Goiás e Mato Grosso.
Fonte: [wikipedia](https://pt.wikipedia.org/wiki/Bandeirantes)

# Context
Um conjunto de sondas foi enviado pela NASA à Marte e irá pousar num planalto. Esse planalto, que curiosamente é retangular, deve ser explorado pelas sondas para que suas câmeras embutidas consigam ter uma visão completa da área e enviar as imagens de volta para a Terra.

A posição e direção de uma sonda são representadas por uma combinação de coordenadas x-y e uma letra representando a direção cardinal para qual a sonda aponta, seguindo a rosa dos ventos em inglês.

O planalto é dividido numa malha para simplificar a navegação. Um exemplo de posição seria (0, 0, N), que indica que a sonda está no canto inferior esquerdo e apontando para o Norte.

Para controlar as sondas, a NASA envia uma simples sequência de letras. As letras possíveis são "L", "R" e "M". Destas, "L" e "R" fazem a sonda virar 90 graus para a esquerda ou direita, respectivamente, sem mover a sonda. "M" faz com que a sonda mova-se para a frente um ponto da malha, mantendo a mesma direção.

Nesta malha o ponto ao norte de (x,y) é sempre (x, y+1).

Você deve fazer um programa que processe uma série de instruções enviadas para as sondas que estão explorando este planalto.

O formato da entrada e saída deste programa segue abaixo.

A forma de entrada e saída dos dados fica à sua escolha.

## Input
5 5

1 2 N

LMLMLMLMM

3 3 E

MMRMMRMRRM

## Ouput
1 3 N

5 1 E

## Tests

$ mix test

## Build

$ mix escript.build

## Run

$ ./bandeirantes

```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/bandeirantes](https://hexdocs.pm/bandeirantes).

