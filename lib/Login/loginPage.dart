import 'package:flutter/material.dart';

//import './loginForm.dart';

class LoginPage extends StatefulWidget {
  final String title;

  LoginPage({this.title});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();

  final String user = "juanjosemf";
  final String password = "modapalafoka3";

  static String inputUser;
  static String inputPass;

  Future<void> _showAlertDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        if (user == inputUser && password == inputPass) {
          return AlertDialog(
            title: Text('Sesion Iniciada!'),
            content: Text('Bienvenido, $user!'),
          );
        }
        return AlertDialog(
          title: Text("Error!"),
          content: Text("Credenciales no existen en la base de datos."),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            child: Image.asset('assets/images/intec.jpg'),
            width: 200,
            height: 200,
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
                          return 'Por favor suministrar nombre de usuario';
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
                          return 'Por favor suministrar contraseña';
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
                _showAlertDialog();
              }
            },
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
      backgroundColor: Colors.white,
    );
  }
}
