import 'dart:math';

main () {

  var nota = Random().nextInt(11);
  print("Nota sorteada: $nota");

  switch (nota) {
    case 10:
    case 9:
      print("Quadro de Honra");
      break;
    case 8:
    case 7:
      print("Aprovado");
      break;
    case 6:
    case 5:
      print("Recuperação");
      break;
    default:
      print("Reprovado");
  }

}