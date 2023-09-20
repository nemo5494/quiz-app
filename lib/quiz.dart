import 'package:flutter/material.dart';
import 'package:frontend_practice/data/questions.dart';
import 'package:frontend_practice/questions_screen.dart';
import 'package:frontend_practice/result_screen.dart';
import 'package:frontend_practice/start_screen.dart';

class Quiz extends StatefulWidget {
  //this is a public class
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

//_QuizState it means this class is private and not accessible outside of this file
class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = []; //list of string
  var activescreen = 'start-screen';

//the button that should trigger the state change is in one widget and the widget that should be affected by the state change is another widget.
  //2 widgets need to work in the same state
  void switchScreen() {
    setState(() {
      activescreen = 'question-screen';
    });
  }

  void onRestart() {
    setState(() {
      selectedAnswers = [];
      activescreen = 'question-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activescreen = 'result-screen';
      });
    }
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Color.fromARGB(255, 78, 13, 151),
              Color.fromARGB(255, 107, 15, 168)
            ], begin: Alignment.topRight, end: Alignment.bottomLeft)),
            child: activescreen == 'start-screen'
                ? StartScreen(switchScreen)
                : activescreen == 'result-screen'
                    ? ResultScreen(selectedAnswers, onRestart)
                    : QuestionScreen(onSelectedAnswer: chooseAnswer)),
      ),
    );
  }
}

//alternative:
//Widget? activescreen; //type Widget accepts all kind of Widgets
  // @override
  // void initState() {
  //   super.initState();
  //   activescreen = StartScreen(switchScreen);
  // }
  // void switchScreen() {
  //   setState(() {
  //     activescreen = const QuestionScreen();
  //   });
  // }...........(remaining code)

  // child: activescreen