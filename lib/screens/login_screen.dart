import 'package:flutter/material.dart';
import 'package:test_apps/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //feild
  TextEditingController ctrlUsername = TextEditingController();
  TextEditingController ctrlPassword = TextEditingController();
  //method

  void dolog() {
    print(ctrlUsername.text);
    print(ctrlPassword.text);

    if (ctrlUsername.text.trim() == 'admin' &&
        ctrlPassword.text == 'admin'.trim()) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (constext) => HomeScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            color: Colors.pink,
          ),
          ListView(
            children: <Widget>[
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image(
                      width: 200.0,
                      height: 200.0,
                      image: AssetImage('images/logo.png'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(50.0),
                      child: Form(
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              controller: ctrlUsername,
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontFamily: 'Merriweather',
                                  color: Colors.black),
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                labelText: 'Email address',
                                prefixIcon: Icon(Icons.email),
                                filled: true,
                                fillColor: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            TextFormField(
                              controller: ctrlPassword,
                              style: TextStyle(
                                fontSize: 20.0,
                                fontFamily: 'Merriweather',
                                color: Colors.black,
                              ),
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: 'password',
                                prefixIcon: Icon(Icons.vpn_key),
                                filled: true,
                                fillColor: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Material(
                              borderRadius:
                                  BorderRadius.all(const Radius.circular(40.0)),
                              shadowColor: Colors.pinkAccent.shade100,
                              elevation: 5.0,
                              child: MaterialButton(
                                child: Text(
                                  'Login',
                                  style: new TextStyle(
                                    color: Colors.white,
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.w300,
                                    letterSpacing: 0.3,
                                  ),
                                ),
                                color: Colors.pinkAccent.shade100,
                                height: 55.0,
                                minWidth: 290.0,
                                onPressed: () => dolog(),
                              ),
                            ),
                            FlatButton(
                              onPressed: () {},
                              child: Text(
                                'Register New User',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
