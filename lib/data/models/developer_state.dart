import 'package:localstorage/localstorage.dart';
import 'package:flutter/material.dart';

class DeveloperState extends ChangeNotifier {
  final _storage = LocalStorage('app_state');
  void init() async {
    await _storage.ready;
  }
}
