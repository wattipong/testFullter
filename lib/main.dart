import 'package:flutter/material.dart';
import 'package:test_apps/screens/add_screen.dart';
import 'package:test_apps/screens/home_screen.dart';
import 'package:test_apps/screens/page_one.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Merriweather',
        scaffoldBackgroundColor: Colors.pink,
        accentColor: Colors.amber,
      ),
      title: 'My App',
      home: HomeScreen(),
      routes: <String, WidgetBuilder>{
        '/add': (BuildContext context) => AddScreen('Hello'),
        '/photo': (BuildContext context) => PageOne(),
      },
    );
  }
}
