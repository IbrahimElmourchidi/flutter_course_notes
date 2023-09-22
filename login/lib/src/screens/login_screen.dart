import 'package:flutter/material.dart';

import '../mixins/validation_mixin.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> with ValidationMixing {
  final formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            emailField(),
            SizedBox(
              height: 16,
            ),
            passwordField(),
            SizedBox(
              height: 16,
            ),
            submitButton()
          ],
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email Address',
        hintText: 'email@example.com',
      ),
      validator: validateEmail,
      onSaved: (String? value) {
        print(value);
        email = value ?? '';
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Your password',
        labelText: 'Password',
      ),
      obscureText: false,
      validator: validatePassword,
      onSaved: (String? value) {
        print(value);
        password = value ?? '';
      },
    );
  }

  Widget submitButton() {
    return ElevatedButton(
      onPressed: () {
        final isValid = formKey.currentState?.validate();
        if (isValid == true) {
          formKey.currentState?.save();
          print('time to post $email and $password to the api');
        }
      },
      child: Text('login'),
      style: ButtonStyle(
        backgroundColor: MaterialStateColor.resolveWith((states) {
          return Colors.purple;
        }),
      ),
    );
  }
}
