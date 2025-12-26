abstract class Conta {
  String _titular;
  double _saldo;

  Conta(this._titular, this._saldo);

  void receber(double valor) {
    _saldo += valor;
  }

  void enviar(double valor) {
    if (_saldo >= valor) {
      _saldo -= valor;
    }
  }

  void imprimirSaldo() {
    print("O saldo atual de $_titular, é: R\$: $_saldo");
  }
}

class ContaCorrente extends Conta {
  double emprestimo = 300.0;

  ContaCorrente(super._titular, super._saldo);

  @override
  void enviar(double valor) {
    if (_saldo + emprestimo >= valor) {
      _saldo -= valor;
      imprimirSaldo();
    }
  }
}

class ContaPoupanca extends Conta {
  double rendimento = 0.05;

  ContaPoupanca(super._titular, super._saldo);

  void calculaRendimento() {
    _saldo += _saldo * rendimento;
  }
}

class ContaSalario extends Conta {
  String cnpjDaEmpresa;
  String nomeEmpresa;

  ContaSalario(
    super._titular,
    super._saldo,
    this.cnpjDaEmpresa,
    this.nomeEmpresa,
  );

  @override
  void imprimirSaldo() {
    print(
      'O salário da $nomeEmpresa, de CNPJ: $cnpjDaEmpresa no valor de R\$: $_saldo, foi depositado para o titular $_titular.',
    );
  }
}

mixin Imposto {
  double taxa = 0.03;

  double valortaxado(double valor) {
    return valor * taxa;
  }
}

class ContaEmpresa extends Conta with Imposto {
  ContaEmpresa(super._titular, super._saldo);

  @override
  void enviar(double valor) {
    if (_saldo >= valor + valortaxado(valor)) {
      _saldo -= valor + valortaxado(valor);
    }
  }

  @override
  void receber(double valor) {
    _saldo += valor - valortaxado(valor);
  }
}

class ContaInvestimento extends Conta with Imposto {
  ContaInvestimento(super._titular, super._saldo);

  @override
  void enviar(double valor) {
    if (_saldo >= valor + valortaxado(valor)) {
      _saldo -= valor + valortaxado(valor);
    }
  }

  @override
  void receber(double valor) {
    _saldo += valor - valortaxado(valor);
  }
}
