import 'package:canvas/model/timelineEvent.dart';
import 'package:canvas/widgets/timeline/events/helloEvent.dart';
import 'package:canvas/widgets/timeline/events/sameBirthdayEvent.dart';
import 'package:flutter/material.dart';

class TimelineItem extends StatelessWidget {
  final TimelineEvent event;
  final int index;

  TimelineItem(this.event, this.index);

  @override
  Widget build(BuildContext context) {
    switch (this.event.type) {
      case EventType.Intro:
        return Container(
          child: Row(
            children: [
              CircleAvatar(
                child: Text(this.index.toString()),
              ),
              Column(
                children: [
                  Text(this.event.title),
                  Container(
                    child: Text(this.event.description),
                  ),
                ],
              ),
            ],
          ),
        );

      case EventType.Hello:
        const eventTitle = 'Greetings';
        return HelloEvent(
          this.event,
          eventTitle,
          this.index,
        );

      case EventType.SameBirthday:
        const eventTitle = 'BOOM! Same Birthday';
        return SameBirthdayEvent(
          this.event,
          eventTitle,
          this.index,
        );

      default:
        return null;
    }
  }
}
