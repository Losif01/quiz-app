import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home(this.switchScreen, {super.key});

  final void Function() switchScreen;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
      Image.asset(
        "assets/images/quiz-logo.png",
        width: 300,
      ),
      const SizedBox(
        height: 15,
      ),
      const Text(
        "Learn Flutter!",
        style: TextStyle(fontSize: 24, color: Colors.white),
      ),
      OutlinedButton.icon(
        style: OutlinedButton.styleFrom(foregroundColor: Colors.white60),
        onPressed: switchScreen,
        label: const Text("Start quiz"),
        icon: const Icon(Icons.arrow_right_alt_outlined),
      )
    ]));
  }
}
