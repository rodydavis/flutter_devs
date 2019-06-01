import 'package:flutter_devs/data/classes/project.dart';
import 'package:localstorage/localstorage.dart';
import 'package:flutter/material.dart';

class ProjectState extends ChangeNotifier {
  final _storage = LocalStorage('app_state');
  void init() async {
    await _storage.ready;
    _project.add(Project(
      name: 'Snapchat Filter',
      bounty: 20.00,
      hours: 3,
      openSourced: true,
      dateCreated: DateTime.now(),
    ));
    _project.add(Project(
      name: 'Firebase Integration',
      bounty: 100.00,
      hours: 2,
      openSourced: true,
      dateCreated: DateTime.now().subtract(Duration(days: 1)),
    ));
    _project.add(Project(
      name: 'Login Screen',
      bounty: 10.00,
      hours: 1,
      openSourced: false,
      dateCreated: DateTime.now().subtract(Duration(days: 5)),
    ));
    _project.add(Project(
      name: 'Fluid UI Redesign',
      bounty: 800.00,
      hours: 10,
      openSourced: true,
      dateCreated: DateTime.now().subtract(Duration(days: 2)),
    ));
    _project.add(Project(
      name: 'Redux Backend Refactor',
      bounty: 1200.00,
      hours: 20,
      openSourced: false,
      dateCreated: DateTime.now().subtract(Duration(days: 14)),
    ));
    _project.add(Project(
      name: 'Offline Extension',
      bounty: 300.00,
      hours: 8,
      openSourced: true,
      dateCreated: DateTime.now().subtract(Duration(days: 3)),
    ));

    notifyListeners();
  }

  List<Project> _project = [];
  List<Project> get projects => _project;

  bool _accending = false;
  bool get accending => _accending;
  SortValue _field = SortValue.date;
  SortValue get field => _field;

  void changeAccending(bool value) {
    _accending = value;
    _sort();
  }

  void changeField(SortValue value) {
    _field = value;
    _sort();
  }

  void _sort() {
    switch (field) {
      case SortValue.date:
        if (accending) {
          _project.sort((a, b) => b.dateCreated.compareTo(a.dateCreated));
        } else {
          _project.sort((a, b) => a.dateCreated.compareTo(b.dateCreated));
        }
        break;
      case SortValue.hours:
        if (accending) {
          _project.sort((a, b) => b.hours.compareTo(a.hours));
        } else {
          _project.sort((a, b) => a.hours.compareTo(b.hours));
        }
        break;
      case SortValue.price:
        if (accending) {
          _project.sort((a, b) => b.bounty.compareTo(a.bounty));
        } else {
          _project.sort((a, b) => a.bounty.compareTo(b.bounty));
        }
        break;
      default:
    }
    notifyListeners();
  }
}

enum SortValue { date, hours, price }
