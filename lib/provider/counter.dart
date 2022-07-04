import 'package:flutter/material.dart';

class Counter extends ChangeNotifier {
  var count = 0;

  int get getCounter {
    return count;
  }

  void incrementCounter() {
    count += 1;
    notifyListeners();
  }
}
