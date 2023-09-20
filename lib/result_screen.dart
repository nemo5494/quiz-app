import 'package:flutter/material.dart';
import 'package:frontend_practice/data/questions.dart';
import 'package:frontend_practice/questions_summary.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.chosenAnswers, this.onRestart, {super.key});
  final void Function() onRestart;
  final List<String> chosenAnswers;
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'Question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectAnswers = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length; //this will only store the length of correct answers

    return SizedBox(
      width: double.infinity,
      child: Container(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                'You answerd $numCorrectAnswers out of $numTotalQuestions answers \ncorrectly!',
                style: GoogleFonts.lato(
                    color: const Color.fromARGB(255, 238, 200, 253),
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              onPressed: onRestart,
              icon: const Icon(Icons.refresh),
              label: const Text('Restart Quiz'),
              style: TextButton.styleFrom(
                  foregroundColor: const Color.fromARGB(255, 207, 71, 231)),
            )
          ],
        ),
      ),
    );
  }
}
