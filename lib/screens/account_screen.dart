import 'dart:io';

import 'package:http/http.dart';
import 'package:dart_assincronismo/models/account.dart';
import 'package:dart_assincronismo/services/account_service.dart';

class AccountScreen {
  final AccountService _accountService = AccountService();

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
      print("3 - Sair");

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
    Account example = Account(id: "ID555", name: "Haley", lastName: "Chirivia", balance: 8000.0);
    await _accountService.addAccount(example);
  }
}
