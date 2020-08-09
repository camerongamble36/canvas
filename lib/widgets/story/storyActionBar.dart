import 'package:canvas/providers/auth.provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StoryActionBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final userStory = authProvider.currentUser.story;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FlatButton(
          color: Theme.of(context).primaryColor,
          textColor: Colors.white,
          child: Text('Prev.'),
          onPressed: () {},
        ),
        Text(
            '${userStory.currentPage.toString()} / ${userStory.pages.toString()} pages'),
        FlatButton(
          color: Theme.of(context).primaryColor,
          textColor: Colors.white,
          child: Text('Next'),
          onPressed: () {},
        ),
      ],
    );
  }
}
