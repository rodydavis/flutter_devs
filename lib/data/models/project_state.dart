// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dart_firebase/api.dart';
import 'package:flutter_devs/data/classes/project.dart';
import 'package:localstorage/localstorage.dart';
import 'package:flutter/material.dart';

import '../../app.dart';

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
        description:
            'Just need a basic snapchat filter to brand our buisness.'));
    _project.add(Project(
        name: 'Firebase Integration',
        bounty: 100.00,
        hours: 2,
        openSourced: true,
        dateCreated: DateTime.now().subtract(Duration(days: 1)),
        description:
            'We want to integrate with Firebase for our login auth flow.'));
    _project.add(Project(
        name: 'Login Screen',
        bounty: 10.00,
        hours: 1,
        openSourced: false,
        dateCreated: DateTime.now().subtract(Duration(days: 5)),
        description:
            'We want to update our login screen to look modern and add social media integration.'));
    _project.add(Project(
        name: 'Fluid UI Redesign',
        bounty: 800.00,
        hours: 10,
        openSourced: true,
        dateCreated: DateTime.now().subtract(Duration(days: 2)),
        description:
            'We need help making our app responsive to multiple screen sizes.'));
    _project.add(Project(
        name: 'Redux Backend Refactor',
        bounty: 1200.00,
        hours: 20,
        openSourced: false,
        dateCreated: DateTime.now().subtract(Duration(days: 14)),
        description:
            'We want to transition our buisness logic to using redux and have the ability to use time travel to replay events.'));
    _project.add(Project(
        name: 'Offline Extension',
        bounty: 300.00,
        hours: 8,
        openSourced: true,
        dateCreated: DateTime.now().subtract(Duration(days: 3)),
        description:
            'We want to add offline capability to our app and give the user data when they start the app.'));

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

  void add(Project value) {
    _project.add(value);
    notifyListeners();
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
