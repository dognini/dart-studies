import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';
import 'package:dart_assincronismo/api_key.dart';
import 'package:dart_assincronismo/models/account.dart';

class AccountService {
  final String url = urlApi;

  final StreamController<String> _streamController = StreamController<String>();
  Stream<String> get streamInfos => _streamController.stream;

  Future<List<Account>> getAll() async {
    Response response = await get(Uri.parse(url));

    _streamController.add("${DateTime.now()} - Requisição de leitura");

    Map<String, dynamic> mapResponse = json.decode(response.body);
    List<dynamic> listDynamic = mapResponse['files']['accounts.json']['content'] != null
        ? json.decode(mapResponse['files']['accounts.json']['content'])
        : [];

    List<Account> listAccounts = [];

    for (dynamic dyn in listDynamic) {
      Map<String, dynamic> mapAccount = dyn as Map<String, dynamic>;
      Account account = Account.fromMap(mapAccount);
      listAccounts.add(account);
    }

    return listAccounts;
  }

  Future<void> addAccount(Account account) async {
    List<Account> listAccounts = await getAll();
    listAccounts.add(account);
    save(listAccounts, accountName: account.name);
  }

  Future<void> save(List<Account> listAccounts, {String accountName = ""}) async {
    List<Map<String, dynamic>> listContent = [];

    for (Account account in listAccounts) {
      listContent.add(account.toMap());
    }

    String content = json.encode(listContent);

    Response response = await post(
      Uri.parse(url),
      headers: {"Authorization": "Bearer $githubApiKey"},
      body: json.encode({
        "description": "accounts.json",
        "public": true,
        "files": {
          "accounts.json": {"content": content},
        },
      }),
    );

    if (response.statusCode.toString()[0] == "2") {
      _streamController.add("${DateTime.now()} - Requisição de escrita bem sucedida!)");
    } else {
      _streamController.add("${DateTime.now()} - Requisição de escrita falhou.");
    }
  }

  Future<Account?> getAccountById(String id) async {
    List<Account> listAccounts = await getAll();

    _streamController.add("${DateTime.now()} - Buscando conta com id: $id");

    try {
      return listAccounts.firstWhere((account) => account.id == id);
    } catch (e) {
      _streamController.add("${DateTime.now()} - Conta com id $id não encontrada");
      return null;
    }
  }

  Future<bool> updateAccount(Account account) async {
    List<Account> listAccounts = await getAll();

    int index = listAccounts.indexWhere((acc) => acc.id == account.id);

    if (index == -1) {
      _streamController.add(
        "${DateTime.now()} - Conta com id ${account.id} não encontrada para atualização",
      );

      return false;
    }

    listAccounts[index] = account;

    List<Map<String, dynamic>> listContent = [];

    for (Account acc in listAccounts) {
      listContent.add(acc.toMap());
    }

    String content = json.encode(listContent);

    Response response = await post(
      Uri.parse(url),
      headers: {"Authorization": "Bearer $githubApiKey"},
      body: json.encode({
        "description": "accounts.json",
        "public": true,
        "files": {
          "accounts.json": {"content": content},
        },
      }),
    );

    if (response.statusCode.toString()[0] == "2") {
      _streamController.add("${DateTime.now()} - Atualização bem sucedida! (${account.name})");

      return true;
    } else {
      _streamController.add("${DateTime.now()} - Atualização falhou. (${account.name})");

      return false;
    }
  }

  Future<bool> deleteAccount(String id) async {
    List<Account> listAccounts = await getAll();

    int index = listAccounts.indexWhere((account) => account.id == id);

    if (index == -1) {
      _streamController.add("${DateTime.now()} - Conta com id $id não encontrada para remoção");

      return false;
    }

    Account removedAccount = listAccounts.removeAt(index);

    List<Map<String, dynamic>> listContent = [];

    for (Account account in listAccounts) {
      listContent.add(account.toMap());
    }

    String content = json.encode(listContent);

    Response response = await post(
      Uri.parse(url),
      headers: {"Authorization": "Bearer $githubApiKey"},
      body: json.encode({
        "description": "accounts.json",
        "public": true,
        "files": {
          "accounts.json": {"content": content},
        },
      }),
    );

    if (response.statusCode.toString()[0] == "2") {
      _streamController.add("${DateTime.now()} - Remoção bem sucedida! (${removedAccount.name})");
      return true;
    } else {
      _streamController.add("${DateTime.now()} - Remoção falhou. (${removedAccount.name})");
      return false;
    }
  }
}
