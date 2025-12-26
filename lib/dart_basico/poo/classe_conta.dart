import 'lib/conta.dart';

void main() {
  ContaCorrente chris = new ContaCorrente("chris", 4000.0);
  ContaPoupanca denize = new ContaPoupanca("Denize", 4000.0);
  ContaEmpresa empresaX = new ContaEmpresa("Empresa X", 10000.0);
  ContaInvestimento felipe = new ContaInvestimento("Felipe", 5000.0);
  ContaSalario catarina = new ContaSalario(
    "Catarina",
    3000.0,
    "00.000.000/0001-00",
    "Empresa X",
  );
}
