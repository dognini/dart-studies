class Animal {
  String animal;

  Animal(this.animal);

  void emitirSom() {
    print('O $animal está emitindo som');
  }
}

class Cachorro extends Animal {

  Cachorro(super.animal);

  @override
  void emitirSom() {
    print('O $animal está latindo');
  }

  void abanarRabo() {
    print('O $animal está abanando o rabo');
  }

}

class Gato extends Animal {

  Gato(super.animal);

  @override
  void emitirSom() {
    print('O $animal está miando');
  }

  void arranhar() {
    print('O $animal está arranhando');
  }

}