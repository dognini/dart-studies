import 'package:dart_assincronismo/models/account.dart';

enum AccountType { ambrosia, canjica, pudim, brigadeiro }

double calculateTaxesByAccount({required Account account, required double amount}) {
  const taxas = {
    AccountType.ambrosia: 0.005,
    AccountType.canjica: 0.0033,
    AccountType.pudim: 0.0025,
    AccountType.brigadeiro: 0.0001,
  };

  if (account.accountType != null && amount > 5000) {
    return amount * taxas[account.accountType as AccountType]!;
  }

  return 0.0;
}
