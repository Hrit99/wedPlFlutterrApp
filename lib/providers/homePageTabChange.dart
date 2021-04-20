import 'package:flutter/material.dart';
import 'package:new_test/models/category.dart';

class HomePageTabChange with ChangeNotifier {
  var _currentTabId = "";
  Category _currentTab;

  String get whichTab {
    print(_currentTabId);
    return _currentTabId;
  }

  Category get whichCategory {
    return _currentTab;
  }

  void updateTabBox(Category category, bool notify) {
    _currentTabId = category.categoryId;
    _currentTab = category;
    if (notify) notifyListeners();
  }
}
