import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
//Field
  var users;
  bool isLoading = true;

//Method
  Future<Null> getUsers() async {
    final response = await http.get('https://randomuser.me/api/?results=20');

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);

      setState(() {
        isLoading = false;
        users = jsonResponse['results'];
      });
    } else {
      print('Connection error');
    }
  }

  @override
  void initState() {
    //TODO: implement initState
    super.initState();
    getUsers();
  }

  Widget listTileBuilder(int index) {
    return ListTile(
      leading:
          Image(image: NetworkImage('${users[index]['picture']['medium']}')),
      title: Text(
        'Name : ' +
            '${users[index]['name']['first']}' +
            ' ' +
            '${users[index]['name']['last']}',
        style: TextStyle(fontSize: 20.0),
      ),
      subtitle: Text('Email: ' + '${users[index]['email']}'),
      trailing: Icon(Icons.keyboard_arrow_right),
      onTap: () {
        print('${users[index]['name']['first']}');
      },
    );
  }

  Widget lisviewBuilder() {
    return ListView.builder(
      physics: AlwaysScrollableScrollPhysics(),
      itemBuilder: (context, int index) {
        return Column(
          children: <Widget>[
            listTileBuilder(index),
            Divider(),
          ],
        );
      },
      itemCount: users != null ? users.length : 0,
    );
  }

  Widget appBar() {
    return AppBar(
      title: Text('User List'),
      actions: <Widget>[
        IconButton(icon: Icon(Icons.cloud_upload), onPressed: () {}),
        IconButton(icon: Icon(Icons.cloud_upload), onPressed: () {}),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: RefreshIndicator(
        onRefresh: getUsers,
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Card(
                child: lisviewBuilder(),
              ),
      ),
      appBar: appBar(),
    );
  }
}
