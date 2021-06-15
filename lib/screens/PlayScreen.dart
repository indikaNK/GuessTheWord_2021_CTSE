import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:guesstheword/models/QuestionsAndAnswersModel.dart';
import 'package:guesstheword/screens/quiz.dart';
import 'package:guesstheword/screens/results.dart';

import 'Home.dart';

class PlayScreen extends StatefulWidget {
  List<QuestionsAndAnswerModel> questionList;

  PlayScreen(this.questionList);
  @override
  _PlayScreenState createState() => _PlayScreenState(questionList);
}

class _PlayScreenState extends State<PlayScreen> {
  List<QuestionsAndAnswerModel> questionList;
  var _questionIndex = 0;
  var _totalScore = 0;
  var _selection = [false,false,false,false];
  var selectedAnswer = '';

  _PlayScreenState(this.questionList);

  // handle results & handle question navigation
  void _answerQuestion(int score) {
    _totalScore += score;

    print(_questionIndex);
    if (_questionIndex < questionList.length) {
       setState(() {
         _questionIndex = _questionIndex + 1;
       });
      print('We have more questions');
    } else {
      print('No more questions');
    }
  }

  //restart quiz
  void _restartQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
    resetButtons();
  }

  //set button selected
  void _setButtonSelected(int index) {
    List<bool> newSelection;
    if(index==0){newSelection = [true,false,false,false];}
    else if(index==1){newSelection = [false,true,false,false];}
    else if(index==2){newSelection = [false,false,true,false];}
    else {newSelection = [false,false,false,true];}
    setState(() {
      _selection = newSelection;
    });
  }

  //unselect all buttons
  void resetButtons(){
    setState(() {
      _selection = [false,false,false,false];
    });
  }

  //get selected answer
  void updateSelectedAnswer(String answer) {
    setState(() {
      selectedAnswer = answer;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: true,
            title: Text("Guess The Word"),
            backgroundColor: Colors.deepPurple,
            leading: IconButton(icon:Icon(Icons.home),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => HOME(),
                ));
              },
            )
        ),
        body: new Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/bodybg.jpg'), fit: BoxFit.cover)),
            ),
            Container(
              padding: EdgeInsets.all(15.0),
              child: _questionIndex < questionList.length?
              Quiz(
                answerQuestion: _answerQuestion,
                questions: questionList,
                questionIndex: _questionIndex,
                selection: _selection,
                setButtonSelected:_setButtonSelected,
                selectedAnswer: selectedAnswer,
                updateSelectedAnswer: updateSelectedAnswer,
                resetButtons: resetButtons
              ):Results(_totalScore, _restartQuiz, questionList.length),

            )
          ],
        ));
  }
}
