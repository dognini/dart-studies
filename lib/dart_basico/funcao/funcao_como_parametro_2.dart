int executarPor(int qtde, Function(String) fn, String valor) {

  String textoCompleto = '';

  for (int i = 0; i < qtde; i++) {
    textoCompleto += fn(valor);
  }

  return textoCompleto.length;

}

main() {

  var meuPrint = (String valor) {
    print(valor);
    return valor;
  };

  int tamanho = executarPor(10, meuPrint, 'Diogo é lindo e o Juan viadinho');
  print('O tamanho da string é: $tamanho');

}