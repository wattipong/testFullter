import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // field
  String firstName = 'Staf', lastName = 'lalea';
  String address = ''' 
  line1
  line2
  line3
     ''';
  int age = 20;
  double weigth = 60.0;
  double height = 170.0;
  bool isActive = true;
  bool isCancel = false;
  var description = 'sss';

  Map map = {'type': 'Admin', 'code': 'AMD'};
  Map<String, int> types2 = {'age': 20, 'height': 160};

  List sex = ['male', 'female'];
  List<int> ages = [10, 20, 30];
  List<Map<String, int>> myusers = [
    {'widgh': 60, 'age': 20}
  ];

  // Method
  Future<void> showName(String name, int age) {
    print('Name : $name , Age: $age');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test App'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            print('$firstName , $lastName');
            print('${1 + 1} ');
            print(' ======= ');

            double bmi = weigth / ((height / 100) * (height / 100));
            print(' bmi ====> $bmi');
            showName('Flutter', 30);
            Person person = Person('Hello Flutter');
            person.showName();
          },
          color: Colors.blue.shade500,
          textColor: Colors.white,
          child: Text('Click Me !'),
        ),
      ),
    );
  }
}

class Person {
  String name;

  Person(this.name);

  showName() {
    print('Clasee , Name ===> $name');
  }
}
