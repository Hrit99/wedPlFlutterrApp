import 'package:flutter/material.dart';
import './item.dart';

class Subcategory {
  String subcategoryId;
  String subcategory;
  List<Item> items;
  Subcategory(
      {@required this.subcategoryId,
      @required this.subcategory,
      @required this.items});

  // Subcategory.fromJSON(Map<String, dynamic> json)
  //     : subcategoryId = json['_id'],
  //       subcategory = json['subcategory'],
  //       items = ;

  Map<String, dynamic> toJson() => {
        '_id': subcategoryId,
        'subcategory': subcategory,
        'items': items,
      };
}
