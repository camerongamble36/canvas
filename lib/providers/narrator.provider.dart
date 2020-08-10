import 'package:canvas/model/narrator.model.dart';
import 'package:flutter/material.dart';

class NarratorProvider with ChangeNotifier {
  final String authToken;

  NarratorProvider(this.authToken, this.currentNarratorConfig);

  Narrator currentNarratorConfig = Narrator();
}
