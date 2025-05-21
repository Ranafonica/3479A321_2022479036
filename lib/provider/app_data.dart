import 'package:flutter/material.dart';

class AppData extends ChangeNotifier {
  int _counter = 0;
  String _userName = 'Martin';
  bool _allowReset = true;

  int get counter => _counter;
  String get userName => _userName;
  bool get allowReset => _allowReset;

  void incrementCounter() {
    _counter++;
    notifyListeners();
  }

  void decrementCounter() {
    _counter--;
    notifyListeners();
  }

  void resetCounter() {
    if (_allowReset) {
      _counter = 0;
      notifyListeners();
    }
  }

  void setUserName(String name) {
    _userName = name;
    notifyListeners();
  }

  void setAllowReset(bool value) {
    _allowReset = value;
    notifyListeners();
  }
}

