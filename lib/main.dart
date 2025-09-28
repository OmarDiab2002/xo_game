import 'package:flutter/material.dart';
import 'package:xo_game/screens/home_screen.dart';
import 'package:xo_game/screens/start_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: StartScreen.routeName,
      routes: {
        StartScreen.routeName: (_) => StartScreen(),
        HomeScreen.routeName: (_) => HomeScreen(),
      },
    );
  }
}
