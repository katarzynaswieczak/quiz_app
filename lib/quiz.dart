import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  Quiz({
    required this.questions,
    required this.answerQuestion,
    required this.questionIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questions[questionIndex]['questionText'] as String,
          //on all the questions, I'm accessing the question with index(0,1,2..)
          //and then for the chosen question map, I access the value with the key questionText
        ),
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(
              () => answerQuestion(answer['score']), answer['text'] as String);
          //transform every answer into an answer widget ...
        }).toList() //I make sure that this is a list and then I take these generated answer widgets ...
      ], // and I add it to this list
    );
  }
}
