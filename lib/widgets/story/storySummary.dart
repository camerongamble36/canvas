import 'package:canvas/model/story.model.dart';
import 'package:canvas/providers/auth.provider.dart';
import 'package:canvas/providers/stories.provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class StorySummary extends StatelessWidget {
  // final String title;
  // final String ownerUsername;
  // final String timestamp;

  // StorySummary(this.title, this.ownerUsername, this.timestamp);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final userStory = authProvider.currentUser.story;
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      title: Text(
        userStory.title,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text('@${userStory.ownerUsername}'),
      trailing: Container(
        margin: EdgeInsets.fromLTRB(0, 12, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              userStory.lastUpdated,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Last updated",
              style: TextStyle(fontStyle: FontStyle.italic),
            )
          ],
        ),
      ),
    );
  }
}
