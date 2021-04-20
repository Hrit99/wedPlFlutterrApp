import 'package:flutter/material.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:new_test/models/category.dart';
import 'package:new_test/providers/homePageSubTabChange.dart';
import 'package:new_test/providers/homePageTabChange.dart';
import 'package:new_test/utils/flutter_ui_utils.dart';
import 'package:new_test/apis/categoryApi.dart';
import 'package:new_test/widgets/itemsViewContainer.dart';
import 'package:new_test/widgets/subTabBox.dart';
import 'package:new_test/widgets/subTabDrawer.dart';
import 'package:new_test/widgets/tabDrawer.dart';
import 'package:provider/provider.dart';

class HomePageContainer extends StatefulWidget {
  List<Category> categories;
  HomePageContainer(this.categories);
  @override
  _HomePageContainerState createState() => _HomePageContainerState();
}

class _HomePageContainerState extends State<HomePageContainer> {
  final GlobalKey<InnerDrawerState> _innerDrawerKey =
      GlobalKey<InnerDrawerState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var tabProvider = Provider.of<HomePageTabChange>(context, listen: false);
    print("hgg");
    if (widget.categories.length > 0) {
      print(widget.categories[0].category);
      tabProvider.updateTabBox(widget.categories[0], false);
      print("init ends");
    }
  }

  // @override
  // void didChangeDependencies() {
  //   // TODO: implement didChangeDependencies
  //   super.didChangeDependencies();

  // }

  @override
  Widget build(BuildContext context) {
    var tabProvider = Provider.of<HomePageTabChange>(context);
    var subtabProvider =
        Provider.of<HomePageSubTabChange>(context, listen: false);
    subtabProvider.updateSubTabBox(
        tabProvider.whichCategory.subcategories[0], false);
    return InnerDrawer(
        key: _innerDrawerKey,
        onTapClose: true,
        swipe: true,
        colorTransitionChild: Theme.of(context).primaryColor,
        colorTransitionScaffold: Theme.of(context).accentColor,
        borderRadius: 30,
        leftAnimationType: InnerDrawerAnimation.static,
        rightAnimationType: InnerDrawerAnimation.static,
        backgroundDecoration:
            BoxDecoration(color: Theme.of(context).primaryColor),
        innerDrawerCallback: (a) => print(a),
        leftChild: TabDrawer(widget.categories),
        rightChild: SubTabDrawer(tabProvider.whichCategory.subcategories),
        scaffold: Scaffold(
          extendBodyBehindAppBar: true,
          body: ItemsViewContainer(),
          backgroundColor: Theme.of(context).primaryColor,
        ));
  }
}

// return SliderMenuContainer(
//   key: _keyl,
//   shadowSpreadRadius: 0,
//   shadowColor: Colors.black,
//   slideDirection: SlideDirection.LEFT_TO_RIGHT,
//   isDraggable: true,
//   isShadow: true,
//   sliderMenu: TabDrawer(),
//   sliderMenuOpenSize: 200,
//   hasAppBar: false,
//   sliderMain: InkWell(
//     onTap: () {
//       print("tapped");
//       if (_keyl.currentState.isDrawerOpen) _keyl.currentState.closeDrawer();
//     },
// child: SliderMenuContainer(
//     key: _keyr,
//     shadowSpreadRadius: 0,
//     shadowColor: Colors.black,
//     slideDirection: SlideDirection.RIGHT_TO_LEFT,
//     isDraggable: true,
//     isShadow: true,

//     sliderMenu: TabDrawer(),
//     sliderMenuOpenSize: 200,
//     hasAppBar: false,
//     sliderMain: InkWell(
//       onTap: () {
//         print("tapped");
//         if (_keyr.currentState.isDrawerOpen)
//           _keyr.currentState.closeDrawer();
//       },
//       child: Container(color: Colors.red),
//     )
// Stack(
//   children: [
//     Container(
//       color: Colors.red,
//       child: Text(Categories.tab[tabProvider.whichTab]),
//     ),
//     Positioned(
//       top: 0,
//       left: 0,
//       child: Container(
//         width: FlutterUiDart(context: context).getPercentWidth(88),
//         height: 3,
//         color: Colors.black,
//       ),
//     ),
//     Positioned(
//       bottom: 0,
//       left: 0,
//       child: Container(
//         width: FlutterUiDart(context: context).getPercentWidth(88),
//         height: 3,
//         color: Colors.black,
//       ),
//     ),
//     // MenuDrawer(),
//   ],
// ),
//       ),
//       // ),
//     );
//   }
// }
