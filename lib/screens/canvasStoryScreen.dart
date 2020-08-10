import 'package:canvas/providers/auth.provider.dart';
import 'package:canvas/providers/stories.provider.dart';
import 'package:canvas/widgets/story/storyActionBar.dart';
import 'package:canvas/widgets/story/storySummary.dart';
import 'package:canvas/widgets/story/storyText.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CanvasStoryScreen extends StatelessWidget {
  static const routeName = '/story';

  @override
  Widget build(BuildContext context) {
    final storiesProvider = Provider.of<StoriesProvider>(context);
    final authProvider = Provider.of<AuthProvider>(context);
    // final currentStory = storiesProvider.currentStory;
    final currentStory = authProvider.currentUser.story;
    return Container(
      margin: EdgeInsets.all(32),
      child: Column(
        children: [
          StorySummary(
            currentStory.title,
            authProvider.currentUser.username,
            currentStory.lastUpdated,
          ),
          StoryText(currentStory.text),
          SizedBox(
            height: 16,
          ),
          StoryActionBar(currentStory.currentPage, currentStory.pages),
        ],
      ),
    );
  }
}
