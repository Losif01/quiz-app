// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(
    this.answerText,
    this.onPressed, {
    super.key,
  });

  final String answerText;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.deepPurple,
          padding: const EdgeInsets.all(20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        ),
        child: Text(answerText));
  }
}
