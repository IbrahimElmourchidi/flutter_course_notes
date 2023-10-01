import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: [
          emailField(),
          SizedBox(height: 20.0),
          passwordField(),
          SizedBox(height: 20.0),
          submitButton(),
        ],
      ),
    );
  }

  Widget emailField() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Your Email',
        hintText: 'email@example.com',
      ),
      obscureText: false,
    );
  }

  Widget passwordField() {
    return TextField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: 'Your Password',
        hintText: 'Your Password',
      ),
      obscureText: false,
    );
  }

  Widget submitButton() {
    return ElevatedButton(
      onPressed: () {},
      child: Text('login'),
      style: ButtonStyle(
        backgroundColor:
            MaterialStateColor.resolveWith((states) => Colors.purple),
      ),
    );
  }
}
