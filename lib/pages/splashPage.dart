import 'dart:async';
import 'package:flutter/material.dart';
import 'package:new_test/widgets/borderSplash.dart';
import 'package:new_test/utils/flutter_ui_utils.dart';
import 'package:new_test/widgets/rangoliImg.dart';

class SplashScreen extends StatefulWidget {
  // final Color backgroundColor = Colors.white;
  // final TextStyle styleTextUnderTheLoader = TextStyle(
  //     fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    print(FlutterUiDart(context: context).getPercentWidth(100));
    print(FlutterUiDart(context: context).getPercentHeight(100));
    var imgWidth = FlutterUiDart(context: context).getPercentWidth(30);
    var imgHeight = FlutterUiDart(context: context).getPercentWidth(30);
    var leftGap =
        FlutterUiDart(context: context).getPercentWidth(50) - imgWidth / 2;
    var topGap =
        FlutterUiDart(context: context).getPercentHeight(50) - imgHeight / 2;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).primaryColor,
      body: BorderSplash(
        effect: true,
        child: Container(
          child: Stack(children: [
            Positioned(
              width: imgWidth,
              height: imgHeight,
              top: topGap,
              left: leftGap,
              child: Container(
                child: RangoliImg(
                    timeDuration: 3,
                    rangoliBuilt: () {
                      print("rangoli built");
                      // Navigator.pushReplacementNamed(context, '/entryPage');
                      Navigator.of(context).pushReplacementNamed('/entryPage');
                      // setState(() {
                      //   _timeDur = 0;
                      //   _selected = true;
                      //   _effect = false;
                      // });
                    }),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
