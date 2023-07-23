import 'package:adv_basic/data/questions.dart';
import 'package:flutter/material.dart';
import 'package:adv_basic/widgets/answer_button.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({
    Key? key,
    required this.onChosenAnswer,
  }) : super(key: key);

  final void Function(String answer) onChosenAnswer;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  var activeQuestionIndex = 0;

  void nextQuestion(String chosenAnswer) {
    widget.onChosenAnswer('...');
    setState(() {
      activeQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[activeQuestionIndex];

    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height *
                    0.025, // Top margin 5% of total height
              ),
              child: Text(
                currentQuestion.text,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            // best practise way to display the answers
            ...currentQuestion
                .getShuffledAnswers()
                .map((answer) => Container(
                      width: MediaQuery.of(context).size.width * .8,
                      child: AnswerButton(
                        answerText: answer,
                        onTap: () {
                          nextQuestion(answer);
                        },
                      ),
                    ))
                .toList(),
          ],
        ),
      ),
    );
  }
}
