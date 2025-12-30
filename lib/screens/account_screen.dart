import 'dart:io';

import 'package:http/http.dart';
import 'package:dart_assincronismo/models/account.dart';
import 'package:dart_assincronismo/models/transaction.dart';
import 'package:dart_assincronismo/services/account_service.dart';
import 'package:dart_assincronismo/services/transaction_service.dart';
import 'package:dart_assincronismo/exceptions/transaction_exceptions.dart';

class AccountScreen {
  final AccountService _accountService = AccountService();
  final TransactionService _transactionService = TransactionService();

  void initializeStream() {
    _accountService.streamInfos.listen((String event) {
      print(event);
    });
  }

  void runChatBot() async {
    print("Bom dia! Eu sou Lewis, assistente do Banco d'Ouro!");
    print("Que bom te ver aqui com a gente.\n");

    bool isRunning = true;

    while (isRunning) {
      print("Como eu posso te ajudar? (Digite o número desejado)");
      print("1 - Ver todas as contas");
      print("2 - Adicionar nova conta");
      print("3 - Executar uma transação");
      print("4 - Consultar histórico de transações");
      print("5 - Sair");

      String? input = stdin.readLineSync();

      if (input != null) {
        switch (input) {
          case "1":
            {
              await _getAllAccounts();
              break;
            }
          case "2":
            {
              await _addExampleAccount();
              break;
            }
          case "3":
            {
              await _executeTransaction();
              break;
            }
          case "4":
            {
              await _showTransactionHistory();
              break;
            }
          case "5":
            {
              isRunning = false;
              print("Obrigado por usar nossos serviços. Até mais!");
              break;
            }
          default:
            {
              print("Não entendi sua solicitação. Tente novamente.\n");
            }
        }
      }
    }
  }

  Future<void> _getAllAccounts() async {
    try {
      List<Account> listAccounts = await _accountService.getAll();
      print(listAccounts);
    } on ClientException catch (clientException) {
      print("Não foi possível conectar ao servidor.");
      print("Tente novamente mais tarde.\n");
      print(clientException.message);
      print(clientException.uri);
    } on Exception {
      print("Não consegui recuperar as contas.");
      print("Tente novamente mais tarde.\n");
    } finally {
      print("${DateTime.now()} | Ocorreu uma tentativa de consulta de contas.\n");
    }
  }

  Future<void> _addExampleAccount() async {
    try {
      Account example = Account(
        id: "ID555",
        name: "Haley",
        lastName: "Chirivia",
        balance: 8000.0,
        accountType: "Brigadeiro",
      );
      await _accountService.addAccount(example);
    } on Exception {
      print("ocorreu um erro ao tentar adicionar a conta.\n");
    }
  }

  Future<void> _executeTransaction() async {
    try {
      print("\n=== EXECUTAR TRANSAÇÃO ===");

      List<Account> listAccounts = await _accountService.getAll();

      if (listAccounts.isEmpty) {
        print("Nenhuma conta disponível no sistema.\n");
        return;
      }

      print("\nContas disponíveis:");
      for (Account account in listAccounts) {
        print(
          "ID: ${account.id} - ${account.name} ${account.lastName} - Saldo: R\$ ${account.balance.toStringAsFixed(2)}",
        );
      }

      print("\nDigite o ID da conta REMETENTE:");
      String? senderId = stdin.readLineSync();

      if (senderId == null || senderId.isEmpty) {
        print("ID do remetente inválido.\n");
        return;
      }

      print("Digite o ID da conta DESTINATÁRIO:");
      String? receiverId = stdin.readLineSync();

      if (receiverId == null || receiverId.isEmpty) {
        print("ID do destinatário inválido.\n");
        return;
      }

      if (senderId == receiverId) {
        print("O remetente e destinatário não podem ser a mesma conta.\n");
        return;
      }

      print("Digite o valor a ser transferido:");
      String? amountStr = stdin.readLineSync();

      if (amountStr == null || amountStr.isEmpty) {
        print("Valor inválido.\n");
        return;
      }

      double? amount = double.tryParse(amountStr);

      if (amount == null || amount <= 0) {
        print("Valor inválido. Digite um número positivo.\n");
        return;
      }

      print("\nProcessando transação...");
      await _transactionService.makeTransaction(
        idSender: senderId,
        idReceiver: receiverId,
        amount: amount,
      );

      print("Transação realizada com sucesso!");
      print("Valor transferido: R\$ ${amount.toStringAsFixed(2)}\n");
    } on SenderNotExistsException catch (e) {
      print("\nErro: ${e.message}");
      print("Verifique se o ID do remetente está correto.\n");
    } on ReceiverNotExistsException catch (e) {
      print("\nErro: ${e.message}");
      print("Verifique se o ID do destinatário está correto.\n");
    } on InsufficientFundsException catch (e) {
      print("\nErro: ${e.message}");
      print("${e.cause.name} possui saldo de R\$ ${e.cause.balance.toStringAsFixed(2)}.");
      print(
        "O valor necessário é R\$ ${(e.amount + e.taxes).toStringAsFixed(2)} (incluindo taxas de R\$ ${e.taxes.toStringAsFixed(2)}).\n",
      );
    } on FormatException {
      print("\nErro: Valor digitado não é um número válido.\n");
    } on ClientException catch (e) {
      print("\nErro de conexão: Não foi possível conectar ao servidor.");
      print("Tente novamente mais tarde.\n");
      print("Detalhes: ${e.message}\n");
    } on Exception catch (e) {
      print("\nErro inesperado ao executar a transação.");
      print("Detalhes: $e\n");
    } finally {
      print("${DateTime.now()} | Tentativa de transação registrada.\n");
    }
  }

  Future<void> _showTransactionHistory() async {
    try {
      print("\n=== HISTÓRICO DE TRANSAÇÕES ===\n");

      List<Transaction> listTransactions = await _transactionService.getAll();

      if (listTransactions.isEmpty) {
        print("Nenhuma transação encontrada no histórico.\n");
        return;
      }

      print("Total de transações: ${listTransactions.length}\n");

      listTransactions.sort((a, b) => b.date.compareTo(a.date));

      for (Transaction transaction in listTransactions) {
        print("─" * 50);
        print("ID da Transação: ${transaction.id}");
        print(
          "Data: ${transaction.date.day.toString().padLeft(2, '0')}/${transaction.date.month.toString().padLeft(2, '0')}/${transaction.date.year} às ${transaction.date.hour.toString().padLeft(2, '0')}:${transaction.date.minute.toString().padLeft(2, '0')}",
        );
        print("Remetente: ${transaction.senderAccountId}");
        print("Destinatário: ${transaction.receiverAccountId}");
        print("Valor: R\$ ${transaction.amount.toStringAsFixed(2)}");
        print("Taxas: R\$ ${transaction.taxes.toStringAsFixed(2)}");
        print("Total: R\$ ${(transaction.amount + transaction.taxes).toStringAsFixed(2)}");
      }

      print("─" * 50);
      print("");
    } on ClientException catch (e) {
      print("\nErro de conexão: Não foi possível conectar ao servidor.");
      print("Tente novamente mais tarde.\n");
      print("Detalhes: ${e.message}\n");
    } on Exception catch (e) {
      print("\nErro ao consultar histórico de transações.");
      print("Detalhes: $e\n");
    } finally {
      print("${DateTime.now()} | Consulta de histórico de transações registrada.\n");
    }
  }
}
