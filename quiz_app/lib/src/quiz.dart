import 'package:flutter/material.dart';
import 'package:quiz_app/src/data/questions.dart';
import 'package:quiz_app/src/screens/question_screen.dart';
import 'package:quiz_app/src/screens/results_screen.dart';
import 'package:quiz_app/src/screens/start_screen.dart';

class Quiz extends StatefulWidget {
  Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;
  List<String> selectedAnswers = [];

  void onAnswerSelected(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = ResultScreen(chosenAnswers: selectedAnswers);
        selectedAnswers = [];
      });
    }
  }

  @override
  void initState() {
    activeScreen = StartScreen(switchScreen);

    super.initState();
  }

  void switchScreen() {
    setState(() {
      activeScreen = QuestionScreen(onAnswerSelected: onAnswerSelected);
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 138, 148, 25),
                Color.fromARGB(255, 67, 153, 36),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
