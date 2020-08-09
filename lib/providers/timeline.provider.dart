import 'package:canvas/model/timelineEvent.dart';
import 'package:flutter/material.dart';

class TimelineProvider with ChangeNotifier {
  final List<TimelineEvent> _events = [
    TimelineEvent(
      description: "This is a shitty description",
      type: EventType.Hello,
      timestamp: DateTime.now().toString(),
      title: "Testing",
    ),
    TimelineEvent(
      description: "This is a shitty description",
      type: EventType.SameBirthday,
      timestamp: DateTime.now().toString(),
      title: "Testing",
    ),
    TimelineEvent(
      description: "This is a shitty description",
      type: EventType.Hello,
      timestamp: DateTime.now().toString(),
      title: "Testing",
    ),
    TimelineEvent(
      description: "This is a shitty description",
      type: EventType.Hello,
      timestamp: DateTime.now().toString(),
      title: "Testing",
    ),
    TimelineEvent(
      description: "This is a shitty description",
      type: EventType.Hello,
      timestamp: DateTime.now().toString(),
      title: "Testing",
    ),
    TimelineEvent(
      description: "This is a shitty description",
      type: EventType.Hello,
      timestamp: DateTime.now().toString(),
      title: "Testing",
    ),
    TimelineEvent(
      description: "This is a shitty description",
      type: EventType.Hello,
      timestamp: DateTime.now().toString(),
      title: "Testing",
    ),
    TimelineEvent(
      description: "This is a shitty description",
      type: EventType.Hello,
      timestamp: DateTime.now().toString(),
      title: "Testing",
    ),
    TimelineEvent(
      description: "This is a shitty description",
      type: EventType.Hello,
      timestamp: DateTime.now().toString(),
      title: "Testing",
    ),
    TimelineEvent(
      description: "This is a shitty",
      type: EventType.Hello,
      timestamp: DateTime.now().toString(),
      title: "Testing",
    ),
  ];

  get fullTimeline {
    final timeline = [...this._events];
    return timeline;
  }

  String checkEventType(TimelineEvent event) {
    switch (event.type) {
      case EventType.Intro:
        return 'intro';
      case EventType.Hello:
        return 'hello';
      case EventType.SameBirthday:
        return 'samename';
      default:
        return null;
    }
  }
}
