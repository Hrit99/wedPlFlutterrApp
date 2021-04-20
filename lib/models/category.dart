import 'package:flutter/material.dart';
import './subcategory.dart';

class Category {
  String categoryId;
  String category;
  List<Subcategory> subcategories;
  Category(
      {@required this.categoryId,
      @required this.category,
      @required this.subcategories});

  Category.fromJSON(Map<String, dynamic> json)
      : categoryId = json['_id'],
        category = json['category'],
        subcategories = json['subcategories'];

  Map<String, dynamic> toJson() => {
        '_id': categoryId,
        'category': category,
        'subcategories': getSubcategoriesJson,
      };

  List<Map<String, dynamic>> getSubcategoriesJson() {
    List s = List();
    for (var subcategory in subcategories) {
      s.add(subcategory.toJson());
    }
    return s;
  }
}
