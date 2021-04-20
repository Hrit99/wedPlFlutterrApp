import 'package:flutter/material.dart';
import 'package:new_test/models/subcategory.dart';

class HomePageSubTabChange with ChangeNotifier {
  var _currentSubTabId = "";
  Subcategory _currentSubTab;

  String get whichSubTab {
    print(_currentSubTabId);
    return _currentSubTabId;
  }

  Subcategory get whichSubcategory {
    return _currentSubTab;
  }

  void updateSubTabBox(Subcategory subcategory, bool notify) {
    _currentSubTabId = subcategory.subcategoryId;
    _currentSubTab = subcategory;
    if (notify) notifyListeners();
  }
}
