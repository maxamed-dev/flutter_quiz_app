import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class QuizSummary extends StatelessWidget {
  const QuizSummary({Key? key, required this.summaryData}) : super(key: key);

  final List<Map<String, Object>> summaryData;

  // Declare your color constants here
  //0xff27b3ff
  static const Color greenColor = Color(0xff27b3ff);
  //0xffbf212f
  static const Color redColor = Color(0xffbf212f);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      child: SingleChildScrollView(
        child: Column(
            children: summaryData.map((data) {
          return Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 15,
                    backgroundColor:
                        data['chosen_answer'] == data['correct_answer']
                            ? greenColor
                            : redColor,
                    child:
                        Text(((data['question_index'] as int) + 1).toString(),
                            style: const TextStyle(
                              color: Colors.black,
                            )),
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width *
                          0.025), // Add a SizedBox here for spacing
                  Expanded(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data['question'] as String,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            data['chosen_answer'] as String,
                            style: TextStyle(
                              color: data['chosen_answer'] ==
                                      data['correct_answer']
                                  ? greenColor
                                  : redColor,
                            ),
                          ),
                          Text(
                            data['correct_answer'] as String,
                            style: const TextStyle(
                              color: Color(0xff27b376),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                  height:
                      10), // Add a SizedBox for vertical spacing between the rows
            ],
          );
        }).toList()),
      ),
    );
  }
}
