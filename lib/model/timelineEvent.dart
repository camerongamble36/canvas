import 'package:flutter/material.dart';

enum EventType { Intro, Hello, SameBirthday }

class TimelineEvent {
  String id;
  String timestamp;
  String title;
  String description;
  EventType type;

  TimelineEvent({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.timestamp,
    this.type,
  });
}
