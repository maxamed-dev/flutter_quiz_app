import 'package:flutter/material.dart';

class QuizSummary extends StatelessWidget {
  const QuizSummary({Key? key, required this.summaryData}) : super(key: key);

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: summaryData.map((data) {
      return Row(
        children: [
          Text(((data['question_index'] as int) + 1).toString()),
          Column(
            children: [
              Text(data['question'] as String),
              Text(data['chosen_answer'] as String),
              Text(data['correct_answer'] as String),
            ],
          ),
        ],
      );
    }).toList());
  }
}
