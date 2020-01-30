import 'package:flutter/material.dart';
import 'package:test_apps/screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Redemption',
        scaffoldBackgroundColor: Colors.pink,
        accentColor: Colors.amber,
      ),
      title: 'My App',
      home: HomeScreen(),
    );
  }
}
