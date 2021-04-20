import 'package:flutter/material.dart';

class Item {
  final String itemId;
  final String name;
  final String mediaUrl;
  final String details;
  Item(
      {@required this.itemId,
      @required this.name,
      @required this.mediaUrl,
      @required this.details});
}
