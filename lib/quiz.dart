import 'package:flutter/material.dart';
import 'package:idktbh/data/questions.dart';
import 'package:idktbh/home.dart';
import 'package:idktbh/question.dart';
import 'package:idktbh/result.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = Result(
          selectedAnswers: selectedAnswers,
          restart: restart,
        );
        selectedAnswers = [];
      });
    }
  }

  Widget? activeScreen;

  @override
  void initState() {
    super.initState();
    activeScreen = Home(switchScreen);
  }

  void restart() {
    setState(() {
      selectedAnswers = [];
      activeScreen = Home(switchScreen);
    });
  }

  void switchScreen() {
    setState(() {
      activeScreen = Question(chooseAnswer);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.deepPurpleAccent,
            Colors.purple,
          ])),
          child: activeScreen,
        ),
      ),
    );
  }
}
