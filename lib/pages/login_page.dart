import 'package:flutter/material.dart';

import 'home_page.dart';
import 'register_page.dart';
import '../components/submit_button.dart';
import '../components/validator_form_field.dart';

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
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _user = TextEditingController();
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
          _loginForm(),
          _loginErrorMessage(),
          _loginButton(),
          FlatButton(
            child: Text('Register'),
            onPressed: () {
              _returnAccount(context);
            },
          )
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
      backgroundColor: Colors.white,
    );
  }

  Form _loginForm() {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
              child: _usernameField(),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
              child: _passwordField(),
            ),
          ],
        ),
      ),
    );
  }

  ValidatorFormField _usernameField() {
    return ValidatorFormField(
      controller: _user,
      hintText: 'Username',
      icon: Icon(Icons.account_box),
      isPasswordField: false,
      validator: (value) {
        if (value.isEmpty) {
          return 'Please fill in your username';
        }
        inputUser = value.toString();
        return null;
      },
    );
  }

  ValidatorFormField _passwordField() {
    return ValidatorFormField(
      controller: _pass,
      hintText: 'Password',
      icon: Icon(Icons.lock),
      isPasswordField: true,
      validator: (value) {
        if (value.isEmpty) {
          return 'Please fill in your password';
        }
        inputPass = value.toString();
        return null;
      },
    );
  }

  AnimatedOpacity _loginErrorMessage() {
    return AnimatedOpacity(
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
    );
  }

  SubmitButton _loginButton() {
    return SubmitButton(
      buttonText: 'Log in',
      onPressedHandler: () {
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
                    MaterialPageRoute(builder: (context) => HomePage()))
                .then((value) {
              _user.clear();
              _pass.clear();
            });
          }
        }
      },
    );
  }

  _returnAccount(BuildContext context) async {
    final result = await Navigator.push(
            context, MaterialPageRoute(builder: (context) => RegisterPage()))
        .then((value) {
      _user.clear();
      _pass.clear();
    });

    print(result);
  }
}
