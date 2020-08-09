import 'package:canvas/screens/signupScreen.dart';
import 'package:canvas/widgets/activateNewCanvasModal.dart';
import 'package:flutter/material.dart';

// Screens
import 'package:canvas/screens/narratorScreen.dart';
import 'package:canvas/screens/userProfileScreen.dart';
import 'package:canvas/screens/canvasStoryScreen.dart';
import 'package:canvas/screens/canvasTimelineScreen.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  String _selection;

  final _widgets = <Widget>[
    CanvasStoryScreen(),
    CanvasTimelineScreen(),
    NarratorScreen(),
    UserProfileScreen(),
  ];

  void _selectIndex(int index) {
    setState(() {
      this._selectedIndex = index;
    });
  }

  void _activateNewCanvas(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return ActivateNewCanvasModal();
      },
    );
  }

  void _navToAuth(BuildContext ctx) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) {
        return SignupScreen();
      }),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Canvas'), centerTitle: true, actions: [
        PopupMenuButton<String>(
          onSelected: (String result) {
            setState(() {
              _selection = result;
            });
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
            const PopupMenuItem<String>(
              value: "logout",
              child: ListTile(
                leading: Icon(Icons.not_interested),
                title: Text('Logout'),
                trailing: IconButton(
                  icon: Icon(Icons.arrow_forward_ios),
                  // onPressed: () => _navToAuth(context),
                ),
                // onTap: () => _navToAuth(context),
              ),
            ),
            const PopupMenuItem<String>(
              value: "settings",
              child: ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
                trailing: IconButton(
                  icon: Icon(Icons.arrow_forward_ios),
                  // onPressed: () => _navToAut(context),
                ),
              ),
            ),
            const PopupMenuItem<String>(
              value: "help",
              child: ListTile(
                leading: Icon(Icons.help),
                title: Text('Help'),
                trailing: IconButton(
                  icon: Icon(Icons.arrow_forward_ios),
                  // onPressed: () => _navToAuth(context),
                ),
              ),
            ),
          ],
        ),
      ]),
      body: this._widgets.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectIndex,
        currentIndex: _selectedIndex,
        unselectedItemColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).primaryColorDark,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            title: Text("Home"),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            title: Text("Timeline"),
            icon: Icon(Icons.list),
          ),
          BottomNavigationBarItem(
            title: Text("Narrator"),
            icon: Icon(Icons.speaker_notes),
          ),
          BottomNavigationBarItem(
            title: Text("Me"),
            icon: Icon(Icons.person),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.add),
        onPressed: () => _activateNewCanvas(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
