import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final String buttonText;
  final Function onPressedHandler;

  SubmitButton({this.buttonText, this.onPressedHandler});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(
        buttonText,
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
      onPressed: onPressedHandler,
    );
  }
}
