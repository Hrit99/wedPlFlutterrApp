import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> validate(
    {@required String username, @required String password}) async {
  var valid;
  // var reload;
  // await http
  //     .post('https://safe-springs-56633.herokuapp.com/api/userid/reloadcheck',
  //         headers: <String, String>{
  //           'Content-Type': 'application/json; charset=UTF-8'
  //         },
  //         body: jsonEncode(<String, String>{"userId": username}))
  //     .then((value) {
  //   reload = jsonDecode(value.body)['reload'];
  // }).catchError((_) => print("some error occured"));

  final pref = await SharedPreferences.getInstance();

  // pref.setBool("reload", reload);
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
      pref.setString('username', username);
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
