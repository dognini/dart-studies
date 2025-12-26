main () {

  String nome = 'Diogo';
  String status = 'APROVADO';
  double nota = 9.2;

  String frase1 = 'O aluno ' + nome + ' foi ' + status + ' com a nota ' + nota.toString() + '.';
  String frase2 = 'O aluno $nome foi $status com a nota $nota.';
  String frase3 = 'O aluno ${nome.toUpperCase()} foi $status com a nota $nota.';

  print(frase3);

}