import 'package:flutter/material.dart';

class NarratorAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.fromLTRB(0, 0, 8, 16),
      child: Container(
        child: Center(
          child: Icon(Icons.person_add),
        ),
        width: 150,
        height: 300,
      ),
    );
  }
}
