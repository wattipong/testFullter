import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_apps/screens/add_screen.dart';
import 'package:test_apps/screens/login_screen.dart';
import 'package:test_apps/screens/page_one.dart';
import 'package:test_apps/screens/page_three.dart';
import 'package:test_apps/screens/users_screen.dart';

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
      home:  LoginScreen(),
      routes: <String, WidgetBuilder>{
        '/add': (BuildContext context) => AddScreen('Hello'),
        '/photo': (BuildContext context) => PageOne(),
        '/setting': (BuildContext context) => PageThree(),
        '/user': (BuildContext context) => UserScreen()
      },
    );
  }
}
