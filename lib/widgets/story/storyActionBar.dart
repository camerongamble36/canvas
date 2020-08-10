import 'package:canvas/providers/auth.provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StoryActionBar extends StatefulWidget {
  int currentPage;
  final int totalPages;

  StoryActionBar(this.currentPage, this.totalPages);

  @override
  _StoryActionBarState createState() => _StoryActionBarState();
}

class _StoryActionBarState extends State<StoryActionBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FlatButton(
          color: Theme.of(context).primaryColor,
          textColor: Colors.white,
          child: Text('Prev.'),
          onPressed: () {
            if (this.widget.currentPage >= 1) {
              setState(() {
                this.widget.currentPage--;
              });
            } else {
              setState(() {
                this.widget.currentPage = 0;
              });
            }
          },
        ),
        Text(
            '${widget.currentPage.toString()} / ${widget.totalPages.toString()} pages'),
        FlatButton(
          color: Theme.of(context).primaryColor,
          textColor: Colors.white,
          child: Text('Next'),
          onPressed: () {
            if (this.widget.currentPage <= this.widget.totalPages - 1) {
              setState(() {
                this.widget.currentPage++;
              });
            } else {
              setState(() {
                this.widget.currentPage = this.widget.totalPages;
              });
            }
          },
        ),
      ],
    );
  }
}
