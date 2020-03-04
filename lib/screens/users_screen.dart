import 'package:flutter/material.dart';

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, int index) {
          return Card(
            child: ListTile(
              trailing: Icon(Icons.keyboard_arrow_right),
              title: Text(
                'xxxx',
                style: TextStyle(fontSize: 20.0),
              ),
              onTap: () {},
            ),
          );
        },
        itemCount: 10,
      ),
      appBar: AppBar(
        title: Text('Users List'),
      ),
    );
  }
}
