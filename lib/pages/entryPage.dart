import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:new_test/pages/loginPage.dart';
import 'package:new_test/utils/flutter_ui_utils.dart';
import 'package:new_test/widgets/borderSplash.dart';
import 'package:new_test/widgets/homePageContainer.dart';
import 'package:new_test/widgets/loginForm.dart';
import 'package:new_test/widgets/rangoliImg.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class EntryPage extends StatefulWidget {
  @override
  _EntryPageState createState() => _EntryPageState();
}

class _EntryPageState extends State<EntryPage> {
  bool _selected = false;

  void _changeLocation() {
    setState(() {
      _selected = true;
    });
  }

  void initState() {
    super.initState();

    _loadWidget();
  }

  _loadWidget() async {
    var _duration = Duration(seconds: 1);
    return Timer(_duration, _changeLocation);
  }

  double _getPercent(double p, double quan) {
    return ((p / 100) * quan);
  }

  Future<bool> checkLogin() async {
    final prefs = await SharedPreferences.getInstance();
    final counter = prefs.getString('username') ?? null;
    if (counter != null)
      return true;
    else
      return false;
  }

  Future<bool> _signal2;
  var loggedin = false;

  @override
  Widget build(BuildContext context) {
    print(FlutterUiDart(context: context).getPercentWidth(100));
    print(FlutterUiDart(context: context).getPercentHeight(100));
    var imgWidth = FlutterUiDart(context: context).getPercentWidth(30);
    var imgHeight = FlutterUiDart(context: context).getPercentWidth(30);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).primaryColor,
      body: BorderSplash(
        effect: false,
        child: Container(
          child: LayoutBuilder(builder: (context, constraints) {
            var smImgWidth = _getPercent(12, constraints.maxWidth);
            var smImgHeight = _getPercent(12, constraints.maxWidth);
            var smTopGap = _getPercent(5, constraints.maxHeight);
            var topGap = (constraints.maxHeight / 2) - (imgHeight / 2);
            var smLeftGap = (constraints.maxWidth / 2) - (smImgHeight / 2);
            var leftGap = (constraints.maxWidth / 2) - (imgHeight / 2);

            return Stack(children: [
              AnimatedPositioned(
                // alignment: Alignment.center,
                width: _selected ? smImgWidth : imgWidth,
                height: _selected ? smImgHeight : imgHeight,
                top: _selected ? smTopGap : topGap,
                left: _selected ? smLeftGap : leftGap,
                curve: Curves.easeOut,
                duration: Duration(seconds: 3),
                child: RangoliImg(rangoliBuilt: () {}, timeDuration: 0),
                onEnd: () {
                  checkLogin().then((value) {
                    print(value);
                    if (value)
                      Navigator.of(context).pushReplacementNamed('/homePage');
                    else
                      Navigator.of(context).pushReplacementNamed('/loginPage');
                  });
                },
              ),
            ]);
          }),
        ),
        // child: AnimatedPositioned(
        // top: _selected ? smTopGap : topGap,
        // left: _selected ? smLeftGap : leftGap,
        // child: RangoliImg(rangoliBuilt: () {}, timeDuration: 0),
        // duration: Duration(seconds: 3),
        // width: _selected ? smImgWidth : imgWidth,
        // height: _selected ? smImgHeight : imgHeight,
        //   curve: Curves.easeIn,
        //   onEnd: () {
        //     print("d");
        //     _signal2 = Future.value(true);
        //     _signal2.then((value) {
        //       print(value);
        //       setState(() {});
        //     }).whenComplete(() {
        //       // Navigator.pushReplacementNamed(context, '/loginPage');
        //     });
        //   },
        // ),
      ),
    );
    // FutureBuilder(
    //   future: _signal2,
    //   builder: (context, snapshot) {
    //     print("in");
    //     if (snapshot.hasData) {
    //       return Positioned(
    //         top: FlutterUiDart(context: context).getPercentHeight(7) +
    //             smImgHeight,
    //         left: FlutterUiDart(context: context).getPercentWidth(6),
    //         child: Container(
    //           width:
    //               FlutterUiDart(context: context).getPercentWidth(88),
    //           height: FlutterUiDart(context: context)
    //                   .getPercentHeight(93) -
    //               smImgHeight -
    //               FlutterUiDart(context: context).getPercentWidth(6),
    //         ),
    //       );
    //     }
    //     return Container();
    //   },
    // ),
  }
}

// Center(
//         child: Container(
//           width: 40,
//           height: 10,
// child: Form(
//     child: Column(
//   children: [
//     TextFormField(
//       controller: usernameController,
//       validator: (value) {
//         if (value == null || value.isEmpty) {
//           return 'Please enter some text';
//         }
//         return null;
//       },
//     ),
//     TextFormField(
//       controller: passwordController,
//       validator: (value) {
//         if (value == null || value.isEmpty) {
//           return 'Please enter some text';
//         }
//         return null;
//       },
//     ),
//     ElevatedButton(
//         onPressed: () {
//           print(usernameController.value.text);
//           print(passwordController.value.text);
//           validate(usernameController.value.text,
//                   passwordController.value.text)
//               .then((value) {
//             if (value) {
//               Navigator.pushReplacementNamed(context, '/homePage');
//             } else {
//               print("invalid");
//             }
//           });
//         },
//         child: Container(
//           child: Text("press it"),
//           color: Colors.blue,
//         ))
//   ],
// )),
//         ),
//       ),
