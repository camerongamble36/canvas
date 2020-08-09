import 'package:flutter/material.dart';

class StarterTile extends StatelessWidget {
  final bool isActive;

  StarterTile(this.isActive);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(32),
      child: Column(
        children: [
          Center(
            child: Column(
              children: [
                Text(
                  'Introduction',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '\"Hello Again\"',
                  style: TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                Text(
                  'Buy, Sell, and Trade new ways to interact with each other',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 16,
          ),
          ListTile(
            leading: CircleAvatar(
              radius: 16,
              child: Text("1"),
            ),
            title: Text('Meet New People'),
          ),
          ListTile(
            leading: CircleAvatar(
              radius: 16,
              child: Text("2"),
            ),
            title: Text('Use Tiles'),
          ),
          ListTile(
            leading: CircleAvatar(
              radius: 16,
              child: Text("3"),
            ),
            title: Text('Record your results'),
          ),
        ],
      ),
    );
  }
}
