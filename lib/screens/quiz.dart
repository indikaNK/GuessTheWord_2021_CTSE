import 'package:flutter/material.dart';
import 'package:guesstheword/models/QuestionsAndAnswersModel.dart';
import './question.dart';
import 'answer.dart';

class Quiz extends StatelessWidget {
  final Function answerQuestion;
  final List<QuestionsAndAnswerModel> questions;
  final int questionIndex;

  Quiz(
      {@required this.answerQuestion,
        @required this.questions,
        @required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
        questionIndex+1,
        questions[questionIndex].questions,
        ),
        ...(questions[questionIndex].answers)
          .map(
            (answer) {
              return Answer(
                answerQuestion,
                answer,
                questions[questionIndex].correctAnswer,
              );
            },
        ).toList()
      ],
    );
  }
}
