import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(context) {
    return MaterialApp(
      title: 'log me in',
      home: Scaffold(
        appBar: AppBar(
          title: Text('login form'),
        ),
        body: LoginScreen(),
      ),
    );
  }
}
