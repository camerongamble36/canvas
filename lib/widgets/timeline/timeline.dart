import 'package:canvas/providers/timeline.provider.dart';
import 'package:canvas/widgets/timeline/timelineItem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Timeline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final timelineProvider = Provider.of<TimelineProvider>(context);
    final timelineEvents = timelineProvider.fullTimeline;
    return Container(
      padding: EdgeInsets.all(32),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Timeline',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            Text(
              "This is a cute mantra",
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 18),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              height: 500,
              child: timelineEvents.length <= 0 || timelineEvents == null
                  ? Center(
                      child: Text('No Timeline Events...'),
                    )
                  : ListView.builder(
                      itemBuilder: (ctx, index) {
                        return TimelineItem(timelineEvents[index], index);
                      },
                      itemCount: timelineEvents.length,
                    ),
            )
          ],
        ),
      ),
    );
  }
}
