import 'package:canvas/widgets/tiles/affirmationTile.dart';
import 'package:canvas/widgets/tiles/attributesTile.dart';
import 'package:canvas/widgets/tiles/starterTile.dart';
import 'package:canvas/widgets/user/userBio.dart';
import 'package:flutter/material.dart';

class UserProfileScreen extends StatefulWidget {
  static const routeName = '/profile';
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final _tiles = <Widget>[
    StarterTile(true),
    AffirmationTile(true),
    AttributesTile(true)
  ];

  final _tabs = <Tab>[
    Tab(
      icon: Icon(
        Icons.info_outline,
        color: Colors.deepPurple,
      ),
    ),
    Tab(
        icon: Icon(
      Icons.playlist_add_check,
      color: Colors.deepPurple,
    )),
    Tab(
        icon: Icon(
      Icons.grid_on,
      color: Colors.deepPurple,
    )),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              UserBio(),
              TabBar(tabs: this._tabs),
              Container(
                height: 475,
                child: TabBarView(
                  children: this._tiles,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
