import 'package:canvas/widgets/narrator/narratorAttributes.dart';
import 'package:canvas/widgets/narrator/narratorAvatar.dart';
import 'package:canvas/widgets/narrator/narratorBio.dart';
import 'package:canvas/widgets/narrator/narratorDescription.dart';
import 'package:flutter/material.dart';

class NarratorScreen extends StatelessWidget {
  static const routeName = '/narrator';
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Narrator coming soon!'),
    );
    // return Container(
    //   padding: EdgeInsets.all(32),
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.stretch,
    //     children: [
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //         children: [
    //           NarratorAvatar(),
    //           Container(
    //             width: 150,
    //             child: Column(
    //               mainAxisAlignment: MainAxisAlignment.start,
    //               children: [
    //                 NarratorBio(),
    //                 NarratorDescription(),
    //               ],
    //             ),
    //           ),
    //         ],
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.all(12),
    //         child: NarratorAttributes(),
    //       ),
    //     ],
    //   ),
    // );
  }
}
