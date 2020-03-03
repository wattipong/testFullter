import 'package:flutter/material.dart';

class AddScreen extends StatefulWidget {
  var params;

  AddScreen(this.params);

  @override
  _AddScreenState createState() => _AddScreenState(params);
}

class _AddScreenState extends State<AddScreen> {
  //Field
  var params;
  _AddScreenState(this.params);
  //Method
  Widget appBar() {
    return AppBar(
      title: Text('Add Data Screen'),
    );
  }

  Widget raisedButtonBack() {
    return RaisedButton(
      color: Colors.blue,
      onPressed: () => Navigator.of(context).pop({
        'id': 1000,
        'name': 'Flutter',
      }),
      child: Text('Back'),
    );
  }

  Widget listView() {
    return ListView(
      children: <Widget>[
        Text(
          'Params:$params',
          style: TextStyle(fontSize: 20.0),
        ),
        Text('Add data'),
        raisedButtonBack(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: listView(),
    );
  }
}
