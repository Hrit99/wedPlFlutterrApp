import 'package:flutter/material.dart';

class FlutterUiDart {
  BuildContext context;
  FlutterUiDart({@required this.context});

  double getPercentHeight(double p) {
    return (MediaQuery.of(context).size.height * p) / 100;
  }

  double getPercentWidth(double p) {
    return (MediaQuery.of(context).size.width * p) / 100;
  }
}
