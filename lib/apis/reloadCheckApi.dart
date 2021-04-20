import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> reloadCheck({@required String username}) async {
  var reload;
  await http
      .post('https://safe-springs-56633.herokuapp.com/api/userid/reloadcheck',
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          },
          body: jsonEncode(<String, String>{"userId": username}))
      .then((value) {
    reload = jsonDecode(value.body)['reload'];
  }).catchError((_) => print("some error occured"));

  final pref = await SharedPreferences.getInstance();

  pref.setBool("reload", reload);
  print(pref.getBool("reload"));
}
