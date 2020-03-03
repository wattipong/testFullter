import 'package:flutter/material.dart';

class PageThree extends StatefulWidget {
  @override
  _PageThreeState createState() => _PageThreeState();
}

class _PageThreeState extends State<PageThree> {
// Field

//Mathod

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  'Setting Menu',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('Profile'),
                subtitle: Text('Maneger Profile'),
                trailing: Icon(
                  Icons.keyboard_arrow_right,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
