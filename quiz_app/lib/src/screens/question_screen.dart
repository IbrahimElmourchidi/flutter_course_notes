import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:quiz_app/src/widgets/answer_button.dart';
import 'package:quiz_app/src/data/questions.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onAnswerSelected});
  final void Function(String answer) onAnswerSelected;
  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;
  answerQuestion(String answer) {
    setState(() {
      currentQuestionIndex++;
      widget.onAnswerSelected(answer);
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30,
            ),
            // for (var answer in currentQuestion.answers)
            //   AnswerButton(
            //     text: answer,
            //     onTap: () {},
            //   ),
            ...currentQuestion.shuffledAnswers.map((answer) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AnswerButton(
                    text: answer,
                    onTap: () {
                      answerQuestion(answer);
                    },
                  ),
                  SizedBox(
                    height: 12,
                  )
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
