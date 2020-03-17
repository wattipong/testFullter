import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:test_apps/screens/home_screen.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //feild

  TextEditingController ctrlUsername = TextEditingController();
  TextEditingController ctrlPassword = TextEditingController();

  TextStyle txtStyleFrmFld = TextStyle(
      fontSize: 20.0, fontFamily: 'Merriweather', color: Colors.black);

  //method
  Future<Null> doLogin() async {
    final response = await http.post(
      'http://192.168.5.3:8080/users/login',
      body: {
        'username': ctrlUsername.text.trim(),
        'password': ctrlPassword.text.trim()
      },
    );

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      if (jsonResponse['OK']) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (constext) => HomeScreen()));
      } else {
        alertLogin(jsonResponse['description'], jsonResponse['field']);
      }
    } else {
      print('Connection error');
    }
  }

  Future<Alert> alertLogin(String _desc, String _title) {
    Alert(
      context: context,
      type: AlertType.warning,
      title: _title,
      desc: _desc,
      buttons: [
        DialogButton(
          color: Colors.blueAccent,
          child: Text(
            "CLOSE",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          width: 120,
        )
      ],
    ).show();
  }

  Widget txtfrmfldUsername() {
    return TextFormField(
      controller: ctrlUsername,
      style: txtStyleFrmFld,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: "Usernmae",
        prefixIcon: Icon(Icons.supervised_user_circle),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
    );
  }

  Widget txtfrmfldPassword() {
    return TextFormField(
      controller: ctrlPassword,
      style: txtStyleFrmFld,
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      decoration: InputDecoration(
        labelText: "Password",
        prefixIcon: Icon(Icons.vpn_key),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
    );
  }

  Widget materialButtonLogin() {
    return Material(
      borderRadius: BorderRadius.all(
        const Radius.circular(30.0),
      ),
      shadowColor: Colors.red,
      elevation: 5.0,
      child: MaterialButton(
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0)),
        child: Text(
          'Login',
          style: new TextStyle(
            color: Colors.white,
            fontSize: 25.0,
            fontWeight: FontWeight.w300,
            letterSpacing: 0.3,
          ),
        ),
        color: Colors.blue[400],
        height: 55.0,
        minWidth: 250.0,
        onPressed: () => doLogin(),
      ),
    );
  }

  Widget flatButtonRegister() {
    return FlatButton(
      shape: new RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(30.0),
      ),
      onPressed: () {},
      child: Text(
        'Register',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
        ),
      ),
    );
  }

  Widget formLogin() {
    return Form(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: imageLogo(),
          ),
          txtfrmfldUsername(),
          SizedBox(height: 10.0),
          txtfrmfldPassword(),
          SizedBox(height: 20.0),
          materialButtonLogin(),
          SizedBox(height: 10),
          flatButtonRegister(),
        ],
      ),
    );
  }

  Widget imageLogo() {
    return Image(
      width: 200.0,
      height: 100.0,
      image: AssetImage('images/logo.png'),
    );
  }

  Widget listViewLogin() {
    return ListView(
      children: <Widget>[
        Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: formLogin(),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget stackLogin() {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
          color: Colors.blueGrey,
          child: listViewLogin(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: stackLogin(),
    );
  }
}
