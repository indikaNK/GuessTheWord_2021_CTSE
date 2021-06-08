import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:guesstheword/api/question_n_answer_api.dart';
import 'package:guesstheword/models/QuestionsAndAnswersModel.dart';
import 'package:guesstheword/screens/quiz.dart';
import 'package:guesstheword/screens/results.dart';

class PlayScreen extends StatefulWidget {
  @override
  _PlayScreenState createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  List<QuestionsAndAnswerModel> questionList;
  var _questionIndex = 0;
  var _totalScore = 0;

  _PlayScreenState(){
    print("game started");

    getQuestions(updateQuestionList);

  }

  void updateQuestionList(List<QuestionsAndAnswerModel> list) {
    setState(() {
      questionList = list;
    });
    print('list updated');
  }

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

  void _restartQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Guess The Word"),
          backgroundColor: Colors.deepPurple,
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
              child: _questionIndex < 4?
              Quiz(
                  answerQuestion: _answerQuestion,
                  questions: questionList,
                  questionIndex: _questionIndex):Results(_totalScore, _restartQuiz),
            )
          ],
        ));
  }
}
