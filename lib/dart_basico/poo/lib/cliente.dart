class Cliente {
  String _nome;
  List<String> _quartosReservados;

  Cliente(this._nome, this._quartosReservados);

  void exibirQuartosReservados() {
    print("Quartos reservados por $_nome: $_quartosReservados");
  }

  void realizarReserva(String quarto) {
    _quartosReservados.add(quarto);
    print("Reserva realizada para o quarto: $quarto");
    exibirQuartosReservados();
  }

  void cancelarReserva(String quarto) {

    if (_quartosReservados.contains(quarto) == false) {
      print("Nenhuma reserva encontrada para o quarto: $quarto");
      return;
    }

    _quartosReservados.remove(quarto);
    print("Reserva cancelada para o quarto: $quarto");
    exibirQuartosReservados();

  }

}
