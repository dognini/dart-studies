main () {

  List<int> numeros = [];
  Map<int, int> mapa = {};

  for (int a = 50; a > 0; a -= 4) {
    mapa[a] = a;
    numeros.add(a);
  }

  print(mapa);

}