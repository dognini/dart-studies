List<T> filtrar<T>(List<T> lista, bool Function(T) fn) {

  List<T> listaFiltrada = [];

  for (T item in lista) {
    if(fn(item)) {
      listaFiltrada.add(item);
    }
  }

  return listaFiltrada;

}

main () {

  var notas = [9.5, 7.8, 6.3, 8.0, 5.4, 10.0];
  var notasBoasFn = (double nota) => nota >= 8.0;

  print(filtrar<double>(notas, notasBoasFn));

  var nomes = ['Ana', 'Bia', 'Carlos', 'Daniel', 'Gui', 'Rebeca'];
  var nomesGrandesFn = (String nome) => nome.length >= 5;

  print(filtrar<String>(nomes, nomesGrandesFn));
  print(nomes.where(nomesGrandesFn).toList());

}