import 'package:localstorage/localstorage.dart';
import 'package:flutter/material.dart';

class AuthState extends ChangeNotifier {
  final _storage = LocalStorage('app_state');
  void init() async {
    await _storage.ready;
  }

  bool get loggedIn => _loggedIn;
  bool _loggedIn = true;

  bool isDeveloper = true;
}
