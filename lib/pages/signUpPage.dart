// import 'package:flutter/material.dart';
// import 'package:new_test/utils/flutter_ui_utils.dart';
// import 'package:new_test/widgets/borderSplash.dart';
// import 'package:new_test/widgets/loginForm.dart';
// import 'package:new_test/widgets/rangoliImg.dart';
// import 'package:new_test/widgets/signUpForm.dart';
// // import 'package:keyboard_visibility/keyboard_visibility.dart';
// // import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   Alignment childAlignment = Alignment.center;
//   @override
//   void initState() {
//     super.initState();

//     // KeyboardVisibilityNotification().addNewListener(onChange: (bool visible) {
//     //   setState(() {
//     //     childAlignment = visible ? Alignment.center : Alignment.topCenter;
//     //   });
//     // });
//   }

//   double _getPercent(double p, double quan) {
//     return ((p / 100) * quan);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       backgroundColor: Theme.of(context).primaryColor,
//       body: BorderSplash(
//         effect: false,
//         child: Container(
//           child: LayoutBuilder(builder: (context, constraints) {
//             var smImgWidth = _getPercent(12, constraints.maxWidth);
//             var smImgHeight = _getPercent(12, constraints.maxWidth);
//             var smTopGap = _getPercent(3, constraints.maxHeight);
//             var smLeftGap = _getPercent(50, constraints.maxWidth) -
//                 _getPercent(50, smImgWidth);

//             return Stack(children: [
//               Positioned(
//                 // alignment: Alignment.center,
//                 width: smImgWidth,
//                 height: smImgHeight,
//                 top: smTopGap,
//                 left: smLeftGap,
//                 child: RangoliImg(rangoliBuilt: () {}, timeDuration: 0),
//               ),
//               Positioned(
//                   top: _getPercent(30, constraints.maxHeight),
//                   left: _getPercent(15, constraints.maxWidth),
//                   width: _getPercent(70, constraints.maxWidth),
//                   height: _getPercent(30, constraints.maxHeight),
//                   child: SignUpForm(loginPressed: (){

//                   }))
//             ]);
//           }),
//         ),
//       ),
//     );
//   }
// }
