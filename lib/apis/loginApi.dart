import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

Future<bool> validate(
    {@required String username, @required String password}) async {
  var valid;
  await http
      .post(
    'https://safe-springs-56633.herokuapp.com/api/user/validate',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'username': username,
      'password': password,
    }),
  )
      .then((response) {
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      print(jsonResponse['validity']);
      valid = jsonResponse['validity'];
    } else {
      print('false');
      valid = false;
    }
  }).catchError((error) {
    print("error occured");
    valid = false;
  });
  print("h");
  return valid;
}
