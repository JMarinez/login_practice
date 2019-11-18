import 'package:flutter/material.dart';

import 'package:login_practice/Home/homePage.dart';
import 'package:login_practice/Register/registerPage.dart';

//import './loginForm.dart';

class LoginPage extends StatefulWidget {
  final String title;

  LoginPage({this.title});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();

  final String user = 'juanjosemf';
  final String password = 'modapalafoka3';

  final String failedLogin = "Account doesn't exist. Please try again";

  static String inputUser;
  static String inputPass;

  bool showText = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            child: Image.asset('assets/images/intec.jpg'),
            width: 150,
            height: 150,
            alignment: Alignment.center,
          ),
          Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Username',
                        prefixIcon: Icon(
                          Icons.account_box,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                          ),
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please fill in your username';
                        }
                        inputUser = value.toString();
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                          ),
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please fill in your password';
                        }
                        inputPass = value.toString();
                        return null;
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          AnimatedOpacity(
            child: Container(
              child: Text(
                failedLogin,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 15,
                ),
              ),
              padding: EdgeInsets.all(8.0),
            ),
            opacity: showText ? 1 : 0,
            duration: Duration(milliseconds: 500),
          ),
          RaisedButton(
            child: Text(
              'Log In',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            color: Colors.red,
            textColor: Colors.white,
            disabledColor: Colors.grey,
            disabledTextColor: Colors.black,
            splashColor: Colors.redAccent,
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            onPressed: () {
              if (formKey.currentState.validate()) {
                if (user != inputUser || password != inputPass) {
                  setState(() {
                    showText = true;
                  });
                } else {
                  setState(() {
                    showText = false;
                  });
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                }
              }
            },
          ),
          FlatButton(
            child: Text('Register'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RegisterPage()),
              );
            },
          )
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
      backgroundColor: Colors.white,
    );
  }
}
