Algoritmo "MuNu Cassino"
//
//
// Descrição   : Munu cassino é um programa onde tem o objetivo de fazer você apostar :p
// Autor(a)    : Samuel Montez e Manuela Correia
// Data atual  : 13/11/2025
Var
   // Seção de Declarações das variáveis

   controle, controle2, asteristico, contJogada, i, j, contadorJ, espaco, espaco_final, m, n : inteiro // Controle
   qnt_din, maisDin : real // Dinheiro
   nome, novo_nome : caracter // nome
   resposta : inteiro // Variavel que sempre checara a resposta do usuario, global
   cont, contBingo : inteiro // Contador de tempo
   resposta_menu_principal, resposta_jogo : inteiro

   // Jogos
   JogoRodando : inteiro

   // 21
   resposta_menu : inteiro
   cartas, cartasop : vetor[1..10] de inteiro
   resultado: vetor[1..100] de inteiro
   quantidade : inteiro // Variavel que controla a quantidade de vezes que jogou
   parar, pararop, jogando, jogada : inteiro
   aposta : real
   somac, somaop : inteiro

   // Cavalos
   cavalo, Rcavalo, partidaC : inteiro
   resultado_cavalos, numero_cavalo : vetor[1..100] de inteiro

   // Bingo
   Cartela : vetor[1..5,1..5] de inteiro // Cartela principal
   partidaB, numero_bingo, tent, numAl, ganhou : inteiro
   resultado_bingo : vetor[1..100] de inteiro
   verif, verifi : inteiro // Variaveis para verificacao
   enter : inteiro // nadinha :p so pra esperar o usuario clicar enter
   num_sort : vetor[1..75] de inteiro
   cont_vitoria, help, help2, horizontal, coluna, vitoria, k : inteiro   //variavel pra ajudar na contagem da diagonal
   multiplicador : real // multiplicador dependendo de quantas laterais ele fizer
   jogando2 : inteiro // so p ver se o usuario ja comecou a jogar

   // Cartas
   cartaPC, carta, poema, numcarta : inteiro

   // LOGO


procedimento Logo()
inicio
   n <- 4
   asteristico <- 1
   para i de 1 ate 5 faca
      para m de 1 ate n faca
         escreva (" ")
      fimpara
      para j de 1 ate asteristico faca

         escreva ("*")

      fimpara
      escreval (" ")
      n <- n - 1
      asteristico <- asteristico + 2
   fimpara
   Escreval (" ")

fimprocedimento

procedimento fimjogo()
inicio
   Se qnt_din <= 0 entao
      escreva ("Sem nenhum dinheiro para apostar. ")
   fimse
   Escreval ("Adeus ", nome, "! Você saiu com: ", qnt_din, " de dinheiro! Volte sempre :)")
fimalgoritmo
fimprocedimento

// ENTRADA DE USUARIO


procedimento entrada_user()
inicio
   Logo()
   repita

      Escreva ("Bem vindo ao MuNu Cassino! Qual é o seu saldo? ")
      leia (qnt_din)
      Se qnt_din <= 0 entao
         escreval ("Erro; quantidade inválida! Tente novamente.")
      fimse
   ate qnt_din > 0
   Escreval ("Muito bem! Agora, qual é o seu nome? ")
   leia (nome)
   limpatela



   // VERIFICAR SALDO


fimprocedimento

Procedimento verificar_saldo()
inicio
   Escreval ("Total do saldo atual: ", qnt_din)
   Menu()

fimprocedimento



// ACRESCENTAR DINHEIRO



Procedimento Acrescentar_dinheiro()
inicio
   repita
      Escreval ("Qual quantia você gostaria de adicionar? ")
      leia (maisDin)
      se maisDin > 0 entao
         Escreval ("Saldo adicionado!")
         controle2 <- 1
         qnt_din <- qnt_din + maisDin
      senao
         Escreval ("Erro! Quantidade de dinheiro colocada inválida! Tente novamente. ")
      fimse
   ate controle2 = 1
   controle2 <- 0
fimprocedimento

Procedimento mudar_nome()
inicio
   Escreval ("Qual seu novo nome? ")
   leia (novo_nome)
   se novo_nome = nome entao
      Escreval ("Mesmo nome inserido! Nenhuma alteração feita. ")
   senao
      nome <- novo_nome
   fimse
fimprocedimento



// MENU JOGO



Procedimento MenuJogo()
inicio
   Logo()
   resposta_menu <- 0
   Escreval ("Muito bem, vamos lá! ")
   Escreval ("Qual jogo você gostaria de jogar? ")
   Escreval ("1. 21 ")
   Escreval ("2. Cavalos ")
   Escreval ("3. Bingo ")
   Escreval ("4. Adivinhe a carta ")
   Escreval ("5. Voltar")
   leia (resposta_menu)

   Se resposta_menu = 1 entao
      VinteUm()
   fimse
   Se resposta_menu = 2 entao
      Cavalos()
   fimse
   Se resposta_menu = 3 entao
      Bingo()
   fimse
   Se resposta_menu = 4 entao
      Cartinhas()
   fimse
   Se resposta_menu = 5 entao
      Menu()
   fimse
   limpatela
fimprocedimento


// Cartas


procedimento Cartinhas()
inicio
   resposta <- 0
   JogoRodando <- 1
   i <- 1
   j <- 1
   enquanto JogoRodando = 1 faca
      jogando2 <- 1
      resposta_jogo <- 0

      Escreval ("       Advinhe a carta         ")
      Escreval ("O que deseja fazer? ")
      Escreval ("1. Jogar ")
      Escreval ("2. Instruções ")
      Escreval ("3. Ver cartas ")
      Escreval ("4. Voltar ")
      Leia (resposta_jogo)

      se resposta_jogo = 1 entao
         cartaPC <- 0
         carta <- 0
         poema <- 0
         numcarta <- 0
         i <- 0

         se qnt_din <= 0 entao
            fimjogo()
         fimse
         escreval ("Quanto de dinheiro você quer apostar? ")
         leia (aposta)
         Se (aposta < 0) ou (qnt_din < aposta) entao
            repita
               Escreval ("Erro, quantidade invalida, tente novamente! ")
               leia (aposta)
            ate (aposta > 0) e (qnt_din >= aposta)
         fimse

         qnt_din <- qnt_din - aposta


         repita
            cartaPC <- randi(25)
         ate cartaPC <> 0


         repita
            poema <- randi(4)
         ate poema <> 0


         Se cartaPC <= 6 entao
            numcarta <- cartaPC
         senao
            Se cartaPC <= 12 entao
               numcarta <- cartaPC - 6
            senao
               Se cartaPC <= 18 entao
                  numcarta <- cartaPC - 12
               senao
                  Se cartaPC <= 24 entao
                     numcarta <- cartaPC - 18
                  fimse
               fimse
            fimse
         fimse

         Se cartaPC <= 6 entao// copas
            Se poema = 1 entao
               Escreva ("Sou indestrutível como um amor. ")
            fimse

            Se poema = 2 entao
               Escreva ("Sou frágil como um instante. ")
            fimse

            Se poema = 3 entao
               Escreva ("Sou complexo como o âmago dos amores. ")
            Fimse
         fimse


         Se (cartaPC <= 12) e (cartaPC > 6) entao // espadas
            Se poema = 1 entao
               Escreva ("Sou imprevisível como o ardor da guerra. ")
            fimse
            Se poema = 2 entao
               Escreva ("Sou sábio como a mais usada espada ")
            fimse

            Se poema = 3 entao
               Escreva ("Sou ambicioso como um recém coroado imperador. ")
            Fimse
         fimse



         Se (cartaPC <= 18) e (cartaPC > 12) entao      // ouro
            Se poema = 1 entao
               Escreva ("Sou brilhante como o preservado ouro. ")
            fimse

            Se poema = 2 entao
               Escreva ("Sou flexível como o mais leve dos metais. ")
            fimse

            Se poema = 3 entao
               Escreva ("Sou acolhedor como o queimor do sol. ")
            Fimse
         fimse



         Se (cartaPC <= 24) e (cartaPC > 18) entao // paus
            Se poema = 1 entao
               Escreva ("Sou estável como uma rígida rocha. ")
            fimse

            Se poema = 2 entao
               Escreva ("Sou sútil como as brisas crepusculares ")
            fimse

            Se poema = 3 entao
               Escreva ("Sou belo como uma inexplorada floresta. ")
            Fimse
         fimse

         Se numcarta <= 3 entao
            Escreva (" Sou menor ou igual a 3! ")
         fimse

         se numcarta > 3 entao
            Escreva (" Sou maior que 3! ")
         fimse

         Escreval (" ")
         Escreval ("Quem eu sou? ")
         Escreval ("    Copas        Espadas         Ouros            Paus                     ")
         Escreval ("                                                                  ")
         Escreval ("1 : 1 S2         7:  1 ^        13: 1 /\        19: 1 ||                   ")
         Escreval ("                                                                  ")
         Escreval ("2 : 2 S2         8:  2 ^        14: 2 /\        20: 2 ||                   ")
         Escreval ("                                                                  ")
         Escreval ("3 : 3 S2         9:  3 ^        15: 3 /\        21: 3 ||                   ")
         Escreval ("                                                                  ")
         Escreval ("4 : 4 S2         10: 4 ^        16: 4 /\        22: 4 ||                   ")
         Escreval ("                                                                  ")
         Escreval ("5 : 5 S2         11: 5 ^        17: 5 /\        23: 5 ||                   ")
         Escreval ("                                                                  ")
         Escreval ("6 : 6 S2         12: 6 ^        18: 6 /\        24: 6 ||                   ")
         leia (carta)

         Escreval (" ")
         Escreval ("Verificando... ")
         Para i de 1 ate 25000 faca // timer segundos
            cont <- cont + 1
         fimpara

         Se carta = cartaPC entao
            Escreval ("Parabens, você acertou! Sua carta:")
            aposta <- aposta * 1.5
            qnt_din <- qnt_din + aposta
            aposta <- 0
         senao
            Escreval ("Você perdeu... que pena! Carta certa: ")
            aposta <- 0
         fimse
         se cartaPC = 1 entao
            Escreval ("                       ")
            Escreval ("      COPAS            ")
            Escreval ("  _______________      ")
            Escreval (" /               \     ")
            Escreval (" | 1 S2          |     ")
            Escreval (" |               |     ")
            Escreval (" |               |     ")
            Escreval (" |     _   _     |     ")
            Escreval (" |    / \_/ \    |     ")
            Escreval (" |    \     /    |     ")
            Escreval (" |     \   /     |     ")
            Escreval (" |      \_/      |     ")
            Escreval (" |               |     ")
            Escreval (" |               |     ")
            Escreval (" |          1 S2 |     ")
            Escreval (" \_______________/     ")
         fimse

         se cartaPC = 2 entao
            Escreval ("                       ")
            Escreval ("      COPAS            ")
            Escreval ("  _______________      ")
            Escreval (" /               \     ")
            Escreval (" | 2 S2          |     ")
            Escreval (" |               |     ")
            Escreval (" |               |     ")
            Escreval (" |     _   _     |     ")
            Escreval (" |    / \_/ \    |     ")
            Escreval (" |    \     /    |     ")
            Escreval (" |     \   /     |     ")
            Escreval (" |      \_/      |     ")
            Escreval (" |               |     ")
            Escreval (" |               |     ")
            Escreval (" |          2 S2 |     ")
            Escreval (" \_______________/     ")
         fimse

         se cartaPC = 3 entao
            Escreval ("                       ")
            Escreval ("      COPAS            ")
            Escreval ("  _______________      ")
            Escreval (" /               \     ")
            Escreval (" | 3 S2          |     ")
            Escreval (" |               |     ")
            Escreval (" |               |     ")
            Escreval (" |     _   _     |     ")
            Escreval (" |    / \_/ \    |     ")
            Escreval (" |    \     /    |     ")
            Escreval (" |     \   /     |     ")
            Escreval (" |      \_/      |     ")
            Escreval (" |               |     ")
            Escreval (" |               |     ")
            Escreval (" |          3 S2 |     ")
            Escreval (" \_______________/     ")
         fimse

         se cartaPC = 4 entao
            Escreval ("                       ")
            Escreval ("      COPAS            ")
            Escreval ("  _______________      ")
            Escreval (" /               \     ")
            Escreval (" | 4 S2          |     ")
            Escreval (" |               |     ")
            Escreval (" |               |     ")
            Escreval (" |     _   _     |     ")
            Escreval (" |    / \_/ \    |     ")
            Escreval (" |    \     /    |     ")
            Escreval (" |     \   /     |     ")
            Escreval (" |      \_/      |     ")
            Escreval (" |               |     ")
            Escreval (" |               |     ")
            Escreval (" |          4 S2 |     ")
            Escreval (" \_______________/     ")
         fimse

         se cartaPC = 5 entao
            Escreval ("                       ")
            Escreval ("      COPAS            ")
            Escreval ("  _______________      ")
            Escreval (" /               \     ")
            Escreval (" | 5 S2          |     ")
            Escreval (" |               |     ")
            Escreval (" |               |     ")
            Escreval (" |     _   _     |     ")
            Escreval (" |    / \_/ \    |     ")
            Escreval (" |    \     /    |     ")
            Escreval (" |     \   /     |     ")
            Escreval (" |      \_/      |     ")
            Escreval (" |               |     ")
            Escreval (" |               |     ")
            Escreval (" |          5 S2 |     ")
            Escreval (" \_______________/     ")
         fimse

         se cartaPC = 6 entao
            Escreval ("                       ")
            Escreval ("      COPAS            ")
            Escreval ("  _______________      ")
            Escreval (" /               \     ")
            Escreval (" | 6 S2          |     ")
            Escreval (" |               |     ")
            Escreval (" |               |     ")
            Escreval (" |     _   _     |     ")
            Escreval (" |    / \_/ \    |     ")
            Escreval (" |    \     /    |     ")
            Escreval (" |     \   /     |     ")
            Escreval (" |      \_/      |     ")
            Escreval (" |               |     ")
            Escreval (" |               |     ")
            Escreval (" |          6 S2 |     ")
            Escreval (" \_______________/     ")
         fimse

         se cartaPC = 7 entao
            Escreval ("                       ")
            Escreval ("      Espadas          ")
            Escreval ("  _______________      ")
            Escreval (" /               \     ")
            Escreval (" | 1 ^           |     ")
            Escreval (" |               |     ")
            Escreval (" |               |     ")
            Escreval (" |      /\       |     ")
            Escreval (" |     /  \      |     ")
            Escreval (" |    /    \     |     ")
            Escreval (" |   /      \    |     ")
            Escreval (" |   \__  __/    |     ")
            Escreval (" |     /  \      |     ")
            Escreval (" |     w  w      |     ")
            Escreval (" |          1 ^  |     ")
            Escreval (" \_______________/     ")
         fimse

         se cartaPC = 8 entao
            Escreval ("                       ")
            Escreval ("      Espadas          ")
            Escreval ("  _______________      ")
            Escreval (" /               \     ")
            Escreval (" | 2 ^           |     ")
            Escreval (" |               |     ")
            Escreval (" |               |     ")
            Escreval (" |      /\       |     ")
            Escreval (" |     /  \      |     ")
            Escreval (" |    /    \     |     ")
            Escreval (" |   /      \    |     ")
            Escreval (" |   \__  __/    |     ")
            Escreval (" |     /  \      |     ")
            Escreval (" |     w  w      |     ")
            Escreval (" |          2 ^  |     ")
            Escreval (" \_______________/     ")
         fimse

         se cartaPC = 9 entao
            Escreval ("                       ")
            Escreval ("      Espadas          ")
            Escreval ("  _______________      ")
            Escreval (" /               \     ")
            Escreval (" | 3 ^           |     ")
            Escreval (" |               |     ")
            Escreval (" |               |     ")
            Escreval (" |      /\       |     ")
            Escreval (" |     /  \      |     ")
            Escreval (" |    /    \     |     ")
            Escreval (" |   /      \    |     ")
            Escreval (" |   \__  __/    |     ")
            Escreval (" |     /  \      |     ")
            Escreval (" |     w  w      |     ")
            Escreval (" |          3 ^  |     ")
            Escreval (" \_______________/     ")
         fimse

         se cartaPC = 10 entao
            Escreval ("                       ")
            Escreval ("      Espadas          ")
            Escreval ("  _______________      ")
            Escreval (" /               \     ")
            Escreval (" | 4 ^           |     ")
            Escreval (" |               |     ")
            Escreval (" |               |     ")
            Escreval (" |      /\       |     ")
            Escreval (" |     /  \      |     ")
            Escreval (" |    /    \     |     ")
            Escreval (" |   /      \    |     ")
            Escreval (" |   \__  __/    |     ")
            Escreval (" |     /  \      |     ")
            Escreval (" |     w  w      |     ")
            Escreval (" |          4 ^  |     ")
            Escreval (" \_______________/     ")
         fimse

         se cartaPC = 11 entao
            Escreval ("                       ")
            Escreval ("      Espadas          ")
            Escreval ("  _______________      ")
            Escreval (" /               \     ")
            Escreval (" | 5 ^           |     ")
            Escreval (" |               |     ")
            Escreval (" |               |     ")
            Escreval (" |      /\       |     ")
            Escreval (" |     /  \      |     ")
            Escreval (" |    /    \     |     ")
            Escreval (" |   /      \    |     ")
            Escreval (" |   \__  __/    |     ")
            Escreval (" |     /  \      |     ")
            Escreval (" |     w  w      |     ")
            Escreval (" |          5 ^  |     ")
            Escreval (" \_______________/     ")
         fimse

         se cartaPC = 12 entao
            Escreval ("                       ")
            Escreval ("      Espadas          ")
            Escreval ("  _______________      ")
            Escreval (" /               \     ")
            Escreval (" | 6 ^           |     ")
            Escreval (" |               |     ")
            Escreval (" |               |     ")
            Escreval (" |      /\       |     ")
            Escreval (" |     /  \      |     ")
            Escreval (" |    /    \     |     ")
            Escreval (" |   /      \    |     ")
            Escreval (" |   \__  __/    |     ")
            Escreval (" |     /  \      |     ")
            Escreval (" |     w  w      |     ")
            Escreval (" |          6 ^  |     ")
            Escreval (" \_______________/     ")
         fimse

         Se cartaPC = 13 entao
            Escreval ("                       ")
            Escreval ("      Ouros            ")
            Escreval ("  _______________      ")
            Escreval (" /               \     ")
            Escreval (" | 1 /\          |     ")
            Escreval (" |               |     ")
            Escreval (" |      /\       |     ")
            Escreval (" |     /  \      |     ")
            Escreval (" |    /    \     |     ")
            Escreval (" |    \    /     |     ")
            Escreval (" |     \  /      |     ")
            Escreval (" |      \/       |     ")
            Escreval (" |               |     ")
            Escreval (" |               |     ")
            Escreval (" |          1 /\ |     ")
            Escreval (" \_______________/     ")
         fimse

         se cartaPC = 14 entao
            Escreval ("                       ")
            Escreval ("      Ouros            ")
            Escreval ("  _______________      ")
            Escreval (" /               \     ")
            Escreval (" | 2 /\          |     ")
            Escreval (" |               |     ")
            Escreval (" |      /\       |     ")
            Escreval (" |     /  \      |     ")
            Escreval (" |    /    \     |     ")
            Escreval (" |    \    /     |     ")
            Escreval (" |     \  /      |     ")
            Escreval (" |      \/       |     ")
            Escreval (" |               |     ")
            Escreval (" |               |     ")
            Escreval (" |          2 /\ |     ")
            Escreval (" \_______________/     ")
         fimse

         se cartaPC = 15 entao
            Escreval ("                       ")
            Escreval ("      Ouros            ")
            Escreval ("  _______________      ")
            Escreval (" /               \     ")
            Escreval (" | 3 /\          |     ")
            Escreval (" |               |     ")
            Escreval (" |      /\       |     ")
            Escreval (" |     /  \      |     ")
            Escreval (" |    /    \     |     ")
            Escreval (" |    \    /     |     ")
            Escreval (" |     \  /      |     ")
            Escreval (" |      \/       |     ")
            Escreval (" |               |     ")
            Escreval (" |               |     ")
            Escreval (" |          3 /\ |     ")
            Escreval (" \_______________/     ")
         fimse

         se cartaPC = 16 entao
            Escreval ("                       ")
            Escreval ("      Ouros            ")
            Escreval ("  _______________      ")
            Escreval (" /               \     ")
            Escreval (" | 4 /\          |     ")
            Escreval (" |               |     ")
            Escreval (" |      /\       |     ")
            Escreval (" |     /  \      |     ")
            Escreval (" |    /    \     |     ")
            Escreval (" |    \    /     |     ")
            Escreval (" |     \  /      |     ")
            Escreval (" |      \/       |     ")
            Escreval (" |               |     ")
            Escreval (" |               |     ")
            Escreval (" |          4 /\ |     ")
            Escreval (" \_______________/     ")
         fimse

         se cartaPC = 17 entao
            Escreval ("                       ")
            Escreval ("      Ouros            ")
            Escreval ("  _______________      ")
            Escreval (" /               \     ")
            Escreval (" | 5 /\          |     ")
            Escreval (" |               |     ")
            Escreval (" |      /\       |     ")
            Escreval (" |     /  \      |     ")
            Escreval (" |    /    \     |     ")
            Escreval (" |    \    /     |     ")
            Escreval (" |     \  /      |     ")
            Escreval (" |      \/       |     ")
            Escreval (" |               |     ")
            Escreval (" |               |     ")
            Escreval (" |          5 /\ |     ")
            Escreval (" \_______________/     ")
         fimse

         se cartaPC = 18 entao
            Escreval ("                       ")
            Escreval ("       Ouros           ")
            Escreval ("  _______________      ")
            Escreval (" /               \     ")
            Escreval (" | 6 /\          |     ")
            Escreval (" |               |     ")
            Escreval (" |      /\       |     ")
            Escreval (" |     /  \      |     ")
            Escreval (" |    /    \     |     ")
            Escreval (" |    \    /     |     ")
            Escreval (" |     \  /      |     ")
            Escreval (" |      \/       |     ")
            Escreval (" |               |     ")
            Escreval (" |               |     ")
            Escreval (" |          6 /\ |     ")
            Escreval (" \_______________/     ")
         fimse

         se cartaPC = 19 entao
            Escreval ("                       ")
            Escreval ("       Paus            ")
            Escreval ("  _______________      ")
            Escreval (" /               \     ")
            Escreval (" | 1 ||          |     ")
            Escreval (" |               |     ")
            Escreval (" |               |     ")
            Escreval (" |       _       |     ")
            Escreval (" |     _/ \_     |     ")
            Escreval (" |    /     \    |     ")
            Escreval (" |    \__ __/    |     ")
            Escreval (" |      /_\      |     ")
            Escreval (" |               |     ")
            Escreval (" |               |     ")
            Escreval (" |          1 || |     ")
            Escreval (" \_______________/     ")
         fimse

         se cartaPC = 20 entao
            Escreval ("                       ")
            Escreval ("       Paus            ")
            Escreval ("  _______________      ")
            Escreval (" /               \     ")
            Escreval (" | 2 ||          |     ")
            Escreval (" |               |     ")
            Escreval (" |               |     ")
            Escreval (" |       _       |     ")
            Escreval (" |     _/ \_     |     ")
            Escreval (" |    /     \    |     ")
            Escreval (" |    \__ __/    |     ")
            Escreval (" |      /_\      |     ")
            Escreval (" |               |     ")
            Escreval (" |               |     ")
            Escreval (" |          2 || |     ")
            Escreval (" \_______________/     ")
         fimse

         se cartaPC = 21 entao
            Escreval ("                       ")
            Escreval ("       Paus            ")
            Escreval ("  _______________      ")
            Escreval (" /               \     ")
            Escreval (" | 3 ||          |     ")
            Escreval (" |               |     ")
            Escreval (" |               |     ")
            Escreval (" |       _       |     ")
            Escreval (" |     _/ \_     |     ")
            Escreval (" |    /     \    |     ")
            Escreval (" |    \__ __/    |     ")
            Escreval (" |      /_\      |     ")
            Escreval (" |               |     ")
            Escreval (" |               |     ")
            Escreval (" |          3 || |     ")
            Escreval (" \_______________/     ")
         fimse

         se cartaPC = 22 entao
            Escreval ("                       ")
            Escreval ("       Paus            ")
            Escreval ("  _______________      ")
            Escreval (" /               \     ")
            Escreval (" | 4 ||          |     ")
            Escreval (" |               |     ")
            Escreval (" |               |     ")
            Escreval (" |       _       |     ")
            Escreval (" |     _/ \_     |     ")
            Escreval (" |    /     \    |     ")
            Escreval (" |    \__ __/    |     ")
            Escreval (" |      /_\      |     ")
            Escreval (" |               |     ")
            Escreval (" |               |     ")
            Escreval (" |          4 || |     ")
            Escreval (" \_______________/     ")
         fimse

         se cartaPC = 23 entao
            Escreval ("                       ")
            Escreval ("       Paus            ")
            Escreval ("  _______________      ")
            Escreval (" /               \     ")
            Escreval (" | 5 ||          |     ")
            Escreval (" |               |     ")
            Escreval (" |               |     ")
            Escreval (" |       _       |     ")
            Escreval (" |     _/ \_     |     ")
            Escreval (" |    /     \    |     ")
            Escreval (" |    \__ __/    |     ")
            Escreval (" |      /_\      |     ")
            Escreval (" |               |     ")
            Escreval (" |               |     ")
            Escreval (" |          5 || |     ")
            Escreval (" \_______________/     ")
         fimse

         se cartaPC = 24 entao
            Escreval ("                       ")
            Escreval ("       Paus            ")
            Escreval ("  _______________      ")
            Escreval (" /               \     ")
            Escreval (" | 6 ||          |     ")
            Escreval (" |               |     ")
            Escreval (" |               |     ")
            Escreval (" |       _       |     ")
            Escreval (" |     _/ \_     |     ")
            Escreval (" |    /     \    |     ")
            Escreval (" |    \__ __/    |     ")
            Escreval (" |      /_\      |     ")
            Escreval (" |               |     ")
            Escreval (" |               |     ")
            Escreval (" |          6 || |     ")
            Escreval (" \_______________/     ")
         fimse

      fimse

      se resposta_jogo = 2 entao
         Escreval ("Objetivo ")
         Escreval ("Descobrir qual é a carta misteriosa usando apenas as pistas que o cassino te dá.                     ")
         Escreval ("Cada vez que jogar ira apresentar uma frase enigmática que indica:                     ")
         Escreval ("O naipe da carta                     ")
         Escreval ("O valor da carta                     ")
         Escreval ("Você deverá interpretar as pistas e adivinhar corretamente.                     ")
         Escreval ("                     ")
         Escreval ("Como funciona o jogo                     ")
         Escreval ("O sistema escolhe uma carta aleatória (valor + naipe).                     ")
         Escreval ("Ele cria uma pista poética baseada nessa carta.                     ")
         Escreval ("Você recebe a dica e deve tentar adivinhar.                     ")
         Escreval ("                     ")
         Escreval ("Exemplo:                     ")
         Escreval ("                     ")
         Escreval ("Meu amor é incondicional e sou maior que cinco!                   ")
         Escreval ("Naipe: S2 Coração                     ")
         Escreval ("Numero: maior que 5                     ")
         Escreval ("Pode ser: 6 S2, 7 S2, 8 S2, 9 S2, 10 S2                     ")
         Escreval ("                     ")
         Escreval ("Naipes e seu estilo de pista                     ")
         Escreval ("                     ")
         Escreval ("S2 Copas                     ")
         Escreval ("Pistas relacionadas a amor, paixão, sentimentos.                     ")
         Escreval ("                     ")
         Escreval ("^ Espadas                     ")
         Escreval ("Pistas de conflitos, força, coragem, perigo, batalha.                     ")
         Escreval ("                     ")
         Escreval ("/\ Ouros                     ")
         Escreval ("Pistas sobre riqueza, brilho, valor ou sorte.                     ")
         Escreval ("                     ")
         Escreval ("|| Paus                     ")
         Escreval ("Pistas sobre natureza, madeira, energia ou crescimento.                     ")
         Escreval ("                     ")
      fimse

      se resposta_jogo = 3 entao
         Escreval ("  _______________      ")
         Escreval (" /               \     ")
         Escreval (" | 1 S2          |     ")
         Escreval (" |               |     ")
         Escreval (" |               |     ")
         Escreval (" |     _   _     |     ")
         Escreval (" |    / \_/ \    |     ")
         Escreval (" |    \     /    |     ")
         Escreval (" |     \   /     |     ")
         Escreval (" |      \_/      |     ")
         Escreval (" |               |     ")
         Escreval (" |               |     ")
         Escreval (" |          1 S2 |     ")
         Escreval (" \_______________/     ")

         Escreval ("  _______________      ")
         Escreval (" /               \     ")
         Escreval (" | 2 S2          |     ")
         Escreval (" |               |     ")
         Escreval (" |               |     ")
         Escreval (" |     _   _     |     ")
         Escreval (" |    / \_/ \    |     ")
         Escreval (" |    \     /    |     ")
         Escreval (" |     \   /     |     ")
         Escreval (" |      \_/      |     ")
         Escreval (" |               |     ")
         Escreval (" |               |     ")
         Escreval (" |          2 S2 |     ")
         Escreval (" \_______________/     ")

         Escreval ("  _______________      ")
         Escreval (" /               \     ")
         Escreval (" | 3 S2          |     ")
         Escreval (" |               |     ")
         Escreval (" |               |     ")
         Escreval (" |     _   _     |     ")
         Escreval (" |    / \_/ \    |     ")
         Escreval (" |    \     /    |     ")
         Escreval (" |     \   /     |     ")
         Escreval (" |      \_/      |     ")
         Escreval (" |               |     ")
         Escreval (" |               |     ")
         Escreval (" |          3 S2 |     ")
         Escreval (" \_______________/     ")


         Escreval ("  _______________      ")
         Escreval (" /               \     ")
         Escreval (" | 4 S2          |     ")
         Escreval (" |               |     ")
         Escreval (" |               |     ")
         Escreval (" |     _   _     |     ")
         Escreval (" |    / \_/ \    |     ")
         Escreval (" |    \     /    |     ")
         Escreval (" |     \   /     |     ")
         Escreval (" |      \_/      |     ")
         Escreval (" |               |     ")
         Escreval (" |               |     ")
         Escreval (" |          4 S2 |     ")
         Escreval (" \_______________/     ")


         Escreval ("  _______________      ")
         Escreval (" /               \     ")
         Escreval (" | 5 S2          |     ")
         Escreval (" |               |     ")
         Escreval (" |               |     ")
         Escreval (" |     _   _     |     ")
         Escreval (" |    / \_/ \    |     ")
         Escreval (" |    \     /    |     ")
         Escreval (" |     \   /     |     ")
         Escreval (" |      \_/      |     ")
         Escreval (" |               |     ")
         Escreval (" |               |     ")
         Escreval (" |          5 S2 |     ")
         Escreval (" \_______________/     ")

         Escreval ("  _______________      ")
         Escreval (" /               \     ")
         Escreval (" | 6 S2          |     ")
         Escreval (" |               |     ")
         Escreval (" |               |     ")
         Escreval (" |     _   _     |     ")
         Escreval (" |    / \_/ \    |     ")
         Escreval (" |    \     /    |     ")
         Escreval (" |     \   /     |     ")
         Escreval (" |      \_/      |     ")
         Escreval (" |               |     ")
         Escreval (" |               |     ")
         Escreval (" |          6 S2 |     ")
         Escreval (" \_______________/     ")


         Escreval (" ")
         Escreval ("       Espadas         ")


         Escreval ("  _______________      ")
         Escreval (" /               \     ")
         Escreval (" | 1 ^           |     ")
         Escreval (" |               |     ")
         Escreval (" |               |     ")
         Escreval (" |      /\       |     ")
         Escreval (" |     /  \      |     ")
         Escreval (" |    /    \     |     ")
         Escreval (" |   /      \    |     ")
         Escreval (" |   \__  __/    |     ")
         Escreval (" |     /  \      |     ")
         Escreval (" |     w  w      |     ")
         Escreval (" |          1 ^  |     ")
         Escreval (" \_______________/     ")

         Escreval ("  _______________      ")
         Escreval (" /               \     ")
         Escreval (" | 2 ^           |     ")
         Escreval (" |               |     ")
         Escreval (" |               |     ")
         Escreval (" |      /\       |     ")
         Escreval (" |     /  \      |     ")
         Escreval (" |    /    \     |     ")
         Escreval (" |   /      \    |     ")
         Escreval (" |   \__  __/    |     ")
         Escreval (" |     /  \      |     ")
         Escreval (" |     w  w      |     ")
         Escreval (" |          2 ^  |     ")
         Escreval (" \_______________/     ")

         Escreval ("  _______________      ")
         Escreval (" /               \     ")
         Escreval (" | 3 ^           |     ")
         Escreval (" |               |     ")
         Escreval (" |               |     ")
         Escreval (" |      /\       |     ")
         Escreval (" |     /  \      |     ")
         Escreval (" |    /    \     |     ")
         Escreval (" |   /      \    |     ")
         Escreval (" |   \__  __/    |     ")
         Escreval (" |     /  \      |     ")
         Escreval (" |     w  w      |     ")
         Escreval (" |          3 ^  |     ")
         Escreval (" \_______________/     ")

         Escreval ("  _______________      ")
         Escreval (" /               \     ")
         Escreval (" | 4 ^           |     ")
         Escreval (" |               |     ")
         Escreval (" |               |     ")
         Escreval (" |      /\       |     ")
         Escreval (" |     /  \      |     ")
         Escreval (" |    /    \     |     ")
         Escreval (" |   /      \    |     ")
         Escreval (" |   \__  __/    |     ")
         Escreval (" |     /  \      |     ")
         Escreval (" |     w  w      |     ")
         Escreval (" |          4 ^  |     ")
         Escreval (" \_______________/     ")

         Escreval ("  _______________      ")
         Escreval (" /               \     ")
         Escreval (" | 5 ^           |     ")
         Escreval (" |               |     ")
         Escreval (" |               |     ")
         Escreval (" |      /\       |     ")
         Escreval (" |     /  \      |     ")
         Escreval (" |    /    \     |     ")
         Escreval (" |   /      \    |     ")
         Escreval (" |   \__  __/    |     ")
         Escreval (" |     /  \      |     ")
         Escreval (" |     w  w      |     ")
         Escreval (" |          5 ^  |     ")
         Escreval (" \_______________/     ")

         Escreval ("  _______________      ")
         Escreval (" /               \     ")
         Escreval (" | 6 ^           |     ")
         Escreval (" |               |     ")
         Escreval (" |               |     ")
         Escreval (" |      /\       |     ")
         Escreval (" |     /  \      |     ")
         Escreval (" |    /    \     |     ")
         Escreval (" |   /      \    |     ")
         Escreval (" |   \__  __/    |     ")
         Escreval (" |     /  \      |     ")
         Escreval (" |     w  w      |     ")
         Escreval (" |          6 ^  |     ")
         Escreval (" \_______________/     ")

         Escreval (" ")
         Escreval ("       Ouros           ")

         Escreval ("  _______________      ")
         Escreval (" /               \     ")
         Escreval (" | 1 /\          |     ")
         Escreval (" |               |     ")
         Escreval (" |      /\       |     ")
         Escreval (" |     /  \      |     ")
         Escreval (" |    /    \     |     ")
         Escreval (" |    \    /     |     ")
         Escreval (" |     \  /      |     ")
         Escreval (" |      \/       |     ")
         Escreval (" |               |     ")
         Escreval (" |               |     ")
         Escreval (" |          1 /\ |     ")
         Escreval (" \_______________/     ")

         Escreval ("  _______________      ")
         Escreval (" /               \     ")
         Escreval (" | 2 /\          |     ")
         Escreval (" |               |     ")
         Escreval (" |      /\       |     ")
         Escreval (" |     /  \      |     ")
         Escreval (" |    /    \     |     ")
         Escreval (" |    \    /     |     ")
         Escreval (" |     \  /      |     ")
         Escreval (" |      \/       |     ")
         Escreval (" |               |     ")
         Escreval (" |               |     ")
         Escreval (" |          2 /\ |     ")
         Escreval (" \_______________/     ")

         Escreval ("  _______________      ")
         Escreval (" /               \     ")
         Escreval (" | 3 /\          |     ")
         Escreval (" |               |     ")
         Escreval (" |      /\       |     ")
         Escreval (" |     /  \      |     ")
         Escreval (" |    /    \     |     ")
         Escreval (" |    \    /     |     ")
         Escreval (" |     \  /      |     ")
         Escreval (" |      \/       |     ")
         Escreval (" |               |     ")
         Escreval (" |               |     ")
         Escreval (" |          3 /\ |     ")
         Escreval (" \_______________/     ")

         Escreval ("  _______________      ")
         Escreval (" /               \     ")
         Escreval (" | 4 /\          |     ")
         Escreval (" |               |     ")
         Escreval (" |      /\       |     ")
         Escreval (" |     /  \      |     ")
         Escreval (" |    /    \     |     ")
         Escreval (" |    \    /     |     ")
         Escreval (" |     \  /      |     ")
         Escreval (" |      \/       |     ")
         Escreval (" |               |     ")
         Escreval (" |               |     ")
         Escreval (" |          4 /\ |     ")
         Escreval (" \_______________/     ")

         Escreval ("  _______________      ")
         Escreval (" /               \     ")
         Escreval (" | 5 /\          |     ")
         Escreval (" |               |     ")
         Escreval (" |      /\       |     ")
         Escreval (" |     /  \      |     ")
         Escreval (" |    /    \     |     ")
         Escreval (" |    \    /     |     ")
         Escreval (" |     \  /      |     ")
         Escreval (" |      \/       |     ")
         Escreval (" |               |     ")
         Escreval (" |               |     ")
         Escreval (" |          5 /\ |     ")
         Escreval (" \_______________/     ")

         Escreval ("  _______________      ")
         Escreval (" /               \     ")
         Escreval (" | 6 /\          |     ")
         Escreval (" |               |     ")
         Escreval (" |      /\       |     ")
         Escreval (" |     /  \      |     ")
         Escreval (" |    /    \     |     ")
         Escreval (" |    \    /     |     ")
         Escreval (" |     \  /      |     ")
         Escreval (" |      \/       |     ")
         Escreval (" |               |     ")
         Escreval (" |               |     ")
         Escreval (" |          6 /\ |     ")
         Escreval (" \_______________/     ")

         Escreval (" ")
         Escreval ("         Paus          ")


         Escreval ("  _______________      ")
         Escreval (" /               \     ")
         Escreval (" | 1 ||          |     ")
         Escreval (" |               |     ")
         Escreval (" |               |     ")
         Escreval (" |       _       |     ")
         Escreval (" |     _/ \_     |     ")
         Escreval (" |    /     \    |     ")
         Escreval (" |    \__ __/    |     ")
         Escreval (" |      /_\      |     ")
         Escreval (" |               |     ")
         Escreval (" |               |     ")
         Escreval (" |          1 || |     ")
         Escreval (" \_______________/     ")

         Escreval ("  _______________      ")
         Escreval (" /               \     ")
         Escreval (" | 2 ||          |     ")
         Escreval (" |               |     ")
         Escreval (" |               |     ")
         Escreval (" |       _       |     ")
         Escreval (" |     _/ \_     |     ")
         Escreval (" |    /     \    |     ")
         Escreval (" |    \__ __/    |     ")
         Escreval (" |      /_\      |     ")
         Escreval (" |               |     ")
         Escreval (" |               |     ")
         Escreval (" |          2 || |     ")
         Escreval (" \_______________/     ")

         Escreval ("  _______________      ")
         Escreval (" /               \     ")
         Escreval (" | 3 ||          |     ")
         Escreval (" |               |     ")
         Escreval (" |               |     ")
         Escreval (" |       _       |     ")
         Escreval (" |     _/ \_     |     ")
         Escreval (" |    /     \    |     ")
         Escreval (" |    \__ __/    |     ")
         Escreval (" |      /_\      |     ")
         Escreval (" |               |     ")
         Escreval (" |               |     ")
         Escreval (" |          3 || |     ")
         Escreval (" \_______________/     ")

         Escreval ("  _______________      ")
         Escreval (" /               \     ")
         Escreval (" | 4 ||          |     ")
         Escreval (" |               |     ")
         Escreval (" |               |     ")
         Escreval (" |       _       |     ")
         Escreval (" |     _/ \_     |     ")
         Escreval (" |    /     \    |     ")
         Escreval (" |    \__ __/    |     ")
         Escreval (" |      /_\      |     ")
         Escreval (" |               |     ")
         Escreval (" |               |     ")
         Escreval (" |          4 || |     ")
         Escreval (" \_______________/     ")

         Escreval ("  _______________      ")
         Escreval (" /               \     ")
         Escreval (" | 5 ||          |     ")
         Escreval (" |               |     ")
         Escreval (" |               |     ")
         Escreval (" |       _       |     ")
         Escreval (" |     _/ \_     |     ")
         Escreval (" |    /     \    |     ")
         Escreval (" |    \__ __/    |     ")
         Escreval (" |      /_\      |     ")
         Escreval (" |               |     ")
         Escreval (" |               |     ")
         Escreval (" |          5 || |     ")
         Escreval (" \_______________/     ")

         Escreval ("  _______________      ")
         Escreval (" /               \     ")
         Escreval (" | 6 ||          |     ")
         Escreval (" |               |     ")
         Escreval (" |               |     ")
         Escreval (" |       _       |     ")
         Escreval (" |     _/ \_     |     ")
         Escreval (" |    /     \    |     ")
         Escreval (" |    \__ __/    |     ")
         Escreval (" |      /_\      |     ")
         Escreval (" |               |     ")
         Escreval (" |               |     ")
         Escreval (" |          6 || |     ")
         Escreval (" \_______________/     ")

      fimse

      se resposta_jogo = 4 entao
         MenuJogo()
      fimse



   fimenquanto
fimprocedimento




// Bingo
PRocedimento Bingo()
inicio
   resposta <- 0
   JogoRodando <- 1
   i <- 1
   j <- 1
   enquanto JogoRodando = 1 faca
      jogando2 <- 1
      resposta_jogo <- 0

      Escreval ("    BINGO         ")
      Escreval ("O que deseja fazer? ")
      Escreval ("1. Jogar ")
      Escreval ("2. Instruções ")
      Escreval ("3. Ver resultados ")
      Escreval ("4. Voltar ")
      Leia (resposta_jogo)

      Se resposta_jogo = 1 entao
         se qnt_din <= 0 entao
            fimjogo()
         fimse
         jogando <- 1
         enquanto jogando = 1 faca
            vitoria <- 0
            multiplicador <- 0
            cont_vitoria <- 0
            jogando2 <- 1
            partidaB <- partidaB + 1
            para i de 1 ate 75 faca
               num_sort[i] <- 0
            fimpara

            para i de 1 ate 5 faca
               para j de 1 ate 5 faca
                  Cartela[i,j] <- 0
               fimpara
            fimpara


            i <- 1
            j <- 1
            ESCREVAL ("Quanto de dinheiro você quer apostar? ")
            leia (aposta)
            Se (aposta <= 0) ou (qnt_din < aposta) entao
               repita
                  Escreval ("Erro, quantidade invalida, tente novamente! ")
                  leia (aposta)
               ate (aposta > 0) e (qnt_din >= aposta)
            fimse

            qnt_din <- qnt_din - aposta

            para i de 1 ate 5 faca
               para j de 1 ate 5 faca
                  se (i <= 5) e (j = 1) entao
                     repita
                        numero_bingo <- randi(16)
                     ate (numero_bingo <> 0) e (numero_bingo <> Cartela[1,1]) e (numero_bingo <> Cartela[2,1]) e (numero_bingo <> Cartela[3,1]) e (numero_bingo <> Cartela[4,1]) e (numero_bingo <> Cartela [5,1])

                     Cartela[i,j] <- numero_bingo
                  fimse


                  se (i <= 5) e (j = 2) entao
                     repita
                        numero_bingo <- randi(31)
                     ate (numero_bingo <> 0) e (numero_bingo <> Cartela[1,2]) e (numero_bingo <> Cartela[2,2]) e (numero_bingo <> Cartela[3,2]) e (numero_bingo <> Cartela[4,2]) e (numero_bingo <> Cartela[5,2]) e (numero_bingo >= 16)

                     Cartela[i,j] <- numero_bingo
                  fimse





                  se (i <= 5) e (j = 3) entao
                     repita
                        numero_bingo <- randi(46)
                     ate (numero_bingo <> 0) e (numero_bingo <> Cartela[1,3]) e (numero_bingo <> Cartela[2,3]) e (numero_bingo <> Cartela[3,3]) e (numero_bingo <> Cartela[4,3]) e (numero_bingo <> Cartela[5,3]) e (numero_bingo >= 31)

                     Cartela[i,j] <- numero_bingo
                  fimse


                  se (i <= 5) e (j = 4) entao
                     repita
                        numero_bingo <- randi(61)
                     ate (numero_bingo <> 0) e (numero_bingo <> Cartela[1,4]) e (numero_bingo <> Cartela[2,4]) e (numero_bingo <> Cartela[3,4]) e (numero_bingo <> Cartela[4,4]) e (numero_bingo <> Cartela[5,4]) e (numero_bingo >= 46)

                     Cartela[i,j] <- numero_bingo
                  fimse


                  se (i <= 5) e (j = 5) entao
                     repita
                        numero_bingo <- randi(76)
                     ate (numero_bingo <> 0) e (numero_bingo <> Cartela[1,5]) e (numero_bingo <> Cartela[2,5]) e (numero_bingo <> Cartela[3,5]) e (numero_bingo <> Cartela[4,5]) e (numero_bingo <> Cartela[5,5]) e (numero_bingo >= 61)

                     Cartela[i,j] <- numero_bingo
                  fimse

               fimpara
            fimpara

            tent <- 1

            enquanto jogando2 = 1 faca
               Escreval ("Muito bem, vamos lá!")


               Escreval ("Sua cartela: ")

               Escreva (" B   I   N   G   O ")
               Escreval (" ")
               para i de 1 ate 5 faca



                  para j de 1 ate 5 faca
                     Escreva (Cartela[i,j], " ")
                     se Cartela[i,j] < 10 entao
                        Escreva (" ")
                     fimse
                  fimpara
                  eSCREVAL (" ")
               fimpara

               Escreval ("Clique enter para gerar um numero! ", (46 - tent), " Tentativas restantes!")
               Escreval ("Lista de numeros gerados: ")
               Escreval (" ")
               para i de 1 ate 75 faca
                  se num_sort[i] <> 0 entao
                     escreva(num_sort[i], " ")
                  fimse
               fimpara
               Escreval (" ")
               Leia (enter)

               repita
                  numAl <- randi(76)
               ate (numAl <> 0)

               para i de 1 ate 75 faca
                  se numAl = num_sort[i] entao
                     repita
                        numAl <- randi(76)
                     ate (numAl <> 0)
                  fimse
               fimpara

               para i de 1 ate 5 faca
                  para j de 1 ate 5 faca
                     se numAl = Cartela[i,j] entao
                        Cartela[i,j] <- 0
                     fimse
                  fimpara
               fimpara


               num_sort[tent] <- numAl


               cont_vitoria <- 0


               para i de 1 ate 5 faca
                  se Cartela[i,i] = 0 entao
                     cont_vitoria <- cont_vitoria + 1
                  fimse
               fimpara

               // lateral principal
               se cont_vitoria = 5 entao
                  multiplicador <- multiplicador + 1.5
                  vitoria <- 1
               fimse

               cont_vitoria <- 0

               para i de 1 ate 5 faca
                  se Cartela[i,6 - i] = 0 entao
                     cont_vitoria <- cont_vitoria + 1
                  fimse
               fimpara


               // diagonal lateral
               se cont_vitoria = 5 entao
                  multiplicador <- multiplicador + 1.5
                  vitoria <- 1
               fimse

               cont_vitoria <- 0

               horizontal <- 1
               repita
                  para i de 1 ate 5 faca
                     se Cartela[horizontal,i] = 0 entao
                        cont_vitoria <- cont_vitoria + 1
                     fimse
                  fimpara


                  se cont_vitoria = 5 entao
                     multiplicador <- multiplicador + 1.5
                     vitoria <- 1
                  fimse

                  cont_vitoria <- 0
                  horizontal <- horizontal + 1
               ate horizontal = 6

               cont_vitoria <- 0
               coluna <- 1
               repita
                  para i de 1 ate 5 faca
                     se Cartela[i,coluna] = 0 entao
                        cont_vitoria <- cont_vitoria + 1
                     fimse
                  fimpara

                  se cont_vitoria = 5 entao
                     multiplicador <- multiplicador + 1.5
                     vitoria <- 1
                  fimse

                  cont_vitoria <- 0
                  coluna <- coluna + 1
               ate coluna = 6


               se vitoria = 1 entao
                  Escreval (multiplicador, " Você ganhou com essa quantidade de multiplicador! ")
                  Escreval ("Parabens você ganhou, deseja jogar novamente? " )
                  Escreval ("1. Sim")
                  Escreval ("2. Não")
                  leia (resposta)
                  se (resposta <> 1) e (resposta <> 2) entao
                     Escreval (" ")
                     Escreval ("Erro! Resposta inválida, tente novamente")

                     repita
                        leia (resposta)
                     ate (resposta = 1) ou (resposta = 2)
                  fimse
                  Se resposta = 2 entao
                     jogando <- 0
                  fimse
                  jogando2 <- 0
                  aposta <- aposta * multiplicador
                  qnt_din <- qnt_din + aposta
                  aposta <- 0
                  resultado_bingo[partidaB] <- 1
               fimse

               tent <- tent + 1

               se tent = 46 entao
                  Escreval ("Você perdeu! Que pena, deseja jogar novamente? ")
                  aposta <- 0
                  Escreval ("1. Sim ")
                  Escreval ("2. Não ")
                  leia (resposta)
                  se (resposta <> 1) e (resposta <> 2) entao
                     Escreval (" ")
                     Escreval ("Erro! Resposta inválida, tente novamente")

                     repita
                        leia (resposta)
                     ate (resposta = 1) ou (resposta = 2)
                  fimse
                  se resposta = 2 entao
                     jogando <- 0
                  fimse
                  jogando2 <- 0
                  resultado_bingo[partidaB] <- 2
               fimse







            fimenquanto
         fimenquanto
      fimse

      Se resposta_jogo = 2 entao
         Escreval ("Objetivo")
         Escreval ("Complete 1 linha, 1 coluna, ou 1 diagonal marcando todos os números em sua cartela.        ")
         Escreval ("        ")
         Escreval ("Cartela       ")
         Escreval ("A sua cartela tem 5×5 números, totalizando 25 posições.        ")
         Escreval ("B : números entre 1 e 15        ")
         Escreval ("I : 16 a 30        ")
         Escreval ("N : 31 a 45        ")
         Escreval ("G : 46 a 60        ")
         Escreval ("O : 61 a 75        ")
         Escreval ("        ")
         Escreval ("Quando um número sorteado é igual ao número da cartela, ele é substituído por 0 na cartela.        ")
         Escreval ("           ")
         Escreval ("Como vencer           ")
         Escreval ("Você vence se conseguir completar qualquer uma dessas:           ")
         Escreval ("A diagonal principal           ")
         Escreval ("A diagonal secundária           ")
         Escreval ("Qualquer linha           ")
         Escreval ("Qualquer coluna           ")
         Escreval ("           ")
         Escreval ("Cada linha/coluna/diagonal completada adiciona +1.5x no multiplicador de dinheiro           ")
         Escreval ("           ")
         Escreval ("Exemplo:           ")
         Escreval ("Fez uma linha : 1.5x           ")
         Escreval ("Linha + coluna : 3.0x           ")
         Escreval ("Linha + coluna + diagonal : 4.5x           ")
         Escreval ("           ")
         Escreval ("Se você não completar nenhuma linha, coluna ou diagonal até a tentativa 45           ")
         Escreval ("           ")
         Escreval ("Jogar esta versão do bingo tem que levar em consideração que podem vir numeros repitidos na hora de girar um número com muito azar.           ")
         Escreval ("           ")

      fimse

      Se resposta_jogo = 3 entao
         Para i de 1 ate 100 faca
            se resultado_bingo[i] = 1 entao
               Escreval (i, "° Partida ganha ")
            fimse
            se resultado_bingo[i] = 2 entao
               Escreval (i,"° Partida perdida ")
            fimse
         fimpara
      fimse

      Se resposta_jogo = 4 entao
         JogoRodando <- 0
      fimse


   fimenquanto
   MenuJogo()

fimprocedimento





// CAVALOS




Procedimento Cavalos()
inicio
   resposta <- 0
   JogoRodando <- 1
   resposta_jogo <- 0
   enquanto JogoRodando = 1 faca
      Escreval ("Bem vindo a aposta de cavalos ", nome, "! O que gostaria de fazer?" )
      Escreval ("1. Jogar ")
      Escreval ("2. Instruções ")
      Escreval ("3. Ver resultados ")
      Escreval ("4. Ver cavalos ")
      Escreval ("5. Voltar ")
      leia (resposta_jogo)



      Se resposta_jogo = 1 entao
         jogando <- 1
         enquanto jogando = 1 faca
            partidaC <- partidaC + 1
            cavalo <- 0
            jogando <- 1
            i <- 1
            Rcavalo <- 0
            cont <- 0

            Escreval ("Ok, vamos la! ")
            se qnt_din <= 0 entao
               fimjogo()
            fimse
            ESCREVAL ("Quanto de dinheiro você quer apostar? ")
            leia (aposta)
            Se (aposta <= 0) ou (qnt_din < aposta) entao
               repita
                  Escreval ("Erro, quantidade invalida, tente novamente! ")
                  leia (aposta)
               ate (aposta > 0) e (qnt_din >= aposta)
            fimse

            qnt_din <- qnt_din - aposta

            Escreval ("A corrida de cavalos vai começar! Em quem você quer apostar ")
            Escreval ("Cavalo 1 - Carlinhos ")
            Escreval ("Cavalo 2 - Lucky Pal ")
            Escreval ("Cavalo 3 - Bob ")
            Escreval ("Cavalo 4 - Manu ")
            Escreval ("Cavalo 5 - Naruto")
            leia (cavalo)

            Escreval (" ")
            Escreval ("Corrida em andamento... ")
            Para i de 1 ate 20000 faca // timer segundos
               cont <- cont + 1
            fimpara

            Rcavalo <- randi(6)
            se Rcavalo = 0 entao
               repita
                  Rcavalo <- randi(6)
               ate Rcavalo <> 0
            fimse


            i <- 1

            se Rcavalo = cavalo entao
               Escreval ("Parabens, você ganhou! ")
               Escreval ("Cavalo vencedor: ")
               se Rcavalo = 1 entao
                  Escreval ("     CAVALO 1 - Carlinhos            ")
                  Escreval ("     /\    /\                        ")
                  Escreval ("     | ²²²²  \                       ")
                  Escreval ("     | '  '   \                      ")
                  Escreval ("     \  w      \______________       ")
                  Escreval ("      ----=        |   |      \      ")
                  Escreval ("           \       | 1 |    f\ \     ")
                  Escreval ("            \      \___/    | \ \    ")
                  Escreval ("             \     ______   |  \ \   ")
                  Escreval ("              |   |     |   |   \ |  ")
                  Escreval ("              |   |     |   |    \/  ")
               fimse

               se Rcavalo = 2 entao
                  Escreval ("     CAVALO 2 - Lucky pal            ")
                  Escreval ("     /\    /\                        ")
                  Escreval ("     | 1111  \                       ")
                  Escreval ("     | '  '   \                      ")
                  Escreval ("     \  _      \______________       ")
                  Escreval ("      ----=        |   |      \      ")
                  Escreval ("           \       | 2 |    f\ \     ")
                  Escreval ("            \      \___/    | \ \    ")
                  Escreval ("             \     ______   |  \ \   ")
                  Escreval ("              |   |     |   |   \ |  ")
                  Escreval ("              |   |     |   |    \/  ")
               fimse

               se Rcavalo = 3 entao
                  Escreval ("     CAVALO 3 - Bob                  ")
                  Escreval ("     /\____/\                        ")
                  Escreval ("     | \  /  \                       ")
                  Escreval ("     | '  '   \                      ")
                  Escreval ("     \  /\     \______________       ")
                  Escreval ("      ----=        |   |      \      ")
                  Escreval ("           \       | 3 |    f\ \     ")
                  Escreval ("            \      \___/    | \ \    ")
                  Escreval ("             \     ______   |  \ \   ")
                  Escreval ("              |   |     |   |   \ |  ")
                  Escreval ("              |   |     |   |    \/  ")
               fimse

               se Rcavalo = 4 entao
                  Escreval ("     CAVALO 4 - Manu                 ")
                  Escreval ("     /\    /\                        ")
                  Escreval ("     | ¹¹¹¹  \                       ")
                  Escreval ("     | S2 S2  \                      ")
                  Escreval ("     \   _     \______________       ")
                  Escreval ("      ----=        |   |      \      ")
                  Escreval ("           \       | 4 |    f\ \     ")
                  Escreval ("            \      \___/    | \ \    ")
                  Escreval ("             \     ______   |  \ \   ")
                  Escreval ("              |   |     |   |   \ |  ")
                  Escreval ("              |   |     |   |    \/  ")
               fimse

               se Rcavalo = 5 entao
                  Escreval ("     CAVALO 5 - Naruto               ")
                  Escreval ("     /\____/\                        ")
                  Escreval ("     |==@=== \                       ")
                  Escreval ("     | ;  ;   \                      ")
                  Escreval ("     \  -      \______________       ")
                  Escreval ("      ----=        |   |      \      ")
                  Escreval ("           \       | 5 |    f\ \     ")
                  Escreval ("            \      \___/    | \ \    ")
                  Escreval ("             \     ______   |  \ \   ")
                  Escreval ("              |   |     |   |   \ |  ")
                  Escreval ("              |   |     |   |    \/  ")
               fimse


               // Trofeu :p
               Escreval ("     SEU TROFEU DE CAMPEÃO")
               Escreval ("        ___          ___  ")
               Escreval ("       |   \        /   |  ")
               Escreval ("      /|    \      /    |\  ")
               Escreval ("     | |     \____/     | | ")
               Escreval ("     | |                | | ")
               Escreval ("     | |       1°       |/  ")
               Escreval ("      \|                |  ")
               Escreval ("        \___        ___/  ")
               Escreval ("            \      /      ")
               Escreval ("             |    |       ")
               ESCREVAL ("             |    |       ")
               ESCREVAL ("             |    |       ")
               ESCREVAL ("            /      \      ")
               ESCREVAL ("            |      |      ")
               ESCREVAL ("            \______/      ")
               aposta <- aposta * 2
               qnt_din <- qnt_din + aposta
               Escreval ("Deseja jogar novamente? ")
               Escreval ("1. Sim ")
               Escreval ("2. Não")
               leia (resposta)
               se (resposta <> 1) e (resposta <> 2) entao
                  Escreval (" ")
                  Escreval ("Erro! Resposta inválida, tente novamente")
                  repita
                     leia (resposta)
                  ate (resposta = 1) ou (resposta = 2)
               fimse
               se resposta = 1 entao
                  resultado_cavalos[partidaC] <- 1
                  numero_cavalo[partidaC] <- cavalo
               fimse
               se resposta = 2 entao
                  jogando <- 0
                  resultado_cavalos[partidaC] <- 1
                  numero_cavalo[partidaC] <- cavalo
               fimse

            fimse


            se Rcavalo <> cavalo entao
               Escreval ("Que pena, você perdeu! ")
               Escreval (i, "° partida perdida, com o cavalo: ")
               se cavalo = 1 entao
                  Escreval ("     CAVALO 1 - Carlinhos            ")
                  Escreval ("     /\    /\                        ")
                  Escreval ("     | ²²²²  \                       ")
                  Escreval ("     |~~ ~~   \                      ")
                  Escreval ("     \ /-\     \______________       ")
                  Escreval ("      ----=        |   |      \      ")
                  Escreval ("           \       | 1 |    f\ \     ")
                  Escreval ("            \      \___/    | \ \    ")
                  Escreval ("             \     ______   |  \ \   ")
                  Escreval ("              |   |     |   |   \ |  ")
                  Escreval ("              |   |     |   |    \/  ")
               fimse

               se cavalo = 2 entao
                  Escreval ("     CAVALO 2 - Lucky pal            ")
                  Escreval ("     /\    /\                        ")
                  Escreval ("     | 1111  \                       ")
                  Escreval ("     | ~  ~   \                      ")
                  Escreval ("     \ /-\      \______________       ")
                  Escreval ("      ----=        |   |      \      ")
                  Escreval ("           \       | 2 |    f\ \     ")
                  Escreval ("            \      \___/    | \ \    ")
                  Escreval ("             \     ______   |  \ \   ")
                  Escreval ("              |   |     |   |   \ |  ")
                  Escreval ("              |   |     |   |    \/  ")
               fimse

               se cavalo = 3 entao
                  Escreval ("     CAVALO 3 - Bob                  ")
                  Escreval ("     /\____/\                        ")
                  Escreval ("     |/   \  \                       ")
                  Escreval ("     |~~  ~~  \                      ")
                  Escreval ("     \ /-\     \______________       ")
                  Escreval ("      ----=        |   |      \      ")
                  Escreval ("           \       | 3 |    f\ \     ")
                  Escreval ("            \      \___/    | \ \    ")
                  Escreval ("             \     ______   |  \ \   ")
                  Escreval ("              |   |     |   |   \ |  ")
                  Escreval ("              |   |     |   |    \/  ")
               fimse

               se cavalo = 4 entao
                  Escreval ("     CAVALO 4 - Manu                 ")
                  Escreval ("     /\    /\                        ")
                  Escreval ("     | ¹¹¹¹  \                       ")
                  Escreval ("     | ~~ ~~  \                      ")
                  Escreval ("     \  /-\    \______________       ")
                  Escreval ("      ----=        |   |      \      ")
                  Escreval ("           \       | 4 |    f\ \     ")
                  Escreval ("            \      \___/    | \ \    ")
                  Escreval ("             \     ______   |  \ \   ")
                  Escreval ("              |   |     |   |   \ |  ")
                  Escreval ("              |   |     |   |    \/  ")
               fimse

               se cavalo = 5 entao
                  Escreval ("     CAVALO 5 - Naruto               ")
                  Escreval ("     /\____/\                        ")
                  Escreval ("     |==@=== \                       ")
                  Escreval ("     |~~  ~~  \                      ")
                  Escreval ("     \ /-\     \______________       ")
                  Escreval ("      ----=        |   |      \      ")
                  Escreval ("           \       | 5 |    f\ \     ")
                  Escreval ("            \      \___/    | \ \    ")
                  Escreval ("             \     ______   |  \ \   ")
                  Escreval ("              |   |     |   |   \ |  ")
                  Escreval ("              |   |     |   |    \/  ")
               fimse


               Escreval (" MEDALHA DE PARTICIPAÇÃO    ")
               Escreval ("                            ")
               Escreval (" \              /           ")
               Escreval ("  \            /            ")
               Escreval ("   \          /             ")
               Escreval ("    \        /              ")
               Escreval ("     \      /               ")
               Escreval ("      \ __ /                ")
               Escreval ("       /  \                 ")
               Escreval ("      | :p |                ")
               Escreval ("       \__/                 ")
               Escreval ("                            ")
               Escreval (" PARABENS PELA PARTICIPAÇÃO ")
               aposta <- 0


               Escreval ("Cavalo vencedor: ")
               se Rcavalo = 1 entao
                  Escreval ("     CAVALO 1 - Carlinhos            ")
                  Escreval ("     /\    /\                        ")
                  Escreval ("     | ²²²²  \                       ")
                  Escreval ("     | '  '   \                      ")
                  Escreval ("     \ \w/     \______________       ")
                  Escreval ("      ----=        |   |      \      ")
                  Escreval ("           \       | 1 |    f\ \     ")
                  Escreval ("            \      \___/    | \ \    ")
                  Escreval ("             \     ______   |  \ \   ")
                  Escreval ("              |   |     |   |   \ |  ")
                  Escreval ("              |   |     |   |    \/  ")
               fimse

               se Rcavalo = 2 entao
                  Escreval ("     CAVALO 2 - Lucky pal            ")
                  Escreval ("     /\    /\                        ")
                  Escreval ("     | 1111  \                       ")
                  Escreval ("     | '  '   \                      ")
                  Escreval ("     \  \w/    \______________       ")
                  Escreval ("      ----=        |   |      \      ")
                  Escreval ("           \       | 2 |    f\ \     ")
                  Escreval ("            \      \___/    | \ \    ")
                  Escreval ("             \     ______   |  \ \   ")
                  Escreval ("              |   |     |   |   \ |  ")
                  Escreval ("              |   |     |   |    \/  ")
               fimse

               se Rcavalo = 3 entao
                  Escreval ("     CAVALO 3 - Bob                  ")
                  Escreval ("     /\____/\                        ")
                  Escreval ("     | \  /  \                       ")
                  Escreval ("     | '  '   \                      ")
                  Escreval ("     \ \w/     \______________       ")
                  Escreval ("      ----=        |   |      \      ")
                  Escreval ("           \       | 3 |    f\ \     ")
                  Escreval ("            \      \___/    | \ \    ")
                  Escreval ("             \     ______   |  \ \   ")
                  Escreval ("              |   |     |   |   \ |  ")
                  Escreval ("              |   |     |   |    \/  ")
               fimse

               se Rcavalo = 4 entao
                  Escreval ("     CAVALO 4 - Manu                 ")
                  Escreval ("     /\    /\                        ")
                  Escreval ("     | ¹¹¹¹  \                       ")
                  Escreval ("     | S2 S2  \                      ")
                  Escreval ("     \  \w/    \______________       ")
                  Escreval ("      ----=        |   |      \      ")
                  Escreval ("           \       | 4 |    f\ \     ")
                  Escreval ("            \      \___/    | \ \    ")
                  Escreval ("             \     ______   |  \ \   ")
                  Escreval ("              |   |     |   |   \ |  ")
                  Escreval ("              |   |     |   |    \/  ")
               fimse

               se Rcavalo = 5 entao
                  Escreval ("     CAVALO 5 - Naruto               ")
                  Escreval ("     /\____/\                        ")
                  Escreval ("     |==@=== \                       ")
                  Escreval ("     | ;  ;   \                      ")
                  Escreval ("     \ \w/     \______________       ")
                  Escreval ("      ----=        |   |      \      ")
                  Escreval ("           \       | 5 |    f\ \     ")
                  Escreval ("            \      \___/    | \ \    ")
                  Escreval ("             \     ______   |  \ \   ")
                  Escreval ("              |   |     |   |   \ |  ")
                  Escreval ("              |   |     |   |    \/  ")
               fimse
               Escreval ("Deseja jogar novamente? ")
               Escreval ("1. Sim ")
               Escreval ("2. Não")
               leia (resposta)
               se (resposta <> 1) e (resposta <> 2) entao
                  Escreval (" ")
                  Escreval ("Erro! Resposta inválida, tente novamente")

                  repita
                     leia (resposta)
                  ate (resposta = 1) ou (resposta = 2)
               fimse
               se resposta = 1 entao
                  resultado_cavalos[partidaC] <- 2
                  numero_cavalo[partidaC] <- cavalo
               senao
                  jogando <- 0
                  resultado_cavalos[partidaC] <- 2
                  numero_cavalo[partidaC] <- cavalo
               fimse
            fimse

         fimenquanto
      fimse


      // Instruções


      Se resposta_jogo = 2 entao
         Escreval ("Bem vindo(a) aos cavalos, seu objetivo é apostar em um cavalo e ver se ele vai ganhar, caso ganhe, seu dinheiro apostado é multiplicado em 2x, em caso de perda, perdera tudo! ")
         Escreval ("     CAVALO 1 - Carlinhos            ")
         Escreval ("     /\    /\                        ")
         Escreval ("     | ²²²²  \                       ")
         Escreval ("     | '  '   \                      ")
         Escreval ("     \  w      \______________       ")
         Escreval ("      ----=        |   |      \      ")
         Escreval ("           \       | 1 |    f\ \     ")
         Escreval ("            \      \___/    | \ \    ")
         Escreval ("             \     ______   |  \ \   ")
         Escreval ("              |   |     |   |   \ |  ")
         Escreval ("              |   |     |   |    \/  ")


         Escreval ("     CAVALO 2 - Lucky pal            ")
         Escreval ("     /\    /\                        ")
         Escreval ("     | 1111  \                       ")
         Escreval ("     | '  '   \                      ")
         Escreval ("     \  _      \______________       ")
         Escreval ("      ----=        |   |      \      ")
         Escreval ("           \       | 2 |    f\ \     ")
         Escreval ("            \      \___/    | \ \    ")
         Escreval ("             \     ______   |  \ \   ")
         Escreval ("              |   |     |   |   \ |  ")
         Escreval ("              |   |     |   |    \/  ")


         Escreval ("     CAVALO 3 - Bob                  ")
         Escreval ("     /\____/\                        ")
         Escreval ("     | \  /  \                       ")
         Escreval ("     | '  '   \                      ")
         Escreval ("     \  /\     \______________       ")
         Escreval ("      ----=        |   |      \      ")
         Escreval ("           \       | 3 |    f\ \     ")
         Escreval ("            \      \___/    | \ \    ")
         Escreval ("             \     ______   |  \ \   ")
         Escreval ("              |   |     |   |   \ |  ")
         Escreval ("              |   |     |   |    \/  ")


         Escreval ("     CAVALO 4 - Manu                 ")
         Escreval ("     /\    /\                        ")
         Escreval ("     | ¹¹¹¹  \                       ")
         Escreval ("     | S2 S2  \                      ")
         Escreval ("     \   _     \______________       ")
         Escreval ("      ----=        |   |      \      ")
         Escreval ("           \       | 4 |    f\ \     ")
         Escreval ("            \      \___/    | \ \    ")
         Escreval ("             \     ______   |  \ \   ")
         Escreval ("              |   |     |   |   \ |  ")
         Escreval ("              |   |     |   |    \/  ")


         Escreval ("     CAVALO 5 - Naruto               ")
         Escreval ("     /\____/\                        ")
         Escreval ("     |==@=== \                       ")
         Escreval ("     | ;  ;   \                      ")
         Escreval ("     \  -      \______________       ")
         Escreval ("      ----=        |   |      \      ")
         Escreval ("           \       | 5 |    f\ \     ")
         Escreval ("            \      \___/    | \ \    ")
         Escreval ("             \     ______   |  \ \   ")
         Escreval ("              |   |     |   |   \ |  ")
         Escreval ("              |   |     |   |    \/  ")
      Fimse


      // Mostrar resultados


      Se resposta_jogo = 3 entao
         i <- 1
         para i de 1 ate 100 faca
            se resultado_cavalos[i] = 1 entao
               Escreval (i, "° partida ganha, com o cavalo: ")
               se numero_cavalo[i] = 1 entao
                  Escreval ("     CAVALO 1 - Carlinhos            ")
                  Escreval ("     /\    /\                        ")
                  Escreval ("     | ²²²²  \                       ")
                  Escreval ("     | '  '   \                      ")
                  Escreval ("     \  w      \______________       ")
                  Escreval ("      ----=        |   |      \      ")
                  Escreval ("           \       | 1 |    f\ \     ")
                  Escreval ("            \      \___/    | \ \    ")
                  Escreval ("             \     ______   |  \ \   ")
                  Escreval ("              |   |     |   |   \ |  ")
                  Escreval ("              |   |     |   |    \/  ")
               fimse

               se numero_cavalo[i] = 2 entao
                  Escreval ("     CAVALO 2 - Lucky pal            ")
                  Escreval ("     /\    /\                        ")
                  Escreval ("     | 1111  \                       ")
                  Escreval ("     | '  '   \                      ")
                  Escreval ("     \  _      \______________       ")
                  Escreval ("      ----=        |   |      \      ")
                  Escreval ("           \       | 2 |    f\ \     ")
                  Escreval ("            \      \___/    | \ \    ")
                  Escreval ("             \     ______   |  \ \   ")
                  Escreval ("              |   |     |   |   \ |  ")
                  Escreval ("              |   |     |   |    \/  ")
               fimse

               se numero_cavalo[i] = 3 entao
                  Escreval ("     CAVALO 3 - Bob                  ")
                  Escreval ("     /\____/\                        ")
                  Escreval ("     | \  /  \                       ")
                  Escreval ("     | '  '   \                      ")
                  Escreval ("     \  /\     \______________       ")
                  Escreval ("      ----=        |   |      \      ")
                  Escreval ("           \       | 3 |    f\ \     ")
                  Escreval ("            \      \___/    | \ \    ")
                  Escreval ("             \     ______   |  \ \   ")
                  Escreval ("              |   |     |   |   \ |  ")
                  Escreval ("              |   |     |   |    \/  ")
               fimse

               se numero_cavalo[i] = 4 entao
                  Escreval ("     CAVALO 4 - Manu                 ")
                  Escreval ("     /\    /\                        ")
                  Escreval ("     | ¹¹¹¹  \                       ")
                  Escreval ("     | S2 S2  \                      ")
                  Escreval ("     \   _     \______________       ")
                  Escreval ("      ----=        |   |      \      ")
                  Escreval ("           \       | 4 |    f\ \     ")
                  Escreval ("            \      \___/    | \ \    ")
                  Escreval ("             \     ______   |  \ \   ")
                  Escreval ("              |   |     |   |   \ |  ")
                  Escreval ("              |   |     |   |    \/  ")
               fimse

               se numero_cavalo[i] = 5 entao
                  Escreval ("     CAVALO 5 - Naruto               ")
                  Escreval ("     /\____/\                        ")
                  Escreval ("     |==@=== \                       ")
                  Escreval ("     | ;  ;   \                      ")
                  Escreval ("     \  -      \______________       ")
                  Escreval ("      ----=        |   |      \      ")
                  Escreval ("           \       | 5 |    f\ \     ")
                  Escreval ("            \      \___/    | \ \    ")
                  Escreval ("             \     ______   |  \ \   ")
                  Escreval ("              |   |     |   |   \ |  ")
                  Escreval ("              |   |     |   |    \/  ")
               fimse
            fimse


            se resultado_cavalos[i] = 2 entao
               Escreval (i, "° partida perdida, com o cavalo: ")
               se numero_cavalo[i] = 1 entao
                  Escreval ("     CAVALO 1 - Carlinhos            ")
                  Escreval ("     /\    /\                        ")
                  Escreval ("     | ²²²²  \                       ")
                  Escreval ("     | '  '   \                      ")
                  Escreval ("     \  w      \______________       ")
                  Escreval ("      ----=        |   |      \      ")
                  Escreval ("           \       | 1 |    f\ \     ")
                  Escreval ("            \      \___/    | \ \    ")
                  Escreval ("             \     ______   |  \ \   ")
                  Escreval ("              |   |     |   |   \ |  ")
                  Escreval ("              |   |     |   |    \/  ")
               fimse


               se numero_cavalo[i] = 2 entao
                  Escreval ("     CAVALO 2 - Lucky pal            ")
                  Escreval ("     /\    /\                        ")
                  Escreval ("     | 1111  \                       ")
                  Escreval ("     | '  '   \                      ")
                  Escreval ("     \  _      \______________       ")
                  Escreval ("      ----=        |   |      \      ")
                  Escreval ("           \       | 2 |    f\ \     ")
                  Escreval ("            \      \___/    | \ \    ")
                  Escreval ("             \     ______   |  \ \   ")
                  Escreval ("              |   |     |   |   \ |  ")
                  Escreval ("              |   |     |   |    \/  ")
               fimse


               se numero_cavalo[i] = 3 entao
                  Escreval ("     CAVALO 3 - Bob                  ")
                  Escreval ("     /\____/\                        ")
                  Escreval ("     | \  /  \                       ")
                  Escreval ("     | '  '   \                      ")
                  Escreval ("     \  /\     \______________       ")
                  Escreval ("      ----=        |   |      \      ")
                  Escreval ("           \       | 3 |    f\ \     ")
                  Escreval ("            \      \___/    | \ \    ")
                  Escreval ("             \     ______   |  \ \   ")
                  Escreval ("              |   |     |   |   \ |  ")
                  Escreval ("              |   |     |   |    \/  ")
               fimse


               se numero_cavalo[i] = 4 entao
                  Escreval ("     CAVALO 4 - Manu                 ")
                  Escreval ("     /\    /\                        ")
                  Escreval ("     | ¹¹¹¹  \                       ")
                  Escreval ("     | S2 S2  \                      ")
                  Escreval ("     \   _     \______________       ")
                  Escreval ("      ----=        |   |      \      ")
                  Escreval ("           \       | 4 |    f\ \     ")
                  Escreval ("            \      \___/    | \ \    ")
                  Escreval ("             \     ______   |  \ \   ")
                  Escreval ("              |   |     |   |   \ |  ")
                  Escreval ("              |   |     |   |    \/  ")
               fimse


               se numero_cavalo[i] = 5 entao
                  Escreval ("     CAVALO 5 - Naruto               ")
                  Escreval ("     /\____/\                        ")
                  Escreval ("     |==@=== \                       ")
                  Escreval ("     | ;  ;   \                      ")
                  Escreval ("     \  -      \______________       ")
                  Escreval ("      ----=        |   |      \      ")
                  Escreval ("           \       | 5 |    f\ \     ")
                  Escreval ("            \      \___/    | \ \    ")
                  Escreval ("             \     ______   |  \ \   ")
                  Escreval ("              |   |     |   |   \ |  ")
                  Escreval ("              |   |     |   |    \/  ")
               fimse
            fimse
         fimpara
      Fimse


      // VER CAVALOS


      Se resposta_jogo = 4 entao
         Escreval ("     CAVALO 1 - Carlinhos            ")
         Escreval ("     /\    /\                        ")
         Escreval ("     | ²²²²  \                       ")
         Escreval ("     | '  '   \                      ")
         Escreval ("     \  w      \______________       ")
         Escreval ("      ----=        |   |      \      ")
         Escreval ("           \       | 1 |    f\ \     ")
         Escreval ("            \      \___/    | \ \    ")
         Escreval ("             \     ______   |  \ \   ")
         Escreval ("              |   |     |   |   \ |  ")
         Escreval ("              |   |     |   |    \/  ")


         Escreval ("     CAVALO 2 - Lucky Pal            ")
         Escreval ("     /\    /\                        ")
         Escreval ("     | 1111  \                       ")
         Escreval ("     | '  '   \                      ")
         Escreval ("     \  _      \______________       ")
         Escreval ("      ----=        |   |      \      ")
         Escreval ("           \       | 2 |    f\ \     ")
         Escreval ("            \      \___/    | \ \    ")
         Escreval ("             \     ______   |  \ \   ")
         Escreval ("              |   |     |   |   \ |  ")
         Escreval ("              |   |     |   |    \/  ")


         Escreval ("     CAVALO 3 - Bob                  ")
         Escreval ("     /\____/\                        ")
         Escreval ("     | \  /  \                       ")
         Escreval ("     | '  '   \                      ")
         Escreval ("     \  /\     \______________       ")
         Escreval ("      ----=        |   |      \      ")
         Escreval ("           \       | 3 |    f\ \     ")
         Escreval ("            \      \___/    | \ \    ")
         Escreval ("             \     ______   |  \ \   ")
         Escreval ("              |   |     |   |   \ |  ")
         Escreval ("              |   |     |   |    \/  ")


         Escreval ("     CAVALO 4 - Manu                 ")
         Escreval ("     /\    /\                        ")
         Escreval ("     | ¹¹¹¹  \                       ")
         Escreval ("     | S2 S2  \                      ")
         Escreval ("     \   _     \______________       ")
         Escreval ("      ----=        |   |      \      ")
         Escreval ("           \       | 4 |    f\ \     ")
         Escreval ("            \      \___/    | \ \    ")
         Escreval ("             \     ______   |  \ \   ")
         Escreval ("              |   |     |   |   \ |  ")
         Escreval ("              |   |     |   |    \/  ")


         Escreval ("     CAVALO 5 - Naruto               ")
         Escreval ("     /\____/\                        ")
         Escreval ("     |==@=== \                       ")
         Escreval ("     | ;  ;   \                      ")
         Escreval ("     \  -      \______________       ")
         Escreval ("      ----=        |   |      \      ")
         Escreval ("           \       | 5 |    f\ \     ")
         Escreval ("            \      \___/    | \ \    ")
         Escreval ("             \     ______   |  \ \   ")
         Escreval ("              |   |     |   |   \ |  ")
         Escreval ("              |   |     |   |    \/  ")
      Fimse



      // Voltar



      Se resposta_jogo = 5 entao
         JogoRodando <- 0
      fimse
   Fimenquanto

   MenuJogo()

fimprocedimento









// VINTE E UM




Procedimento VinteUm()
inicio
   JogoRodando <- 1
   resposta <- 0
   resposta_jogo <- 0
   enquanto JogoRodando = 1 faca
      resposta_jogo <- 0
      i <- 1
      Escreval ("Bem vindo ao 21, ", nome, "! O que gostaria de fazer? ")
      Escreval ("1. Jogar ")
      Escreval ("2. Instruções ")
      Escreval ("3. Ver resultados")
      Escreval ("4. Voltar ")
      leia (resposta_jogo)



      // Jogar



      Se resposta_jogo = 1 entao
         para i de 1 ate 10 faca
            cartas[i] <- 0
         fimpara

         para j de 1 ate 10 faca
            cartasop[j] <- 0
         fimpara

         i <- 1
         j <- 1

         cartas[i] <- randi(12)
         se cartas[i] = 0 entao
            repita
               cartas[i] <- randi(12)
            ate cartas[i] <> 0
         fimse


         cartasop[j] <- randi(12)
         se cartasop[j] = 0 entao
            repita
               cartasop[j] <- randi(12)
            ate cartasop[j] <> 0
         fimse




         se qnt_din <= 0 entao
            fimjogo()
         fimse
         Escreval ("Vamos lá!")
         eSCREVAL ("Quanto de dinheiro você quer apostar? ")
         leia (aposta)
         Se (aposta <= 0) ou (qnt_din < aposta) entao
            repita
               Escreval ("Erro, quantidade invalida, tente novamente! ")
               leia (aposta)
            ate (aposta > 0) e (qnt_din >= aposta)
         fimse

         qnt_din <- qnt_din - aposta

         jogando <- 1
         i <- 2
         j <- 1
         m <- 1
         n <- 1
         somac <- 0
         somaop <- 0
         parar <- 0
         pararop <- 0

         enquanto jogando = 1 faca
            Escreval ("         MÃO DO DEALER           ")
            Escreval ("               ?                 ")
            Escreval ("                                 ")
            Escreval ("            Sua mão              ")
            Escreval (" ")
            para m de 1 ate 10 faca
               se cartas[m] = 0 entao
               senao
                  Escreva (cartas[m], ", ")
               fimse
            fimpara

            Escreval (" ")

            somac <- 0
            para m de 1 ate 10 faca
               somac <- cartas[m] + somac
            fimpara
            se somac > 21 entao
               Se (somaop >  21 ) e (somac > 21) entao
                  Escreval ("Empate! Os dois estouraram! Total do dealer: ", somaop)
                  jogada <- jogada + 1
                  resultado[jogada] <- 3
                  empate()
                  jogando <- 0
               fimse
               Escreval ("Passou de 21! Perda com: ", somac, ". Total do dealer: ", somaop)
               jogada <- jogada + 1
               resultado[jogada] <- 2
               perdeu()
               jogando <- 0
            fimse

            Escreval ("Total atual: ", somac)

            se jogando <> 0 entao
               Escreval ("  ")
               Escreval ("O que Deseja fazer? ")
               Escreval ("1. Pedir ")
               Escreval ("2. Passar ")
               leia (resposta)
            fimse

            Se resposta = 1 entao
               cartas[i] <- randi(12)
               se cartas[i] = 0 entao
                  repita
                     cartas[i] <- randi(12)
                  ate cartas[i] <> 0
               fimse
            fimse

            se pararop <> 2 entao
               cartasop[j] <- randi(12)
               se cartasop[j] = 0 entao
                  repita
                     cartasop[j] <- randi(12)
                  ate cartasop[j] <> 0
               fimse
            fimse

            somaop <- 0
            para n de 1 ate 10 faca
               somaop <- cartasop[n] + somaop
            fimpara

            Se somaop > 21 entao
               Se (somaop >  21 ) e (somac > 21) entao
                  Escreval ("Empate! Os dois estouraram! Total do dealer: ", somaop)
                  jogada <- jogada + 1
                  resultado[jogada] <- 3
                  empate()
                  jogando <- 0
               senao
                  Escreval ("Parabens você ganhou! Total do dealer: ", somaop)
                  jogada <- jogada + 1
                  resultado[jogada] <- 1
                  ganhou()
                  jogando <- 0
               fimse
            fimse

            se somaop >= 17 entao
               pararop <- 2
            fimse

            se resposta = 2 entao
               parar <- 2
            fimse

            se (pararop = 2) e (parar = 2) entao
               Escreval ("Checando quem ganhou... ")
               Se somaop = somac entao
                  Escreval ("Empate! Total do dealer: ", somaop)
                  jogada <- jogada + 1
                  resultado[jogada] <- 3
                  empate()
                  jogando <- 0
               fimse
               Se somaop > somac entao
                  Escreval ("Perda! Total do dealer: ", somaop)
                  jogada <- jogada + 1
                  resultado[jogada] <- 2
                  perdeu()
                  jogando <- 0
               fimse
               se somac > somaop entao
                  Escreval ("Ganhou! Total do dealer: ", somaop)
                  jogada <- jogada + 1
                  resultado[jogada] <- 1
                  ganhou()
                  jogando <- 0
               fimse
            fimse

            j <- j + 1
            i <- i + 1

            Escreval (" ")
         fimenquanto
      fimse
   fimse



   Se resposta_jogo = 2 entao
      Escreval ("                 INSTRUÇÕES               ")
      Escreval ("Como funciona: ")
      Escreval ("Você começa com 1 carta           ")
      Escreval ("O dealer também começa com 1 carta           ")
      Escreval ("Cada carta vale um número de 1 a 11           ")
      Escreval ("           ")
      Escreval ("Você tem essas duas opções:           ")
      Escreval ("1. Pedir (pegar mais uma carta)           ")
      Escreval ("2. Passar (passar a rodada)           ")
      Escreval ("           ")
      Escreval ("Quando alguém passa de 21           ")
      Escreval ("Quem estourar (passar de 21) perde automaticamente           ")
      Escreval ("Se os dois estourarem resultara em empate           ")
      Escreval ("           ")
      Escreval ("Resultados           ")
      Escreval ("Vitória : 1.5× sua aposta           ")
      Escreval ("Derrota : perde tudo           ")
      Escreval ("Empate : perde metade da aposta           ")
      Escreval (" ")
   fimse



   // Resultados



   Se resposta_jogo = 3 entao
      i <- 0
      Para i de 1 ate jogada faca
         Se resultado[i] = 1 entao
            Escreva (i, "° partida ganha, ")
         fimse
         Se resultado[i] = 2 entao
            Escreva (i, "° partida perdida, ")
         fimse
         Se resultado[i] = 3 entao
            Escreva (i, "° partida empatou, ")
         fimse
      fimpara
      Escreval (" ")
   fimse


   // Voltar

   se resposta_jogo = 4 entao
      JogoRodando <- 0
   fimse

fimenquanto
MenuJogo()
fimprocedimento



// Ganhou 21



Procedimento ganhou()
inicio
   Escreval ("Parabéns, você ganhou! Multiplicando seu dinheiro em 1.5x! ")
   aposta <- aposta * 1.5
   qnt_din <- qnt_din + aposta
   jogando <- 0
   Escreval ("Deseja jogar novamente? ")
   Escreval ("1. Sim")
   Escreval ("2. Não")
   leia (resposta)
   se (resposta <> 1) e (resposta <> 2) entao
      Escreval (" ")
      Escreval ("Erro! Resposta inválida, tente novamente")

      repita
         leia (resposta)
      ate (resposta = 1) ou (resposta = 2)
   fimse
   Se resposta = 2 entao
      JogoRodando <- 0

   fimse

fimprocedimento



// Perdeu 21



Procedimento perdeu()
inicio
   Escreval ("Que pena, você perdeu! Perdendo quantidade de dinheiro apostado... ")
   aposta <- 0
   jogando <- 0
   Escreval ("Deseja jogar novamente? ")
   Escreval ("1. Sim")
   Escreval ("2. Não")
   leia (resposta)
   se (resposta <> 1) e (resposta <> 2) entao
      Escreval (" ")
      Escreval ("Erro! Resposta inválida, tente novamente")

      repita
         leia (resposta)
      ate (resposta = 1) ou (resposta = 2)
   fimse
   Se resposta = 2 entao
      JogoRodando <- 0

   fimse
fimprocedimento



// Empate 21


Procedimento empate()
inicio
   Escreval (" ")
   Escreval ("Você empatou! Perdendo metade do dinheiro apostado! ")
   aposta <- aposta / 2
   qnt_din <- qnt_din - aposta
   jogando <- 0
   Escreval ("Deseja jogar novamente? ")
   Escreval ("1. Sim")
   Escreval ("2. Não")
   leia (resposta)
   se (resposta <> 1) e (resposta <> 2) entao
      Escreval (" ")
      Escreval ("Erro! Resposta inválida, tente novamente")
      repita
         leia (resposta)
      ate (resposta = 1) ou (resposta = 2)
   fimse
   Se resposta = 2 entao
      JogoRodando <- 0

   fimse
fimprocedimento







// MENU


Procedimento Menu()
inicio
   Logo()
   Escreval ("Bem-vindo(a), ", nome, "! O que gostaria de fazer? ")
   Escreval ("1. Verificar saldo. ")
   Escreval ("2. Jogar. ")
   Escreval ("3. Acrescentar dinheiro. ")
   Escreval ("4. Mudar de nome. ")
   Escreval ("5. Sair")
   leia (resposta_menu_principal)

   Se resposta_menu_principal = 1 entao
      limpatela
      verificar_saldo()
   fimse
   Se resposta_menu_principal = 2 entao
      limpatela
      MenuJogo()
   fimse
   Se resposta_menu_principal = 3 entao
      limpatela
      Acrescentar_dinheiro()
   fimse
   se resposta_menu_principal = 4 entao
      limpatela
      mudar_nome()
   fimse
   se resposta_menu_principal = 5 entao
      limpatela
      fimjogo()
   fimse
fimprocedimento



Inicio
   // Seção de Comandos, procedimento, funções, operadores, etc...

   jogada <- 0
   partidaC <- 0
   Para i de 1 ate 100 faca
      resultado[i] <- 0
      resultado_cavalos[i] <- 0
   fimpara


   controle <- 1
   entrada_user()


   Enquanto controle = 1 faca
      resposta_menu_principal <- 0
      resposta <- 0
      resposta_menu <- 0
      Menu()

   fimenquanto




Fimalgoritmo