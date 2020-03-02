import 'package:flutter/material.dart';
import 'package:test_apps/screens/add_screen.dart';
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

  TextStyle myStyle = TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold);
  TextStyle myStyle2 = TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);

  //Method

  Widget floattingAction() {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () async {
        var response = await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AddScreen('Hello Flutter')));
        print(response['name']);
      },
    );
  }

  Widget iconButtonHome() {
    return IconButton(
      icon: Icon(Icons.home),
      onPressed: () => Navigator.of(context).pushNamed('/add'),
    );
  }

  Widget iconButtonPeople() {
    return IconButton(
      icon: Icon(Icons.people),
      onPressed: () => Navigator.of(context).pushNamed('/photo'),
    );
  }

  Widget appBar() {
    return AppBar(
      title: Text(
        'Home Screen',
        style: myStyle,
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
        //  setState() ใช้งานการ ReAssign ค่าที่มีการเปลี่ยนแปลง หมายเหตุใช้ได้กับ  StateFull เท่านั้น
        setState(() {
          currentIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('หน้าแรก', style: myStyle2),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          title: Text('ข้อมูลส่วนตัว', style: myStyle2),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          title: Text('ตั้งค่า', style: myStyle2),
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
