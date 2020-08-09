import 'package:canvas/screens/editProfileScreen.dart';
import 'package:flutter/material.dart';

class UserBio extends StatelessWidget {
  void _startEditProfile(BuildContext ctx) {
    Navigator.of(ctx).push(
      MaterialPageRoute(builder: (_) {
        return EditProfileScreen();
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 32,
            child: Text(
              'CG',
              style: TextStyle(fontSize: 24),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            'Cameron Gamble',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '@stopitcam',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
          SizedBox(
            height: 16,
          ),
          InkWell(
            splashColor: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(16),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).primaryColor,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                'Edit',
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ),
            onTap: () => _startEditProfile(context),
          ),
        ],
      ),
    );
  }
}
