import 'lib/animal.dart';

void main() {

  Cachorro meuCachorro = new Cachorro('Rex');
  meuCachorro.emitirSom();
  meuCachorro.abanarRabo();

  Gato meuGato = new Gato('Mimi');
  meuGato.emitirSom();
  meuGato.arranhar();

}