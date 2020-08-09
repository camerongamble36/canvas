import 'dart:html';

import 'package:flutter/material.dart';

// class PageNode {
//   Page value;
//   Node node;

//   first = node.
// }

class Page with ChangeNotifier {
  String id;
  String text;
  int pageNum;

  Page({
    @required this.id,
    @required this.pageNum,
    @required this.text,
  });
}
