import 'package:flutter/material.dart';
import 'package:new_test/utils/flutter_ui_utils.dart';
import 'package:new_test/widgets/borderSplash.dart';
import 'package:new_test/widgets/homePageContainer.dart';
import 'package:new_test/widgets/rangoliImg.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double _getPercent(double p, double quan) {
      return ((p / 100) * quan);
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).primaryColor,
      body: BorderSplash(
        effect: false,
        child: Container(
          child: LayoutBuilder(builder: (context, constraints) {
            var smImgWidth = _getPercent(12, constraints.maxWidth);
            var smImgHeight = _getPercent(12, constraints.maxWidth);
            var smTopGap = _getPercent(3, constraints.maxHeight);
            var smLeftGap = _getPercent(50, constraints.maxWidth) -
                _getPercent(50, smImgWidth);

            return Stack(children: [
              Positioned(
                // alignment: Alignment.center,
                width: smImgWidth,
                height: smImgHeight,
                top: smTopGap,
                left: smLeftGap,
                child: RangoliImg(rangoliBuilt: () {}, timeDuration: 0),
              ),
              Positioned(
                top: smImgHeight + (2 * smTopGap),
                left: _getPercent(5, constraints.maxWidth),
                child: Container(
                  width: constraints.maxWidth -
                      _getPercent(10, constraints.maxWidth),
                  height: constraints.maxHeight -
                      (smImgHeight + (2 * smTopGap)) -
                      _getPercent(5, constraints.maxWidth),
                  child: HomePageContainer(),
                ),
              ),
            ]);
          }),
        ),
      ),
    );
  }
}

// Positioned(
//   top: FlutterUiDart(context: context).getPercentHeight(7) +
//       smImgHeight,
//   left: FlutterUiDart(context: context).getPercentWidth(6),
//   child: Container(
//     width: FlutterUiDart(context: context).getPercentWidth(88),
//     height: FlutterUiDart(context: context).getPercentHeight(93) -
//         smImgHeight -
//         FlutterUiDart(context: context).getPercentWidth(6),
//     child: HomePageContainer(),
//   ),
// ),
