import 'package:flutter/material.dart';
import 'package:new_test/models/item.dart';
import 'package:new_test/providers/homePageSubTabChange.dart';
import 'package:new_test/utils/flutter_ui_utils.dart';
import 'package:provider/provider.dart';

class ItemCard extends StatefulWidget {
  var constraints;
  Item item;
  ItemCard(this.constraints, this.item);
  @override
  _ItemCardState createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  var height;
  var extended = false;

  double _getPercent(double p, double quan) {
    return ((p / 100) * quan);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: extended
          ? _getPercent(70, widget.constraints.maxHeight)
          : _getPercent(50, widget.constraints.maxHeight),
      child: Column(
        children: [
          Container(
            color: Colors.brown,
            width: _getPercent(100, widget.constraints.maxWidth),
            height: _getPercent(5, widget.constraints.maxHeight),
            child: Center(
                child: Text(
              widget.item.name,
              style: TextStyle(color: Theme.of(context).primaryColor),
            )),
          ),
          GestureDetector(
              onDoubleTap: () {
                setState(() {
                  if (extended)
                    extended = false;
                  else
                    extended = true;
                });
              },
              child: Container(
                height: _getPercent(45, widget.constraints.maxHeight),
                width: _getPercent(100, widget.constraints.maxWidth),
                child: FittedBox(
                    fit: BoxFit.fill,
                    child: Image.network(widget.item.mediaUrl)),
              )),
          extended
              ? Container(
                  height: _getPercent(20, widget.constraints.maxHeight),
                  width: _getPercent(100, widget.constraints.maxWidth),
                  color: Colors.brown,
                  child: Center(
                      child: Text(
                    widget.item.details,
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  )),
                )
              : Container()
        ],
      ),
    );
  }
}
