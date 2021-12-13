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
      }, //map
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
              questions[questionIndex]['questionText'] as String,
              //on all the questions, I'm accessing the question with index(0,1,2..)
              //and then for the chosen question map, I access the value with the key questionText
            ),
            ...(questions[questionIndex]['answers'] as List<String>)
                .map((answer) {
              return Answer(answerQuestion, answer);
              //transform every answer into an answer widget ...
            }).toList() //I make sure that this is a list and then I take these generated answer widgets ...
          ], // and I add it to this list
        ),
      ),
    );
  }
}
