import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:new_test/apis/itemsApi.dart';
import 'package:new_test/apis/reloadCheckApi.dart';
import 'package:new_test/models/item.dart';
import '../models/category.dart';
import '../models/subcategory.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<List<Category>> getAllCategories() async {
  print("enter dc");
  List<Category> allCategories = List<Category>();
  var resp;
  final prefs = await SharedPreferences.getInstance();
  print("prefs end");

  var username = prefs.getString('username') ?? null;
  await reloadCheck(username: username);
  print("reloadc ends");

  // FileCache fileCache = await FileCache.fromDefault();
  // var data = await fileCache
  //     .getJson('https://safe-springs-56633.herokuapp.com/api/category');
  // print(jsonDecode(data['response']));
  String cacheRes = prefs.getString('categoryRes') ?? null;
  print("l;");
  print(cacheRes);
  print(prefs.getBool("reload"));
  if (prefs.getBool("reload")) {
    cacheRes = null;
  }
  if (cacheRes == null) {
    print("g;");
    await http
        .get('https://safe-springs-56633.herokuapp.com/api/category')
        .then((response) {
      if (response.statusCode == 200) {
        prefs.setString('categoryRes', response.body.toString());
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
  print("k;");
  print(resp);
  var response = jsonDecode(resp);
  List categories = response['response'];
  for (var category in categories) {
    List subcategories;
    await _getListSubcategories(category).then((value) {
      subcategories = value;
    });
    Category oneCategory = Category(
        categoryId: category['_id'],
        category: category['category'],
        subcategories: subcategories);
    allCategories.add(oneCategory);
  }
  for (var cat in allCategories) {
    print(cat.category);
  }
  print("going to return ${allCategories[0].category}");
  return Future.value(allCategories);
}

Future<List<Subcategory>> _getListSubcategories(var category) async {
  List<Subcategory> subcategories = List<Subcategory>();
  List<Item> items;
  for (var subcategory in category['subcategories']) {
    await getAllItems(category['category'], subcategory['subcategory'])
        .then((value) {
      items = value;
    });
    subcategories.add(Subcategory(
        subcategoryId: subcategory['_id'],
        subcategory: subcategory['subcategory'],
        items: items));
  }
  return subcategories;
}
