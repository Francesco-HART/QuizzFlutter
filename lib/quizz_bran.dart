import 'package:flutter/material.dart';
import 'package:quizzler/question.dart';

class QuizzBran {
  int questionIndex = 0;
  List<Icon> results = [];

  final List<Question> _questions = [
    Question(
        question: 'You can lead a cow down stairs but not up stairs.',
        answer: false),
    Question(
        question: 'Approximately one quarter of human bones are in the feet.',
        answer: true),
    Question(
      question: 'A slug\'s blood is green.',
      answer: true,
    ),
  ];

  void setQuestionInex() {
    if (this.questionIndex < this._questions.length - 1)
      this.questionIndex++;
    else
      this.questionIndex = 0;
  }

  isGoodAnswer(bool answer, BuildContext context) {
    answer == this._questions[this.questionIndex].answer
        ? this.results.add(
              Icon(Icons.check, color: Colors.green),
            )
        : results.add(
            Icon(Icons.close, color: Colors.red),
          );
    if (results.length == 10) {
      this.results.clear();
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Fin du Game'),
          content: const Text('Bravo'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  List<Question> getQuestionBank() {
    return this._questions;
  }
}
