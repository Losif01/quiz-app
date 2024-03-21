// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:idktbh/data/questions.dart';

class Result extends StatelessWidget {
  const Result({
    super.key,
    required this.selectedAnswers,
    required this.restart,
  });

  final List<String> selectedAnswers;
  final void Function() restart;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < selectedAnswers.length; i++) {
      summary.add({
        "question index": i,
        "question": questions[0].text,
        "correct answer": questions[i].answers[0],
        "your answer was": selectedAnswers[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    int userScore = 0;
    for (var i = 0; i < summaryData.length; i++) {
      if (summaryData[i]["correct answer"] ==
          summaryData[i]["your answer was"]) {
        userScore++;
      }
    }

    return SingleChildScrollView(
      //FIXME the pags looks cropped, it shouldn't be cropped...
      child: SizedBox(
        width: double.infinity,
        //margin: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "You answered $userScore out of ${questions.length} correctly!",
              style: const TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...summaryData.map(
              (summaryData) => Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 16,
                        backgroundColor: summaryData["your answer was"] ==
                                summaryData["correct answer"]
                            ? Colors.blueAccent
                            : Colors.red,
                        child: Text(
                          ((summaryData['question index'] as int) + 1)
                              .toString(),
                          style: const TextStyle(fontSize: 12),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            summaryData['question'].toString(),
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            summaryData['correct answer'].toString(),
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.green,
                            ),
                          ),
                          Text(
                            summaryData['your answer was'].toString(),
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const Divider(),
                ],
              ),
            ),
            TextButton.icon(
              onPressed: restart,
              icon: const Icon(
                Icons.restart_alt_outlined,
                color: Colors.white,
              ),
              label: const Text(
                "Restart quiz",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
