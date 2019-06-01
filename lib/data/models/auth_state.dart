import 'package:localstorage/localstorage.dart';
import 'package:flutter/material.dart';

class AuthState extends ChangeNotifier {
  final _storage = LocalStorage('app_state');
  void init() async {
    await _storage.ready;
  }

  Account _account;
  Account get account => _account;

  bool get loggedIn => _account != null;

  bool get isDeveloper => _account != null && _account.developer;

  void login(bool developer) {
    _account = Account(
      name: 'Rody Davis',
      email: 'rody.davis.jr@gmail.com',
      developer: developer,
    );
    notifyListeners();
  }

  void logout() {
    _account = null;
    notifyListeners();
  }
}

class Account {
  Account({
    @required this.name,
    @required this.email,
    @required this.developer,
  });
  final String name;
  final String email;
  final bool developer;
}
