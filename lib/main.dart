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
  final questions = const [
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
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);

    //I'm  checking if question index is smaller than question length
    if (_questionIndex < questions.length) {
      print('I have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz App'),
        ),
        body: _questionIndex < questions.length
            ? Column(
                children: [
                  Question(
                    questions[_questionIndex]['questionText'] as String,
                    //on all the questions, I'm accessing the question with index(0,1,2..)
                    //and then for the chosen question map, I access the value with the key questionText
                  ),
                  ...(questions[_questionIndex]['answers'] as List<String>)
                      .map((answer) {
                    return Answer(_answerQuestion, answer);
                    //transform every answer into an answer widget ...
                  }).toList() //I make sure that this is a list and then I take these generated answer widgets ...
                ], // and I add it to this list
              )
            : Center(child: Text('You did it!')),
      ),
    );
  }
}
