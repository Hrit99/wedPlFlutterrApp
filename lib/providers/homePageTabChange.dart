import 'package:flutter/material.dart';

class HomePageTabChange with ChangeNotifier {
  var _currentTab = 0;

  void changeTab(int index) {
    print("imin");
    _currentTab = index;
    notifyListeners();
  }

  int get whichTab {
    print(_currentTab);
    return _currentTab;
  }
}
