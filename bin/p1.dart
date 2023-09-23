import 'dart:math'; //Biblioteca importada para usar função de randomização (Numero aleatorio)

import 'dart:io'; //Biblioteca importada para usar Stdin

int sorteiodado(int min, int max) {
  final aleatorio = Random();

  return min + aleatorio.nextInt(max - min + 1);
} // Função que gera numero aleatorio dos dados

int soma(num1, num2, num3) {
  int pontuacaoRodada = num1 + num2 + num3; // calculo da soma

  return (pontuacaoRodada); // retorno da funcao
}

void main() {
  int i = 0;

  String desabilitamagico = "N";

  int min = 1; // Quantidade mínima de faces do dado

  int max = 6; // Quantidade máximo de faces do dado

  print("Escolha a quantidade de rodadas: ");

  String input = stdin
      .readLineSync()!; //Variavel armazenar valor lido do teclado (Quantidade de rodadas)

  int rodadas = int.parse(
      input); //Variavel para armazenar a quantidade de rodadas que o usuario quer

  int pontuacaoUser = 0; //Variavel que armazena pontuação usuario

  double pontuacaousuariodouble = 0.0;

  int pontuacaoComputador = 0; //Variavel que armazena pontuação computador

  int dado1usuario = 0; // Variavel que indica valor do dado 1 do Usuario

  int dado2usuario = 0; // Variavel que indica valor do dado 2 do Usuario

  int dado3usuario = 0; // Variavel que indica valor do dado 3 do Usuario

  int dado1computador = 0; // Variavel que indica valor do dado 1 do Computador

  int dado2computador = 0; // Variavel que indica valor do dado 2 do Computador

  int dado3computador = 0; // Variavel que indica valor do dado 3 do Computador

  int dadomagico = 0; //Variavel que indica valor dado magico

  int vitoriaUsuario = 0; //variavel que indica vitorias do Usuario

  int vitoriaComputador = 0; //variavel que indica vitorias do Computador

  while (rodadas > i) {
    dado1usuario = sorteiodado(min, max);

    print("O valor do dado 1 do usuario: $dado1usuario");

    dado2usuario = sorteiodado(min, max);

    print("O valor do dado 2 do usuario: $dado2usuario");

    dado3usuario = sorteiodado(min, max);

    print("O valor do dado 3 do usuario: $dado3usuario");

    pontuacaoUser =
        soma(dado1usuario, dado2usuario, dado3usuario); //chamada da funcao Soma

    dado1computador = sorteiodado(min, max);

    print("O valor do dado 1 do computador: $dado1computador");

    dado2computador = sorteiodado(min, max);

    print("O valor do dado 2 do computador: $dado2computador");

    dado3computador = sorteiodado(min, max);

    print("O valor do dado 3 do computador: $dado3computador");

    pontuacaoComputador = soma(dado1computador, dado2computador,
        dado3computador); //chamada da funcao Soma

    pontuacaousuariodouble = pontuacaoUser.toDouble();

    if (desabilitamagico == "N") {
      print("Deseja usar  o dado magico ?");

      print("S = sim e N = nao");

      input = stdin.readLineSync()!;

      if (input == "S") {
        desabilitamagico = "S";

        dadomagico = sorteiodado(0, 1);

        print("O valor do dado magico : $dadomagico");

        switch (dadomagico) {
          case 0:
            pontuacaousuariodouble = pontuacaousuariodouble / 2.0;

            pontuacaoUser = pontuacaoUser ~/ 2;

            break;

          case 1:
            pontuacaousuariodouble = pontuacaousuariodouble * 2.0;

            pontuacaoUser = pontuacaoUser * 2;

            break;
        }
      }

      if (pontuacaousuariodouble == pontuacaoUser.toDouble()) {
        print("\n\nPontuação do usuario: $pontuacaoUser");
      } else {
        print("\n\nPontuação do usuario: $pontuacaousuariodouble");
      }

      print("Pontuação do computador: $pontuacaoComputador");
    }

    print("\n\n");

    if (pontuacaoComputador.toDouble() > pontuacaousuariodouble) {
      print("Rodada do Computador!!");

      vitoriaComputador = vitoriaComputador + 1;
    } else {
      if (pontuacaousuariodouble > pontuacaoComputador.toDouble()) {
        print("Rodada do Usuario!!");

        vitoriaUsuario = vitoriaUsuario + 1;
      } else {
        print("Empate!");
      }
    }

    print(
        "Pressione P para ver o placar, ou qualquer tecla que não seja P para continuar\n\n\n\n");

    input = stdin.readLineSync()!;

    if (input == 'P') {
      print("*****************************************************");

      print("Placar: ");

      print("Numero de vitoria do jogador: $vitoriaUsuario");

      print("Numero de vitoria do computador: $vitoriaComputador");

      print("Numero de Empates: ${i - vitoriaUsuario - vitoriaComputador + 1}");

      print("*****************************************************");

      print("Continuar pressione qualquer tecla\n\n\n\n ");

      input = stdin.readLineSync()!;
    }

    i = i + 1;
  }

  print("*****************************************************");

  print("Placar: ");

  print("Numero de vitoria do jogador: $vitoriaUsuario");

  print("Numero de vitoria do computador: $vitoriaComputador");

  print("Numero de Empates: ${i - vitoriaUsuario - vitoriaComputador}");

  print("*****************************************************");

  if (vitoriaComputador > vitoriaUsuario) {
    print("\n\n\nVITORIA DO COMPUTADOR!!");
  } else {
    if (vitoriaUsuario > vitoriaComputador) {
      print("\n\n\nVITORIA DO USUARIO!!");
    } else {
      print("\n\n\nEMPATE!");
    }
  }
}
