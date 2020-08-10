import 'package:canvas/model/story.model.dart';
import 'package:flutter/material.dart';

class StoriesProvider with ChangeNotifier {
  final String authToken;

  StoriesProvider(this.authToken, this._stories);

  List<Story> _stories = [];

  get allStories {
    return [...this._stories];
  }

  Story get currentStory {
    print("Test");
    // return this._stories[0];
  }
}
