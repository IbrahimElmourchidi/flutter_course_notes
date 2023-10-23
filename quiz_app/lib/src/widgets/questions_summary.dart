import 'package:flutter/material.dart';
import 'package:quiz_app/src/widgets/index_ball.dart';

class QuestionSummary extends StatelessWidget {
  QuestionSummary(this.summaryData, {super.key});
  final List<Map<String, dynamic>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              final isCorrect = data['user_answer'] == data['correct_answer'];
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IndexBall((data['question_index'] + 1).toString()),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data['question'],
                            style: TextStyle(
                              color: isCorrect
                                  ? Color.fromARGB(255, 251, 255, 0)
                                  : Color.fromARGB(255, 172, 1, 1),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            data['user_answer'],
                            style: TextStyle(
                              color: Color.fromARGB(255, 127, 53, 129),
                            ),
                          ),
                          Text(data['correct_answer']),
                          SizedBox(
                            height: 16,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
