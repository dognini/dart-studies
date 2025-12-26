import 'dart:math';

main () {
  int resultado = somar(2, 3);
  int resultadoAleatorio = somarNumerosAleatorios();

  print('O resultado aleatório é $resultadoAleatorio');
  print('O resultado da soma é $resultado');
}

int somar (int a, int b) {
  return a + b;
}

int somarNumerosAleatorios() {
  int a = Random().nextInt(100);
  int b = Random().nextInt(100);
  return somar(a, b);
}