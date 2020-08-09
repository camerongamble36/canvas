import 'package:flutter/material.dart';

class Affirmation {
  String id;
  String title;
  String text;
  String timestamp;

  Affirmation({
    @required this.id,
    @required this.title,
    @required this.text,
    @required this.timestamp,
  });
}
