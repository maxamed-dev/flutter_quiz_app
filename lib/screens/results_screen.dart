import 'package:flutter/material.dart';
import 'package:adv_basic/data/questions.dart';
import 'package:adv_basic/widgets/quiz_summary.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({
    Key? key,
    required this.answeredQuestions,
  }) : super(key: key);

  final List<String> answeredQuestions;

  List<Map<String, Object>> getResults() {
    final summaryResult = <Map<String, Object>>[];

    for (var i = 0; i < answeredQuestions.length; i++) {
      summaryResult.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[0],
        'chosen_answer': answeredQuestions[i],
      });
    }

    return summaryResult;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Center items on the vertical axis
          children: [
            // Text that states how many questions were answered correctly
            const Text(
              'You answered 0 out of 0 questions correctly!',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            // list of answers and questions

            //Button to restart the quiz
            ElevatedButton.icon(
              onPressed: () {},
              label: const Text('Restart Quiz'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo.shade300,
              ),
              icon: const Icon(Icons.replay),
            ),
          ],
        ),
      ),
    );
  }
}

//This is the questionsscreen
/*     return Container(
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
    ); */
