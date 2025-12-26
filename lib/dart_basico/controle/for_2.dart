main () {

  Map<String, double> notas = {
    'Ana': 8.9,
    'Bia': 9.3,
    'Carlos': 7.8,
    'Daniel': 6.9,
    'Rebeca': 9.1
  };

  for (String nome in notas.keys) {
    // print('O nome do aluno é $nome e a sua nota é ${notas[nome]}');
  }

  for (var registro in notas.entries) {
    print('O nome do aluno é ${registro.key} tem nota ${registro.value}');
  }

}