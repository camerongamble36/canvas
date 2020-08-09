import 'package:canvas/providers/affirmations.provider.dart';
import 'package:canvas/providers/auth.provider.dart';
import 'package:canvas/providers/canvas.provider.dart';
import 'package:canvas/providers/narrator.provider.dart';
import 'package:canvas/providers/stories.provider.dart';
import 'package:canvas/providers/timeline.provider.dart';
import 'package:canvas/screens/canvasStoryScreen.dart';
import 'package:canvas/screens/canvasTimelineScreen.dart';
import 'package:canvas/screens/loginScreen.dart';
import 'package:canvas/screens/narratorScreen.dart';
import 'package:canvas/screens/signupScreen.dart';
import 'package:canvas/screens/userProfileScreen.dart';
import 'package:flutter/material.dart';
import 'package:canvas/screens/homeScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => AffirmationsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => CanvasProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => StoriesProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => NarratorProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => TimelineProvider(),
        ),
      ],
      child: Consumer<AuthProvider>(
        builder: (ctx, auth, _) => MaterialApp(
          title: 'Canvas',
          theme: ThemeData(
            primarySwatch: Colors.deepPurple,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: HomeScreen(),
          // home: auth.isAuth ? HomeScreen() : LoginScreen(),
          routes: {
            HomeScreen.routeName: (ctx) => HomeScreen(),
            LoginScreen.routeName: (ctx) => LoginScreen(),
            SignupScreen.routeName: (ctx) => SignupScreen(),
            NarratorScreen.routeName: (ctx) => NarratorScreen(),
            UserProfileScreen.routeName: (ctx) => UserProfileScreen(),
            CanvasStoryScreen.routeName: (ctx) => CanvasStoryScreen(),
            CanvasTimelineScreen.routeName: (ctx) => CanvasTimelineScreen(),
          },
        ),
      ),
    );
  }
}
