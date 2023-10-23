import 'package:flutter/material.dart';
import 'package:quiz_app/src/data/questions.dart';
import 'package:quiz_app/src/widgets/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({super.key, required this.chosenAnswers});
  final List<String> chosenAnswers;
  int correctCount = 0;
  List<Map<String, dynamic>> getSummaryDate() {
    correctCount = 0;
    List<Map<String, dynamic>> result = [];
    for (var i = 0; i < chosenAnswers.length; i++) {
      final question = questions[i];
      if (chosenAnswers[i] == question.answers[0]) correctCount++;
      result.add(
        {
          'question_index': i,
          'question': question.text,
          'user_answer': chosenAnswers[i],
          'correct_answer': question.answers[0],
        },
      );
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final summary = getSummaryDate();
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  'you answered $correctCount out of ${chosenAnswers.length} questions correctly'),
              SizedBox(
                height: 30,
              ),
              QuestionSummary(summary),
              SizedBox(
                height: 30,
              ),
              TextButton.icon(
                onPressed: () {},
                icon: Icon(Icons.restart_alt),
                label: Text('Restart Quiz'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
