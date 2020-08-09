import 'package:flutter/material.dart';

class Story {
  String id;
  String title;
  String ownerUsername;
  String lastUpdated;
  String text;
  int currentPage;
  int pages;

  Story({
    @required this.id,
    @required this.title,
    @required this.ownerUsername,
    @required this.text,
    @required this.lastUpdated,
    @required this.currentPage,
    @required this.pages,
  });
}
