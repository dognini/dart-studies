import 'dart:math';

void executar(Function fnPar, Function fnImpar) {
  Random().nextInt(10) % 2 == 0 ? fnPar() : fnImpar();
}

main() {
  var minhaFnPar = () => print('Número par!');
  var minhaFnImpar = () => print('Número ímpar!');

  executar(minhaFnPar, minhaFnImpar);
}
