import 'dart:math';

main() {

  int n1 = numeroAleatorio();
  print("Número 1: $n1");

  int n2 = numeroAleatorio(50);
  print("Número 2: $n2");

  if (n1 == n2) {
    print("Números iguais");
  }

  int dia = numeroAleatorio(31);
  int mes = numeroAleatorio(12);
  int ano = 1970 + numeroAleatorio(1000);
  String data = imprimirData("Aniversario", dia, mes, ano);
  print(data);

}

int numeroAleatorio([int max = 11]) {
  return Random().nextInt(max);
}

String imprimirData(String teste, [int dia = 1, int mes = 1, int ano = 1970]) {
  return "$teste: $dia/$mes/$ano";
}