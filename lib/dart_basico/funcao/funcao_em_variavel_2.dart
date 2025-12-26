main () {

  var adicao = (int a, int b) {
    return a + b;
  };

  print(adicao(2, 3));

  var subtracao = (int a, int b) => a - b;
  print(subtracao(5, 2));

  var multiplicacao = (int a, int b) => a * b;
  print(multiplicacao(4, 3));

  var divisao = (int a, int b) => a / b;
  print(divisao(10, 2));

}