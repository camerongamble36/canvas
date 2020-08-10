import 'package:canvas/model/story.model.dart';
import 'package:flutter/material.dart';

class User with ChangeNotifier {
  String id;
  String imageUrl;
  String email;
  String firstname;
  String lastname;
  String username;
  Story story;
  String dob;
  List<String> affirmations;
  List<String> attributes;
  List<String> tiles;

  User({
    @required this.id,
    @required this.imageUrl,
    @required this.email,
    @required this.firstname,
    @required this.lastname,
    @required this.username,
    @required this.story,
    @required this.dob,
    @required this.affirmations,
    @required this.attributes,
    @required this.tiles,
  });
}
