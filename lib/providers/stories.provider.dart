import 'package:canvas/model/story.model.dart';
import 'package:flutter/material.dart';

class StoriesProvider with ChangeNotifier {
  List<Story> _stories = [];

  get allStories {
    return [...this._stories];
  }
}
