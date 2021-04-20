import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

Future<bool> store(
    {@required String username,
    @required String password,
    @required String email,
    @required String phone}) async {
  var stored;

  await http
      .post(
    'https://safe-springs-56633.herokuapp.com/api/user/store',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'username': username,
      'email': email,
      'password': password,
      'phone': phone,
    }),
  )
      .then((response) {
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      print(jsonResponse['stored']);
      stored = jsonResponse['stored'];
    } else {
      print('false');
      stored = false;
    }
  }).catchError((error) {
    print("error occured");
    stored = false;
  });
  print("h");
  return stored;
}
