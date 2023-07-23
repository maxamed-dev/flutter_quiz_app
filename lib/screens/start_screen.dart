import 'package:flutter/material.dart';

class StarterScreen extends StatelessWidget {
  const StarterScreen(this.startQuiz, {Key? key}) : super(key: key);

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.center, // Center items on the vertical axis
        children: [
          Container(
              width: MediaQuery.of(context).size.width *
                  0.8, // 50% of the available width
              child: Image.asset(
                'assets/images/quiz-logo.png',
              )),
          Container(
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height *
                  0.05, // Top margin 5% of total height
            ),
            child: const Text(
              'Flutter Quiz',
              style: TextStyle(
                fontSize: 38,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height *
                  0.05, // Top margin 5% of total height
            ),
            // 60% of the available width
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.width * 0.1,
            //Margin 5% from the Image
            child: ElevatedButton.icon(
              onPressed: startQuiz,
              label: const Text('Start Quiz'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo.shade300,
              ),
              icon: const Icon(Icons.play_arrow),
            ),
          ),
        ],
      ),
    );
  }
}
