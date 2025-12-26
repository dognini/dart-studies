main () {

  int Function(int, int) soma1 = somaFN;
  print(soma1(2, 3));

  int Function(int, int) soma2 = (int x, int y) {
    return x + y;
  };

  print(soma2(4, 5));

}

int somaFN(int a, int b) {
  return a + b;
}