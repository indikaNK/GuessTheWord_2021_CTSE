import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:guesstheword/models/QuestionsAndAnswersModel.dart';
import 'package:guesstheword/api/question_n_answer_api.dart';
import 'package:guesstheword/utilities/CustomTextField.dart';
import 'package:guesstheword/utilities/CustomDefinitionTextField.dart';
import 'package:guesstheword/utilities/CustomUpdateDefinitionTextField.dart';
import 'package:guesstheword/utilities/CustomUpdateTextField.dart';

class UpdateUI extends StatefulWidget {
  int qID;
  QuestionsAndAnswerModel question;

  UpdateUI(this.qID, this.question);

  @override
  _UpdateUIState createState() => _UpdateUIState(qID, question);
}

class _UpdateUIState extends State<UpdateUI> {
  String questions;
  String answer1;
  String answer2;
  String answer3;
  String answer4;
  String correctAnswer;
  String definition1;
  String definition2;
  String definition3;
  String definition4;
  int qID;

  String questionErrTxt;
  String answer1ErrTxt;
  String answer2ErrTxt;
  String answer3ErrTxt;
  String answer4ErrTxt;
  String correctAnswerErrTxt;
  String definition1ErrTxt;
  String definition2ErrTxt;
  String definition3ErrTxt;
  String definition4ErrTxt;

  _UpdateUIState(int qId, QuestionsAndAnswerModel qst) {
    qID = qId;
    questions = qst.questions;
    answer1 = qst.answers[0];
    answer2 = qst.answers[1];
    answer3 = qst.answers[2];
    answer4 = qst.answers[3];
    correctAnswer = qst.correctAnswer;
    definition1 = qst.definitions[0];
    definition2 = qst.definitions[1];
    definition3 = qst.definitions[2];
    definition4 = qst.definitions[3];
  }

  void getQuestion(String question) {
    setState(() {
      questions = question;
    });
  }

  void getAnswer1(String ans) {
    setState(() {
      answer1 = ans;
    });
  }

  void getAnswer2(String ans) {
    setState(() {
      answer2 = ans;
    });
  }

  void getAnswer3(String ans) {
    setState(() {
      answer3 = ans;
    });
  }

  void getAnswer4(String ans) {
    setState(() {
      answer4 = ans;
    });
  }

  void getCorrectAnswer(String ans) {
    setState(() {
      correctAnswer = ans;
    });
  }

  void getDefinition1(String ans) {
    setState(() {
      definition1 = ans;
    });
  }

  void getDefinition2(String ans) {
    setState(() {
      definition2 = ans;
    });
  }

  void getDefinition3(String ans) {
    setState(() {
      definition3 = ans;
    });
  }

  void getDefinition4(String ans) {
    setState(() {
      definition4 = ans;
    });
  }

  //create a new question
  bool updateQuestion() {
    var res = true;

    setState(() {
      questionErrTxt = null;
      answer1ErrTxt = null;
      answer2ErrTxt = null;
      answer3ErrTxt = null;
      answer4ErrTxt = null;
      correctAnswerErrTxt = null;
      definition1ErrTxt = null;
      definition2ErrTxt = null;
      definition3ErrTxt = null;
      definition4ErrTxt = null;
    });

    if (this.questions == null ||
        this.questions == "" ||
        this.answer1 == null ||
        this.answer1 == "" ||
        this.answer2 == null ||
        this.answer2 == "" ||
        this.answer3 == null ||
        this.answer3 == "" ||
        this.answer4 == null ||
        this.answer4 == "" ||
        this.correctAnswer == null ||
        this.correctAnswer == "" ||
        this.definition1 == null ||
        this.definition1 == "" ||
        this.definition2 == null ||
        this.definition2 == "" ||
        this.definition3 == null ||
        this.definition3 == "" ||
        this.definition4 == null ||
        this.definition4 == "") {
      res = false;
      if (this.questions == null || this.questions == "") {
        setState(() {
          questionErrTxt = "Question field is required";
        });
      }
      if (this.answer1 == null || this.answer1 == "") {
        setState(() {
          answer1ErrTxt = "Answer fields are required";
        });
      }
      if (this.answer2 == null || this.answer2 == "") {
        setState(() {
          answer2ErrTxt = "Answer fields are required";
        });
      }
      if (this.answer3 == null || this.answer3 == "") {
        setState(() {
          answer3ErrTxt = "Answer fields are required";
        });
      }
      if (this.answer4 == null || this.answer4 == "") {
        setState(() {
          answer4ErrTxt = "Answer fields are required";
        });
      }
      if (this.correctAnswer == null || this.correctAnswer == "") {
        setState(() {
          correctAnswerErrTxt = "Correct answer field is required";
        });
      }
      if (this.definition1 == null || this.definition1 == "") {
        setState(() {
          definition1ErrTxt = "Definitions fields are required";
        });
      }
      if (this.definition2 == null || this.definition2 == "") {
        setState(() {
          definition2ErrTxt = "Definitions fields are required";
        });
      }
      if (this.definition3 == null || this.definition3 == "") {
        setState(() {
          definition3ErrTxt = "Definitions fields are required";
        });
      }
      if (this.definition4 == null || this.definition4 == "") {
        setState(() {
          definition4ErrTxt = "Definitions fields are required";
        });
      }
    }else if(this.correctAnswer!=this.answer1 && this.correctAnswer!=this.answer2 && this.correctAnswer!=this.answer3 && this.correctAnswer!=this.answer4) {
      res = false;
      setState(() {
        correctAnswerErrTxt = "Correct answer is wrong";
      });
    }else {
      //answer list
      var answers = [this.answer1, this.answer2, this.answer3, this.answer4];

      //definition list
      var definitions = [
        this.definition1,
        this.definition2,
        this.definition3,
        this.definition4
      ];

      try {
        //create a new Question and Answer object
        QuestionsAndAnswerModel question = new QuestionsAndAnswerModel(
          this.qID,
          this.questions,
          answers,
          this.correctAnswer,
          definitions,
        );

        //call create api
        createNewQuestion(question);
      } catch (e) {
        print(e);
        res = false;
      }
    }
    return res;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/bodybg.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text("Update Question"),
          backgroundColor: Colors.deepPurple,
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomUpdateTextField(
                  'Question',
                  'Ex: He ____ to school now.',
                  getQuestion,
                  this.questions,
                  this.questionErrTxt,
                ),
                CustomUpdateTextField(
                  'Answer 1',
                  'Ex: is going',
                  getAnswer1,
                  this.answer1,
                  this.answer1ErrTxt,
                ),
                CustomUpdateDefinitionTextField(
                  'Definition',
                  'Type relevent definition.',
                  getDefinition1,
                  this.definition1,
                  this.definition1ErrTxt,
                ),
                CustomUpdateTextField(
                  'Answer 2',
                  'Ex: is going',
                  getAnswer2,
                  this.answer2,
                  this.answer2ErrTxt,
                ),
                CustomUpdateDefinitionTextField(
                  'Definition',
                  'Type relevent definition.',
                  getDefinition2,
                  this.definition2,
                  this.definition2ErrTxt,
                ),
                CustomUpdateTextField(
                  'Answer 3',
                  'Ex: is going',
                  getAnswer3,
                  this.answer3,
                  this.answer3ErrTxt,
                ),
                CustomUpdateDefinitionTextField(
                  'Definition',
                  'Type relevent definition.',
                  getDefinition3,
                  this.definition3,
                  this.definition3ErrTxt,
                ),
                CustomUpdateTextField(
                  'Answer 4',
                  'Ex: is going',
                  getAnswer4,
                  this.answer4,
                  this.answer4ErrTxt,
                ),
                CustomUpdateDefinitionTextField(
                  'Definition',
                  'Type relevent definition.',
                  getDefinition4,
                  this.definition4,
                  this.definition4ErrTxt,
                ),
                CustomUpdateTextField(
                  'Correct Answer',
                  'Ex: is going',
                  getCorrectAnswer,
                  this.correctAnswer,
                  this.correctAnswerErrTxt,
                ),
                Container(
                  margin: EdgeInsets.all(15.0),
                  child: ElevatedButton(
                    style: elevatedButtonStyle,
                    onPressed: () {
                      var res = updateQuestion();
                      SnackBar snackBar;
                      if (res) {
                        snackBar = SnackBar(
                            content: Text('Successfully updated!'),
                            backgroundColor: Colors.green);
                      } else {
                        snackBar = SnackBar(
                            content: Text('Somthing went wrong!'),
                            backgroundColor: Colors.red);
                      }

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    child: Text('UPDATE'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  //button style
  final ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
    primary: Colors.white54,
    minimumSize: Size(150, 45),
    padding: EdgeInsets.symmetric(horizontal: 16.0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(25.0)),
    ),
  );
}
