import 'package:canvas/widgets/story/storyActionBar.dart';
import 'package:canvas/widgets/story/storySummary.dart';
import 'package:canvas/widgets/story/storyText.dart';
import 'package:flutter/material.dart';

class CanvasStoryScreen extends StatelessWidget {
  static const routeName = '/story';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(32),
      child: Column(
        children: [
          StorySummary(),
          StoryText(),
          SizedBox(
            height: 16,
          ),
          StoryActionBar(),
        ],
      ),
    );
  }
}
