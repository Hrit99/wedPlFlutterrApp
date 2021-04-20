import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:new_test/models/item.dart';
import '../models/category.dart';
import '../models/subcategory.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<List<Item>> getAllItems(String category, String subcategory) async {
  List<Item> allItems = List<Item>();
  var resp;

  final prefs = await SharedPreferences.getInstance();
  // FileCache fileCache = await FileCache.fromDefault();
  // var data = await fileCache
  //     .getJson('https://safe-springs-56633.herokuapp.com/api/category');
  // print(jsonDecode(data['response']));
  String itemCache = category + subcategory;
  String cacheRes = prefs.getString('$itemCache') ?? null;
  print("li;");
  print(cacheRes);
  if (prefs.getBool("reload")) {
    cacheRes = null;
  }
  if (cacheRes == null) {
    print("gi;");

    await http
        .post(
      'https://safe-springs-56633.herokuapp.com/api/item',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'category': category,
        'subcategory': subcategory,
      }),
    )
        .then((response) {
      if (response.statusCode == 200) {
        prefs.setString('$itemCache', response.body.toString());
        print(response.body.toString());
        resp = response.body.toString();
      } else {
        resp = null;
        print("kdk");
      }
    }).catchError((err) {
      print(err);
      resp = null;
    });
  } else {
    resp = cacheRes;
  }
  print("ki;");
  print(resp);
  var response = jsonDecode(resp);
  List items = response['response'];
  for (var item in items) {
    // List subcategories = _getListSubcategories(category);
    Item oneItem = Item(
      itemId: item['_id'],
      name: item['name'],
      mediaUrl: item['mediaUrl'],
      details: item['details'],
    );
    allItems.add(oneItem);
  }
  for (var ite in allItems) {
    print(ite.name);
  }
  return allItems;
}

// List<Subcategory> _getListSubcategories(var category) {
//   List<Subcategory> subcategories = List<Subcategory>();
//   List<Item> items;
//   for (var subcategory in category['subcategories']) {
//     subcategories.add(Subcategory(
//         subcategoryId: subcategory['_id'],
//         subcategory: subcategory['subcategory'],
//         items: items));
//   }
//   return subcategories;
// }
