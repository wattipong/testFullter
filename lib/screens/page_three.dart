import 'package:flutter/material.dart';

class PageThree extends StatefulWidget {
  @override
  _PageThreeState createState() => _PageThreeState();
}

class _PageThreeState extends State<PageThree> {
// Field

//Mathod
  Widget divider() {
    return Divider(
      color: Colors.blueGrey,
    );
  }

  Widget listTileProfile() {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage('images/black.jpg'),
      ),
      title: Text('Profile'),
      subtitle: Text('Manage Profile'),
      trailing: Icon(Icons.keyboard_arrow_right),
    );
  }

  Widget listTileKey() {
    return ListTile(
      leading: Icon(Icons.vpn_key),
      title: Text('Password'),
      subtitle: Text('How to Reset Password'),
      trailing: Icon(Icons.keyboard_arrow_right),
    );
  }

  Widget textHeader() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(child: Icon(Icons.library_books)),
          Expanded(
            flex: 5,
            child: Text(
              'Setting Menu',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget columnCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        textHeader(),
        divider(),
        listTileProfile(),
        listTileKey(),
      ],
    );
  }

  Widget card() {
    return Card(
      child: columnCard(),
    );
  }

  Widget listView() {
    return ListView(
      children: <Widget>[
        card(),
        SizedBox(
          height: 0.1,
        ),
        card(),
        card(),
        card(),
        card(),
        card(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return listView();
  }
}
