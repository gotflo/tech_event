import 'package:flutter/material.dart';

class TabBarProvider extends ChangeNotifier {
  int _currentIndex = 1;

  int get currentIndex => _currentIndex;

  set currentIndex(int newCurrentIndex) {
    _currentIndex = newCurrentIndex;
    notifyListeners();
  }
}
