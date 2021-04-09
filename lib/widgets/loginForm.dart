import 'package:flutter/material.dart';
import 'package:new_test/apis/loginApi.dart';
import 'package:new_test/utils/flutter_ui_utils.dart';

class LoginForm extends StatelessWidget {
  final VoidCallback signUpPressed;
  LoginForm({@required this.signUpPressed});
  final TextEditingController usernameController = new TextEditingController();

  final TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        child: Column(
          children: [
            new ListTile(
              leading: const Icon(Icons.person),
              title: new TextField(
                controller: usernameController,
                decoration: new InputDecoration(
                  hintText: "Name",
                ),
              ),
            ),
            new ListTile(
              leading: const Icon(Icons.phone),
              title: new TextField(
                controller: passwordController,
                decoration: new InputDecoration(
                  hintText: "Password",
                ),
              ),
            ),
            Row(children: [
              ElevatedButton(
                  onPressed: () {
                    print(usernameController.value.text);
                    print(passwordController.value.text);
                    validate(
                            username: usernameController.value.text,
                            password: passwordController.value.text)
                        .then((value) {
                      if (value) {
                        Navigator.pushReplacementNamed(context, '/homePage');
                        // loggedIn();
                      } else {
                        print("invalid");
                      }
                    }).catchError((err) {
                      print('error');
                      usernameController.clear();
                      passwordController.clear();
                    });
                    print("jkk");
                  },
                  child: Container(
                    child: Text("press it"),
                    color: Colors.blue,
                  )),
              ElevatedButton(
                  onPressed: () {
                    print(usernameController.value.text);
                    print(passwordController.value.text);
                    signUpPressed();
                    // validate(usernameController.value.text,
                    //         passwordController.value.text)
                    //     .then((value) {
                    //   if (value) {
                    //     Navigator.pushReplacementNamed(context, '/homePage');
                    //     // loggedIn();
                    //   } else {
                    //     print("invalid");
                    //   }
                    // });
                    print("jkk");
                  },
                  child: Container(
                    child: Text("signUp"),
                    color: Colors.blue,
                  ))
            ]),
          ],
        ),
      ),
    );
  }
}

//  child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           SizedBox(
//             height: FlutterUiDart(context: context).getPercentHeight(5),
//           ),
// TextFormField(
//   controller: usernameController,
//   validator: (value) {
//     if (value == null || value.isEmpty) {
//       return 'Please enter some text';
//     }
//     return null;
//   },
// ),
//           SizedBox(
//             height: FlutterUiDart(context: context).getPercentHeight(5),
//           ),
//           TextFormField(
//             controller: passwordController,
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter some text';
//               }
//               return null;
//             },
//           ),
//           SizedBox(
//             height: FlutterUiDart(context: context).getPercentHeight(5),
//           ),
// ElevatedButton(
//     onPressed: () {
//       print(usernameController.value.text);
//       print(passwordController.value.text);
//       validate(usernameController.value.text,
//               passwordController.value.text)
//           .then((value) {
//         if (value) {
//           Navigator.pushReplacementNamed(context, '/homePage');
//         } else {
//           print("invalid");
//         }
//       });
//     },
//     child: Container(
//       child: Text("press it"),
//       color: Colors.blue,
//     ))
//         ],
//       ),
