import 'package:dart_assincronismo/models/account.dart';

class SenderNotExistsException implements Exception {
  final String message;
  SenderNotExistsException({this.message = "O Remetente não existe."});
}

class ReceiverNotExistsException implements Exception {
  final String message;
  ReceiverNotExistsException({this.message = "O Destinatário não existe."});
}

class InsufficientFundsException implements Exception {
  String message;
  Account cause;
  double amount;
  double taxes;

  InsufficientFundsException({
    this.message = "Fundos insuficientes para completar a transação.",
    required this.cause,
    required this.amount,
    required this.taxes,
  });
}
