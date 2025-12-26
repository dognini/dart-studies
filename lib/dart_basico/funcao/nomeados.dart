main() {
  String saudar = saudarPessoa(nome: 'Diogo', idade: 19);
  print(saudar);
}

String saudarPessoa({required String nome, required int idade}) {
  return "Olá $nome, nem parece que você tem $idade anos";
}

String saudarPessoa2(String nome, int idade) {
  return "Olá $nome, nem parece que você tem $idade anos";
}