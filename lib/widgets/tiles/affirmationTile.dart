import 'package:canvas/widgets/tiles/newAffirmation.dart';
import 'package:flutter/material.dart';

class AffirmationTile extends StatelessWidget {
  final isActive;

  AffirmationTile(this.isActive);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          // AffirmationSummary(),
          NewAffirmation(),
        ],
      ),
    );
  }
}
