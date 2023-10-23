import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  AnswerButton({
    super.key,
    required this.text,
    required this.onTap,
  });
  final String text;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(199, 236, 180, 11),
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(999),
          ),
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 40)),
      onPressed: onTap,
      child: Text(
        text,
        textAlign: TextAlign.center,
      ),
    );
  }
}
