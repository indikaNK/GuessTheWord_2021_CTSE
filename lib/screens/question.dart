import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText;
  final int index;

  Question(this.index, this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(20),
      child: Text(
        index.toString()+'.  '+questionText,
        style: TextStyle(
          fontSize: 24,
          color: Colors.white,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }
}
