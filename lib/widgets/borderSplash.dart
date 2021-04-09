import 'package:flutter/material.dart';
import 'package:new_test/utils/flutter_ui_utils.dart';

class BorderSplash extends StatefulWidget {
  final Widget child;
  final bool effect;
  BorderSplash({@required this.child, @required this.effect});
  @override
  _BorderSplashState createState() => _BorderSplashState();
}

class _BorderSplashState extends State<BorderSplash> {
  var selected = false;
  var logoImg = false;
  Future<bool> _signal;

  @override
  Widget build(BuildContext context) {
    final borderWidth = FlutterUiDart(context: context).getPercentWidth(6);
    final wid = FlutterUiDart(context: context).getPercentWidth(100);
    final hei = FlutterUiDart(context: context).getPercentHeight(100);

    if (widget.effect) {
      Future.delayed(Duration(seconds: 0)).then((value) {
        setState(() {
          selected = true;
        });
      });
    } else {
      selected = true;
    }

    return Stack(children: [
      AnimatedPositioned(
        width: selected ? wid : 0,
        height: borderWidth,
        top: 0,
        left: selected ? 0 : wid / 2,
        duration: const Duration(seconds: 2),
        curve: Curves.decelerate,
        child: Container(
          color: Theme.of(context).accentColor,
        ),
      ),
      AnimatedPositioned(
        width: borderWidth,
        height: selected ? hei - (2 * borderWidth) : 0,
        top: selected ? borderWidth : hei / 2,
        left: 0,
        duration: const Duration(seconds: 2),
        curve: Curves.decelerate,
        child: Container(
          color: Theme.of(context).accentColor,
        ),
      ),
      //     : Container(),
      AnimatedPositioned(
        width: borderWidth,
        height: selected ? hei - (2 * borderWidth) : 0,
        top: selected ? borderWidth : hei / 2,
        right: 0,
        duration: const Duration(seconds: 2),
        curve: Curves.decelerate,
        child: Container(
          color: Theme.of(context).accentColor,
        ),
      ),
      AnimatedPositioned(
        width: selected ? wid : 0,
        height: borderWidth,
        bottom: 0,
        left: selected ? 0 : wid / 2,
        duration: const Duration(seconds: 2),
        curve: Curves.decelerate,
        child: Container(
          color: Theme.of(context).accentColor,
        ),
        onEnd: () {
          print("js");
          _signal = Future.value(true);
        },
      ),
      widget.effect
          ? FutureBuilder(
              future: _signal,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return widget.child;
                }
                return Container();
              },
            )
          : Positioned(
              top: borderWidth,
              left: borderWidth,
              height: hei - (2 * borderWidth),
              width: wid - (2 * borderWidth),
              child: widget.child),
    ]);
  }
}
