import 'package:flutter/material.dart';

class CanvasProvider with ChangeNotifier {
  final String authToken;
  CanvasProvider(this.authToken, this.canvases);

  List<Canvas> canvases = [];
}
