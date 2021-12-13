import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

void main() => runApp(Quiz_App());

class Quiz_App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Quiz_AppState();
  }
}

class Quiz_AppState extends State<Quiz_App> {
  var questionIndex = 0;

  void answerQuestion() {
    setState(() {
      questionIndex = questionIndex + 1;
    });

    print(questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      {
        'questionText': 'What\s your favourite color?',
        'answers': ['Black', 'Blue', 'Pink', 'Yellow'],
      },
      {
        'questionText': 'What\s your favourite animal?',
        'answers': ['Elephant', 'Cat', 'Rabbit', 'Dog'],
      },
      {
        'questionText': 'Who\s your favourite instructor?',
        'answers': ['Alex', 'Max', 'Kate', 'Sam'],
      },
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz App'),
        ),
        body: Column(
          children: [
            Question(
              questions[questionIndex]['questionText'],
            ),
            Answer(answerQuestion),
            Answer(answerQuestion),
            Answer(answerQuestion),
            Answer(answerQuestion),
          ],
        ),
      ),
    );
  }
}
