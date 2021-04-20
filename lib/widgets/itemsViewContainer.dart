import 'dart:io';

import 'package:flutter/material.dart';
import 'package:new_test/providers/homePageSubTabChange.dart';
import 'package:new_test/widgets/ItemCard.dart';
import 'package:provider/provider.dart';

class ItemsViewContainer extends StatelessWidget {
  double _getPercent(double p, double quan) {
    return ((p / 100) * quan);
  }

  @override
  Widget build(BuildContext context) {
    var subtabProvider = Provider.of<HomePageSubTabChange>(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        return Center(
          child: Container(
              width: _getPercent(96, constraints.maxWidth),
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return ItemCard(constraints,
                        subtabProvider.whichSubcategory.items[index]);
                  },
                  separatorBuilder: (context, index) {
                    return Container(
                      color: Colors.brown,
                      height: 3,
                    );
                  },
                  itemCount: subtabProvider.whichSubcategory.items.length)),
        );
      },
    );
  }
}
