import 'package:flutter/material.dart';

class IndexBall extends StatelessWidget {
  IndexBall(this.index, {super.key});
  String index;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(200)),
        gradient: LinearGradient(
          colors: [
            Colors.greenAccent,
            Colors.green,
          ],
        ),
      ),
      child: Center(
          child: Text(
        index,
        style: TextStyle(
          fontSize: 20,
        ),
      )),
    );
  }
}
