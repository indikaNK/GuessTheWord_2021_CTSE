import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function answerQuestion;
  final String answerText;
  final String correctAnswer;

  Answer(this.answerQuestion, this.answerText, this.correctAnswer);

  void setResults() {
    if(answerText == correctAnswer){
      answerQuestion(1);
    }else{
      answerQuestion(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        color: Colors.blue,
        textColor: Colors.white,
        child: Text(answerText),
        onPressed: setResults,
      ),
    );
  }
}
