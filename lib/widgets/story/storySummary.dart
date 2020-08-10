import 'package:canvas/model/story.model.dart';
import 'package:canvas/providers/auth.provider.dart';
import 'package:canvas/providers/stories.provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class StorySummary extends StatelessWidget {
  final String title;
  final String username;
  final String timestamp;

  StorySummary(this.title, this.username, this.timestamp);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text('@$username'),
      trailing: Container(
        margin: EdgeInsets.fromLTRB(0, 12, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              timestamp,
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
