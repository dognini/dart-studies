import 'lib/cliente.dart';

void main () {
  Cliente diogo = Cliente("Diogo", []);
  diogo.realizarReserva("Quarto 101");
  diogo.realizarReserva("Quarto 202");
  diogo.cancelarReserva("Quarto 101");
}