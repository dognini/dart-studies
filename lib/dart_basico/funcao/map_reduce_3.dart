main() {

  final funcionarios = [
    {'nome': 'João', 'salario': 2000.0},
    {'nome': 'Maria', 'salario': 3000.0},
    {'nome': 'Pedro', 'salario': 4000.0},
  ];

  final salariosValidos = funcionarios
    .map((f) => f['salario'] as double)
    .where((salario) => salario > 2000.0)
    .toList();

  final media = salariosValidos.reduce((a, b) => a + b) / salariosValidos.length;

  print("A média salarial é: $media");

}