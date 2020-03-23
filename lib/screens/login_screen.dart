import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

  final GlobalKey<ScaffoldState> globalKey = new GlobalKey<ScaffoldState>();

  bool isLoading = false;
  bool isLogged = false;

  //method
  @override
  void initState() {
    super.initState();
    getToken();
  }

  Future<Null> getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = await sharedPreferences.get('token');
    if (token != null) {}
  }

  Future<void> doLogin() async {
    setState(() {
      isLoading = true;
    });

    try {
      final response = await http.post(
        'http://146.88.48.51:3000/users/login',
        body: {
          'username': ctrlUsername.text.trim(),
          'password': ctrlPassword.text.trim()
        },
      );

      var jsonResponse = json.decode(response.body);
      setState(() {
        isLoading = false;
      });

      if (jsonResponse['OK']) {
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.setString('token', jsonResponse['access_token']);

        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (constext) => HomeScreen()));
      } else {
        dialogAlert(
          'Alert: ' + jsonResponse['field'] + " !",
          jsonResponse['description'],
        );
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      dialogAlert(
        'Alert: Connection !',
        e,
      );
    }
  }

  Future<void> dialogAlert(String _title, String _discription) async {
    return showDialog<void>(
      context: context,
      //barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 24.0,
          title: Text(
            _title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Text(
                    _discription,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                //Text('You\’re like me. I’m never satisfied.'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: isLoading ? CircularProgressIndicator() : null,
          ),
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
      key: globalKey,
      body: stackLogin(),
    );
  }
}
