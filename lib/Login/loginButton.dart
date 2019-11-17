import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final Key key;

  LoginButton({this.key});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
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
      onPressed: null,
    );
  }
}
