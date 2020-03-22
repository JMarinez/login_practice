import 'package:flutter/material.dart';

import 'pages/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        cursorColor: Colors.red
      ),
      home: LoginPage(title: 'Flutter Demo Home Page'),
    );
  }
}