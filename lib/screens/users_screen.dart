import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
//Field
  var users;
  var itemid;
  bool isLoading = true;

  final url = 'http://146.88.48.51:3000';

//Method

  Future<Null> getUsers() async {
    // final response = await http.get('https://randomuser.me/api/?results=20');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = await sharedPreferences.get('access_token');

    String hearder = 'Bearer $token';

    final _response = await http.get(
      '$url/products/all',
      headers: {HttpHeaders.authorizationHeader: hearder},
    );

    if (_response.statusCode == 200) {
      var responseJson = json.decode(_response.body);

      setState(() {
        isLoading = false;
        itemid = responseJson['result'];
      });
    } else {
      print('Connection error');
    }
  }

  @override
  void initState() {
    
    super.initState();
    getUsers();
  }

  Widget listTileBuilder(int index) {
    return ListTile(
      leading:
          Image(image: NetworkImage('$url/images/${itemid[index]['image']}')),
      title: Text(
        'Item : ' + '${itemid[index]['name']}',
        style: TextStyle(fontSize: 20.0),
      ),
      subtitle: Text('price: ' + '${itemid[index]['price']}'),
      trailing: Icon(Icons.keyboard_arrow_right),
      onTap: () {
        print('${itemid[index]['name']}');
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
      //itemCount: users != null ? users.length : 0,
      itemCount: itemid != null ? itemid.length : 0,
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
