import 'package:flutter/material.dart';
import 'package:new_test/models/category.dart';
import 'package:new_test/models/subcategory.dart';
import 'package:new_test/utils/flutter_ui_utils.dart';
import 'package:new_test/widgets/subTabBox.dart';
import 'package:new_test/widgets/tabBox.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:new_test/providers/homePageSubTabChange.dart';
import 'package:provider/provider.dart';

class SubTabDrawer extends StatelessWidget {
  final List<Subcategory> subcategories;
  SubTabDrawer(this.subcategories);
  @override
  Widget build(BuildContext context) {
    var subtabProvider = Provider.of<HomePageSubTabChange>(context);
    return Padding(
      padding:
          EdgeInsets.all(FlutterUiDart(context: context).getPercentWidth(1)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: SingleChildScrollView(
              child: Container(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: subcategories.length,
                  separatorBuilder: (context, index) {
                    return Container(
                      color: Theme.of(context).accentColor,
                      height:
                          FlutterUiDart(context: context).getPercentHeight(0.5),
                    );
                  },
                  itemBuilder: (context, index) {
                    return SubTabBox(subcategory: subcategories[index]);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
