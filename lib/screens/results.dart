import 'package:flutter/material.dart';

class Results extends StatelessWidget {
  final int resultSCore;
  final Function restartQuiz;
  final int totQuestions;

  Results(this.resultSCore, this.restartQuiz, this.totQuestions);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
          Text(
            "Final Resalts",
            style: TextStyle(color:Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.white54,
              borderRadius: BorderRadius.all(Radius.circular(150.0)),
            ),
            child: Center(
              child: Text(resultSCore.toString()+"/"+totQuestions.toString(),style: TextStyle(fontSize: 42, color: Colors.white),),
            ),
          ),
          ElevatedButton(
            style: elevatedButtonStyle,
            onPressed: restartQuiz,
            child: Text('Restart Quiz'),
          ),
          ],
        ),
      ),

    );
  }

  //button styles
  final ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
    primary: Colors.white54,
    padding: EdgeInsets.all(15.0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(25.0)),
    ),
  );
}
