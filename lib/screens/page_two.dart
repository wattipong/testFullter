import 'package:flutter/material.dart';

class PageTwo extends StatefulWidget {
  @override
  _PageTwoState createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Image(
            fit: BoxFit.cover,
            height: 100,
            // width: 100,
            image: AssetImage('images/black.jpg'),
          ),
          Container(
            height: 100.0,
            color: Colors.green,
          ),
          Image(
            height: 100,
            // width: 100,
            image: AssetImage('images/black.jpg'),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Image(
                  fit: BoxFit.fill,
                  height: 100,
                  // width: 100,
                  image: AssetImage('images/black.jpg'),
                ),
              ),
              Expanded(
                child: Image(
                  fit: BoxFit.fill,
                  height: 100,
                  // width: 100,
                  image: AssetImage('images/black.jpg'),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Image(
                  fit: BoxFit.fitWidth,
                  height: 100,
                  // width: 100,
                  image: AssetImage('images/black.jpg'),
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
      ),
    ]);
  }
}
