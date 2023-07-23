import 'package:flutter/material.dart';
import 'package:adv_basic/data/questions.dart';
import 'package:adv_basic/widgets/quiz_summary.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({
    Key? key,
    required this.answeredQuestions,
    required this.onRestartQuiz,
  }) : super(key: key);

  final List<String> answeredQuestions;
  final void Function() onRestartQuiz;

  List<Map<String, Object>> getResults() {
    final summaryResult = <Map<String, Object>>[];

    for (var i = 0; i < answeredQuestions.length; i++) {
      summaryResult.add({
        'question_index': i,
        'question': questions[i].text,
        //First element is always the correct answer
        'correct_answer': questions[i].answers[0],
        'chosen_answer': answeredQuestions[i],
      });
    }

    return summaryResult;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getResults();
    final numberOfCorrectAnswers = summaryData.where((entry) {
      return entry['chosen_answer'] == entry['correct_answer'];
    }).length;
    final numberOfTotalQuestions = answeredQuestions.length;

    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Center items on the vertical axis
          children: [
            // Text that states how many questions were answered correctly
            Container(
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height *
                    0.05, // Top margin 5% of total height
              ),
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.1, //
                ),
                child: Text(
                  'You answered $numberOfCorrectAnswers out of $numberOfTotalQuestions questions correctly!',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            // list of answers and questions similar to below:
            Container(
              // take the same amount of margin from the left and right
              margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.1, //
              ),
              child: QuizSummary(
                summaryData: summaryData,
              ),
            ),
            //Button to restart the quiz
            Container(
              width: MediaQuery.of(context).size.width * 0.85,
              height: MediaQuery.of(context).size.width * 0.1,
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height *
                    0.05, // Top margin 5% of total height
              ),
              child: ElevatedButton.icon(
                //When we press this button we want to go back to the start screen
                onPressed: () {
                  onRestartQuiz();
                },
                label: const Text('Restart Quiz'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo.shade300,
                ),
                icon: const Icon(Icons.replay),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
