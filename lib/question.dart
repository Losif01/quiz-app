import 'package:flutter/material.dart';
import 'package:idktbh/answer_button.dart';
import 'data/questions.dart';

class Question extends StatefulWidget {
  const Question(this.onSelectedAnswer, {super.key});
  final void Function(String) onSelectedAnswer;
  @override
  State<Question> createState() => _QuestionsState();
}

class _QuestionsState extends State<Question> {
  var currentQuestionIndex = 0;
  void answerQuestion(String answer) {
    setState(() {
      widget.onSelectedAnswer(answer);
      currentQuestionIndex++;
      // this should execute whenever any answer is clicked
      //this should store the answers the user selected too!
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(30),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: const TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            ...currentQuestion.getShuffledAnswers().map(
              (e) {
                return Container(
                  margin: const EdgeInsets.all(10),
                  child: AnswerButton(e, () {
                    answerQuestion(e);
                  }),
                );
              },
            ),
            const SizedBox(
              height: 30,
            ),
          ]),
    );
  }
}
