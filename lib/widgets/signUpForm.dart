import 'package:flutter/material.dart';
import 'package:new_test/apis/loginApi.dart';
import 'package:new_test/utils/flutter_ui_utils.dart';
import 'package:new_test/apis/signupApi.dart';

class SignUpForm extends StatelessWidget {
  final VoidCallback loginPressed;
  SignUpForm({@required this.loginPressed});
  // LoginForm({@required this.loggedIn});
  final TextEditingController usernameController = new TextEditingController();

  final TextEditingController passwordController = new TextEditingController();

  final TextEditingController emailController = new TextEditingController();

  final TextEditingController phoneController = new TextEditingController();

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
            new ListTile(
              leading: const Icon(Icons.phone),
              title: new TextField(
                controller: emailController,
                decoration: new InputDecoration(
                  hintText: "email",
                ),
              ),
            ),
            new ListTile(
              leading: const Icon(Icons.phone),
              title: new TextField(
                controller: phoneController,
                decoration: new InputDecoration(
                  hintText: "phone",
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () {
                      print(usernameController.value.text);
                      print(passwordController.value.text);
                      validate(
                              username: usernameController.value.text,
                              password: passwordController.value.text)
                          .then((value) {
                        if (value) {
                          print("signupfailed");
                          usernameController.clear();
                          passwordController.clear();
                          phoneController.clear();
                          emailController.clear();
                          // loggedIn();
                        } else {
                          print("invalid");
                          usernameController.clear();
                          passwordController.clear();
                          phoneController.clear();
                          emailController.clear();
                        }
                      }).catchError((err) {
                        print('error');
                        store(
                                email: emailController.value.text,
                                password: passwordController.value.text,
                                phone: phoneController.value.text,
                                username: usernameController.value.text)
                            .then((value) {
                          if (value)
                            print("signedup");
                          else
                            print("signupfailed");
                          usernameController.clear();
                          passwordController.clear();
                          phoneController.clear();
                          emailController.clear();
                        }).catchError((err) {
                          print("signupfailed");
                          usernameController.clear();
                          passwordController.clear();
                          phoneController.clear();
                          emailController.clear();
                        });
                      });
                      print("jkk");
                    },
                    child: Container(
                      child: Text("press it"),
                      color: Colors.blue,
                    )),
                ElevatedButton(

                    //   validate(usernameController.value.text,
                    //           passwordController.value.text)
                    //       .then((value) {
                    //     if (value) {
                    //       Navigator.pushReplacementNamed(context, '/homePage');
                    //       // loggedIn();
                    //     } else {
                    //       print("invalid");
                    //     }
                    //   });
                    //   print("jkk");
                    // },
                    child: Container(
                      child: Text("login"),
                      color: Colors.blue,
                    ),
                    onPressed: () {
                      print(usernameController.value.text);
                      print(passwordController.value.text);
                      loginPressed();
                    }),
              ],
            ),
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
