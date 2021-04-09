import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:new_test/models/categories.dart';
import 'package:new_test/providers/homePageTabChange.dart';
import 'package:new_test/utils/flutter_ui_utils.dart';
import 'package:new_test/widgets/tabDrawer.dart';
import 'package:provider/provider.dart';

class HomePageContainer extends StatefulWidget {
  @override
  _HomePageContainerState createState() => _HomePageContainerState();
}

class _HomePageContainerState extends State<HomePageContainer> {
  @override
  Widget build(BuildContext context) {
    var tabProvider = Provider.of<HomePageTabChange>(context);
    return SliderMenuContainer(
      shadowSpreadRadius: 0,
      shadowColor: Colors.black,
      slideDirection: SlideDirection.LEFT_TO_RIGHT,
      isDraggable: true,
      isShadow: true,
      sliderMenu: TabDrawer(),
      sliderMenuOpenSize: 200,
      hasAppBar: false,
      sliderMain: Stack(
        children: [
          Container(
            color: Colors.red,
            child: Text(Categories.tab[tabProvider.whichTab]),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              width: FlutterUiDart(context: context).getPercentWidth(88),
              height: 3,
              color: Colors.black,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              width: FlutterUiDart(context: context).getPercentWidth(88),
              height: 3,
              color: Colors.black,
            ),
          ),
          // MenuDrawer(),
        ],
      ),
    );
  }
}
