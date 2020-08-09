import 'package:canvas/model/timelineEvent.dart';
import 'package:flutter/material.dart';

class HelloEvent extends StatelessWidget {
  final int index;
  final String eventTitle;
  final TimelineEvent event;

  HelloEvent(this.event, this.eventTitle, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              CircleAvatar(
                child: Text(this.index.toString()),
              ),
              SizedBox(
                height: 4,
              ),
              Container(
                height: 35,
                width: 1,
                color: Theme.of(context).primaryColor,
              ),
            ],
          ),
          SizedBox(
            width: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                this.eventTitle,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).primaryColor,
                    ),
                    borderRadius: BorderRadius.circular(16)),
                child: Text(this.event.description),
              ),
              Divider(
                thickness: 4,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
