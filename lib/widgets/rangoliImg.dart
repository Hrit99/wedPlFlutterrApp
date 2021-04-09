import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:async';

class RangoliImg extends StatefulWidget {
  final VoidCallback rangoliBuilt;
  final timeDuration;
  RangoliImg({@required this.rangoliBuilt, @required this.timeDuration});
  @override
  createState() => _RangoliImgState();
}

class _RangoliImgState extends State<RangoliImg> {
  double opacityLevel = 0.0;

  void _changeOpacity() {
    setState(() => opacityLevel = opacityLevel == 0 ? 1.0 : 0.0);
  }

  void initState() {
    super.initState();

    _loadWidget();
  }

  _loadWidget() async {
    var _duration = Duration(seconds: 0);
    return Timer(_duration, _changeOpacity);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: opacityLevel,
      duration: Duration(seconds: widget.timeDuration),
      child: SvgPicture.asset('lib/utils/assets/images/rangoli.svg'),
      onEnd: () {
        print("calling login page after 1 sec");
        widget.rangoliBuilt();
        // Future.delayed(Duration(seconds: 1), _callLoginPage);
      },
    );
  }
}
