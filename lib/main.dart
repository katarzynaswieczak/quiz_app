import 'package:flutter/material.dart';
import 'package:quiz_app/quiz.dart';
import 'package:quiz_app/result.dart';

void main() => runApp(Quiz_App());

class Quiz_App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Quiz_AppState();
  }
}

class Quiz_AppState extends State<Quiz_App> {
  final _questions = const [
    {
      'questionText': 'What\s your favourite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Blue', 'score': 6},
        {'text': 'Pink', 'score': 4},
        {'text': 'Yellow', 'score': 2},
      ],
    }, //map
    {
      'questionText': 'What\s your favourite animal?',
      'answers': [
        {'text': 'Elephant', 'score': 4},
        {'text': 'Cat', 'score': 1},
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Dog', 'score': 7},
      ],
    },
    {
      'questionText': 'Who\s your favourite instructor?',
      'answers': [
        {'text': 'Alex', 'score': 3},
        {'text': 'Max', 'score': 2},
        {'text': 'Kate', 'score': 9},
        {'text': 'Sam', 'score': 1},
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);

    //I'm  checking if question index is smaller than question length
    if (_questionIndex < _questions.length) {
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
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
