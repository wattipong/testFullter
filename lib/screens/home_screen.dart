import 'package:flutter/material.dart';
import 'package:test_apps/screens/page_one.dart';
import 'package:test_apps/screens/page_three.dart';
import 'package:test_apps/screens/page_two.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Field
  int currentIndex = 0;
  List pages = [PageOne(), PageTwo(), PageThree()];

  //Method

  Widget floattingAction() {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {},
    );
  }

  Widget iconButtonHome() {
    return IconButton(
      icon: Icon(Icons.home),
      onPressed: () {},
    );
  }

  Widget iconButtonPeople() {
    return IconButton(
      icon: Icon(Icons.people),
      onPressed: () {},
    );
  }

  Widget appBar() {
    return AppBar(
      title: Text(
        'Home Screen',
        style: TextStyle(
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: <Widget>[
        iconButtonHome(),
        iconButtonPeople(),
      ],
    );
  }

  Widget bottonNavbar() {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (int index) {
        setState(() {
          currentIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('หน้าแรก'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          title: Text('ข้อมูลส่วนตัว'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          title: Text('ตั้งค่า'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottonNavbar(),
      floatingActionButton: floattingAction(),
      appBar: appBar(),
      body: Center(
        child: pages[currentIndex],
      ),
    );
  }
}
