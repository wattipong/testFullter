import 'package:flutter/material.dart';

class PageTwo extends StatefulWidget {
  @override
  _PageTwoState createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Image(
          height: 100,
          // width: 100,
          image: AssetImage('images/black.jpg'),
        ),
        Container(
          height: 100.0,
          color: Colors.green,
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Container(
                height: 100.0,
                color: Colors.grey,
              ),
            ),
            Expanded(
              child: Container(
                height: 100.0,
                color: Colors.orange,
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Container(
                height: 100.0,
                color: Colors.blue,
              ),
            ),
            Expanded(
              child: Container(
                height: 100.0,
                color: Colors.green,
              ),
            ),
            Expanded(
              child: Container(
                height: 100.0,
                color: Colors.yellow,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
