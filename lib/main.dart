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
        ChangeNotifierProxyProvider<AuthProvider, AffirmationsProvider>(
          update: (ctx, auth, previousAffirmations) => AffirmationsProvider(
            auth.token,
            previousAffirmations == null
                ? []
                : previousAffirmations.affirmations,
          ),
        ),
        ChangeNotifierProxyProvider<AuthProvider, StoriesProvider>(
          update: (ctx, auth, previousStories) => StoriesProvider(
            auth.token,
            previousStories == null ? [] : previousStories.allStories,
          ),
        ),
        ChangeNotifierProxyProvider<AuthProvider, NarratorProvider>(
          update: (ctx, auth, previousNarrator) => NarratorProvider(
            auth.token,
            previousNarrator == null
                ? []
                : previousNarrator.currentNarratorConfig,
          ),
        ),
        ChangeNotifierProxyProvider<AuthProvider, CanvasProvider>(
          update: (ctx, auth, previousCanvas) => CanvasProvider(
            auth.token,
            previousCanvas == null ? [] : previousCanvas.canvases,
          ),
        ),
        ChangeNotifierProxyProvider<AuthProvider, TimelineProvider>(
          update: (ctx, auth, previousEvents) => TimelineProvider(
            auth.token,
            previousEvents == null ? [] : previousEvents.fullTimeline,
          ),
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
