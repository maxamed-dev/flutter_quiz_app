import 'package:adv_basic/screens/question_screen.dart';
import 'package:adv_basic/screens/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:adv_basic/data/questions.dart';
import 'package:adv_basic/screens/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> answeredQuestions = <String>[];
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void chosenAnswer(String answer) {
    setState(() {
      answeredQuestions.add(answer);

      if (answeredQuestions.length == questions.length) {
        setState(() {
          activeScreen = 'result-screen';
          //answeredQuestions.clear();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Quiz App',
      //font Ubuntu
      theme: ThemeData(
        fontFamily: 'Ubuntu',
      ),
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.deepPurple.shade300,
                Colors.deepPurple.shade900,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: activeScreen == 'start-screen'
              ? StarterScreen(switchScreen)
              : activeScreen == 'question-screen'
                  ? QuestionScreen(
                      onChosenAnswer: chosenAnswer,
                    )
                  : ResultScreen(
                      answeredQuestions: answeredQuestions,
                    ),
        ),
      ),
    );
  }
}
