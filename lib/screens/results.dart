import 'package:flutter/material.dart';

class Results extends StatelessWidget {
  final int resultSCore;
  final Function restartQuiz;

  Results(this.resultSCore, this.restartQuiz);

  String get resultPhrase {
    String resultText;
    print('result: '+resultSCore.toString());

    if (resultSCore <= 10) {
      resultText = 'you are awesome!';
    } else if (resultSCore <= 14) {
      resultText = 'you are okay!';
    } else if (resultSCore <= 18) {
      resultText = 'you are strange!';
    } else {
      resultText = 'you are so bad!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          TextButton(
            onPressed: restartQuiz,
            child: Text('Restart Quiz!'),
            style: TextButton.styleFrom(
              primary: Colors.blue,
            ),
            // textColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}
