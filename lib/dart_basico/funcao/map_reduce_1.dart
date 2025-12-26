main () {

  var funcionarios = [
    {'nome': 'João', 'salario': 2000.0},
    {'nome': 'Maria', 'salario': 3000.0},
    {'nome': 'Pedro', 'salario': 4000.0},
  ];

  int Function(int) dobrarSalario = (numero) => numero * 2;

  String Function(Map) pegarApenasNome = (funcionario) => funcionario['nome'];
  var nomesDosFuncionarios = funcionarios.map(pegarApenasNome);
  print(nomesDosFuncionarios.toList());

  int Function(String) qtdeDeLetras = (texto) => texto.length;
  var numeroDeLetrasPorNomeDeFuncionario = funcionarios.map(pegarApenasNome).map(qtdeDeLetras).map(dobrarSalario);
  print(numeroDeLetrasPorNomeDeFuncionario.toList());

  double Function(Map) pegarApenasOSalario = (funcionario) => funcionario['salario'];
  var salarioDosFuncionarios = funcionarios.map(pegarApenasOSalario);
  print(salarioDosFuncionarios.toList());

}