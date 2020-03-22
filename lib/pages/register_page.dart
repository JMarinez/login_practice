import 'package:flutter/material.dart';

import '../components/submit_button.dart';
import '../components/validator_form_field.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final _messageController = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              child: Image.asset('assets/images/intec.jpg'),
              width: 150,
              height: 150,
              alignment: Alignment.center,
            ),
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: _nameField(),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: _usernameField(),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: _passwordField(),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: _confirmPasswordField(),
                    ),
                  ],
                ),
              ),
            ),
            SubmitButton(
              buttonText: 'Register',
              onPressedHandler: () {
                if (_formKey.currentState.validate()) {
                  Navigator.pop(context, _messageController.text);
                }
              },
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
        ),
      ),
      backgroundColor: Colors.white,
    );
  }

  ValidatorFormField _nameField() {
    return ValidatorFormField(
      controller: _messageController,
      hintText: 'Name',
      icon: Icon(Icons.account_box),
      validator: (value) {
        if (value.isEmpty) {
          return 'Please fill in your name';
        }
        return null;
      },
    );
  }

  ValidatorFormField _usernameField() {
    return ValidatorFormField(
      hintText: 'Username',
      icon: Icon(Icons.account_box),
      validator: (value) {
        if (value.isEmpty) {
          return 'Please fill in your username';
        }
        return null;
      },
    );
  }

  ValidatorFormField _passwordField() {
    return ValidatorFormField(
      controller: _pass,
      hintText: 'Password',
      icon: Icon(Icons.account_box),
      isPasswordField: true,
      validator: (value) {
        if (value.isEmpty) {
          return 'Please fill in your password';
        }
        return null;
      },
    );
  }

  ValidatorFormField _confirmPasswordField() {
    return ValidatorFormField(
      controller: _confirmPass,
      hintText: 'Confirm Password',
      icon: Icon(Icons.account_box),
      isPasswordField: true,
      validator: (value) {
        if (value.isEmpty) {
          return 'Please confirm your password';
        } else if (value != _pass.text) {
          return 'Please make sure your password matches';
        }
        return null;
      },
    );
  }
}
