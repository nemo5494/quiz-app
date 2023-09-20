import 'package:flutter/material.dart';
import 'package:frontend_practice/answer_button.dart';
import 'package:frontend_practice/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onSelectedAnswer});
  final void Function(String answer) onSelectedAnswer;
  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;

  answerQuestion(String selectedAnswer) {
    widget.onSelectedAnswer(
        selectedAnswer); //"widget. gives access to elements in widget class"
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity, //takes as many space as available,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(currentQuestion.text,
                style: GoogleFonts.lato(
                    color: const Color.fromARGB(255, 229, 167, 239),
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
            const SizedBox(height: 30),
            // ... operator makes the list of items as invidual
            ...currentQuestion.getShuffeledAnswers().map(
              //this converts this list of string into list of answer button
              (answer) {
                return AnswerButton(
                  answerText: answer,
                  onTap: () {
                    answerQuestion(
                        answer); //the answer the user selected is passed to the function
                  },
                ); //.map does not change the original list
              },
            ),
          ],
        ),
      ),
    );
  }
}
