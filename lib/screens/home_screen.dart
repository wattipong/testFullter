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
      backgroundColor: Colors.blue.shade50,
      child: Icon(Icons.add),
      onPressed: () {},
    );
  }

  Widget appBar() {
    return AppBar(
      title: Text('Main Screen'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.home),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.people),
          onPressed: () {},
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget bottonNavbar = BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (int index) {
        setState(() {
          currentIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('หน้าหลัก'),
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
    return Scaffold(
      bottomNavigationBar: bottonNavbar,
      floatingActionButton: floattingAction(),
      appBar: appBar(),
      body: Center(
        child: pages[currentIndex],
      ),
    );
  }
}
