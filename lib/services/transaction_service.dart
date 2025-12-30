import 'dart:math';
import 'dart:convert';

import 'package:http/http.dart';
import 'package:dart_assincronismo/api_key.dart';
import 'package:dart_assincronismo/models/account.dart';
import 'package:dart_assincronismo/models/transaction.dart';
import 'package:dart_assincronismo/helpers/helper_taxes.dart';
import 'package:dart_assincronismo/services/account_service.dart';
import 'package:dart_assincronismo/exceptions/transaction_exceptions.dart';

class TransactionService {
  final String url = urlApi;
  final AccountService _accountService = AccountService();

  Future<List<Transaction>> getAll() async {
    Response response = await get(Uri.parse(url));

    Map<String, dynamic> mapResponse = json.decode(response.body);

    if (mapResponse["files"]["transactions.json"] == null) {
      return [];
    }

    List<dynamic> listDynamic = json.decode(mapResponse["files"]["transactions.json"]["content"]);

    List<Transaction> listTransactions = [];

    for (dynamic dyn in listDynamic) {
      Map<String, dynamic> mapTrans = dyn as Map<String, dynamic>;
      Transaction transaction = Transaction.fromMap(mapTrans);
      listTransactions.add(transaction);
    }

    return listTransactions;
  }

  Future<void> addTransaction(Transaction transaction) async {
    List<Transaction> listTransactions = await getAll();
    listTransactions.add(transaction);
    save(listTransactions);
  }

  Future<void> save(List<Transaction> listTransactions) async {
    List<Map<String, dynamic>> listMaps = [];

    for (Transaction trans in listTransactions) {
      listMaps.add(trans.toMap());
    }

    String content = json.encode(listMaps);

    await post(
      Uri.parse(url),
      headers: {"Authorization": "Bearer $githubApiKey"},
      body: json.encode({
        "description": "accounts.json",
        "public": true,
        "files": {
          "transactions.json": {"content": content},
        },
      }),
    );
  }

  Future<void> makeTransaction({
    required String idSender,
    required String idReceiver,
    required double amount,
  }) async {
    List<Account> listAccounts = await _accountService.getAll();

    if (listAccounts.where((acc) => acc.id == idSender).isEmpty) {
      throw SenderNotExistsException();
    }

    Account senderAccount = listAccounts.firstWhere((acc) => acc.id == idSender);

    if (listAccounts.where((acc) => acc.id == idReceiver).isEmpty) {
      throw ReceiverNotExistsException();
    }

    Account receiverAccount = listAccounts.firstWhere((acc) => acc.id == idReceiver);

    double taxes = calculateTaxesByAccount(account: senderAccount, amount: amount);

    if (senderAccount.balance < amount + taxes) {
      throw InsufficientFundsException(cause: senderAccount, amount: amount, taxes: taxes);
    }

    senderAccount.balance -= (amount + taxes);
    receiverAccount.balance += amount;

    listAccounts[listAccounts.indexWhere((acc) => acc.id == senderAccount.id)] = senderAccount;
    listAccounts[listAccounts.indexWhere((acc) => acc.id == receiverAccount.id)] = receiverAccount;

    Transaction transaction = Transaction(
      id: (Random().nextInt(89999) + 10000).toString(),
      senderAccountId: senderAccount.id,
      receiverAccountId: receiverAccount.id,
      date: DateTime.now(),
      amount: amount,
      taxes: taxes,
    );

    await _accountService.save(listAccounts);
    await addTransaction(transaction);
  }
}
