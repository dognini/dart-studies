main() {

  double nota = 6.50.roundToDouble();
  print(nota);

  String s1 = "Diogo Dognini";
  String s2 = s1.substring(0, 8);
  String s3 = s2.toUpperCase();
  String s4 = s3.padRight(15, "!");

  String v5 = "Diogo Dognini".substring(0, 8).toUpperCase().padRight(15, "!");

  print(v5);

}
