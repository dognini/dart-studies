main() {

  int a = 2;
  int b = 6;
  int resultado = a +b;

  print(resultado);
  print (a - b);
  print (a * b);
  print (a / b);
  print (a % b);

  bool ehFragil = true;
  bool ehCaro = false;

  print (ehFragil && ehCaro); // AND -> E
  print (ehFragil || ehCaro); // OR -> OU
  print (ehFragil ^ ehCaro); // XOR -> OU exclusivo
  print (!ehFragil); // NOT -> Negação 

}