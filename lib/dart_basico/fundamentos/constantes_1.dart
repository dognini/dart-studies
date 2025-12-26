import 'dart:io';

main() {

  const PI = 3.1415;

  stdout.write("Digite o valor do raio: "); 

  final String entradaDoUsuario = stdin.readLineSync()!;
  final double raio = double.parse(entradaDoUsuario);

  var area = PI * raio * raio;

  print("O valor da área é: " + area.toString());

}
