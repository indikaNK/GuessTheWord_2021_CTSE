import 'package:flutter/material.dart';
import 'package:guesstheword/models/QuestionsAndAnswersModel.dart';
import './question.dart';
import 'answer.dart';

class Quiz extends StatelessWidget {
  final Function answerQuestion;
  final List<QuestionsAndAnswerModel> questions;
  final int questionIndex;
  final selectedAnswer;
  List<bool> selection;
  Function setButtonSelected;
  Function updateSelectedAnswer;
  Function resetButtons;

  Quiz(
      {@required this.answerQuestion,
      @required this.questions,
      @required this.questionIndex,
      @required this.selection,
      @required this.setButtonSelected,
      @required this.selectedAnswer,
      @required this.updateSelectedAnswer,
      @required this.resetButtons});



  void setResults() {
    resetButtons();
    if (this.selectedAnswer == questions[questionIndex].correctAnswer) {
      answerQuestion(1);
    } else {
      answerQuestion(0);
    }

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questionIndex + 1,
          questions[questionIndex].questions,
        ),
        Answer(
          updateSelectedAnswer,
          questions[questionIndex].answers[0],
          questions[questionIndex].definitions[0],
          selection[0],
          setButtonSelected,
          0
        ),
        Answer(
          updateSelectedAnswer,
          questions[questionIndex].answers[1],
          questions[questionIndex].definitions[1],
          selection[1],
          setButtonSelected,
          1
        ),
        Answer(
          updateSelectedAnswer,
          questions[questionIndex].answers[2],
          questions[questionIndex].definitions[2],
          selection[2],
          setButtonSelected,
          2
        ),
        Answer(
          updateSelectedAnswer,
          questions[questionIndex].answers[3],
          questions[questionIndex].definitions[3],
          selection[3],
          setButtonSelected,
          3
        ),
        Align(
            alignment: Alignment.bottomRight,
            child: Container(
              margin: EdgeInsets.all(15.0),
              width: 100.0,
              child: ElevatedButton(
                style: elevatedButtonStyle,
                onPressed: () {
                  if (this.selectedAnswer != '') {
                    setResults();
                  } else {
                    SnackBar snackBar = SnackBar(
                      content: Text('Please select an answer!'),
                      backgroundColor: Colors.red,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Next",style: TextStyle(color: Colors.deepPurple),),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 25,
                      color: Colors.deepPurple,
                    ),
                  ],
                ),
              ),
            )),
      ],
    );
  }

  final ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
    primary: Colors.white70,
    padding: EdgeInsets.all(15.0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(25.0)),
    ),
  );
}
