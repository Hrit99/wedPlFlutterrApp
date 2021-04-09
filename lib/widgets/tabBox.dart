import 'package:flutter/material.dart';
import 'package:new_test/models/categories.dart';
import 'package:new_test/providers/homePageTabChange.dart';
import 'package:new_test/utils/flutter_ui_utils.dart';
import 'package:provider/provider.dart';

class TabBox extends StatelessWidget {
  final index;
  TabBox({@required this.index});

  @override
  Widget build(BuildContext context) {
    var tabProvider = Provider.of<HomePageTabChange>(context, listen: false);

    return Card(
      shadowColor: Colors.black,
      elevation: 5,
      child: ListTile(
        autofocus: true,
        minLeadingWidth: 40,
        contentPadding: EdgeInsetsDirectional.only(
            start: FlutterUiDart(context: context).getPercentWidth(3)),
        // focusColor: Theme.of(context).accentColor,
        // selectedTileColor: Theme.of(context).accentColor,
        // hoverColor: Theme.of(context).accentColor,
        selectedTileColor: Theme.of(context).accentColor,
        enabled: true,
        selected: index == tabProvider.whichTab,
        leading: Icon(Icons.access_alarm),
        title: Text(Categories.tab[index]),
        onTap: () {
          print("d");
          tabProvider.changeTab(index);
        },
      ),
    );

    // return Container(
    //   color: Colors.amber,
    //   height: FlutterUiDart(context: context).getPercentHeight(7),
    //   child: FractionallySizedBox(
    //     widthFactor: 1,
    //     heightFactor: 1,
    //     child: FractionallySizedBox(
    //         alignment: Alignment.bottomCenter,
    //         widthFactor: 0.5,
    //         heightFactor: 0.05,
    //         child: Container(
    //           color: Theme.of(context).accentColor,
    //         )),
    //   ),
    // );
  }
}
