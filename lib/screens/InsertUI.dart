import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:guesstheword/models/QuestionsAndAnswersModel.dart';
import 'package:guesstheword/api/question_n_answer_api.dart';

class InsertUI extends StatefulWidget {
  @override
  _InsertUIState createState() => _InsertUIState();
}

class _InsertUIState extends State<InsertUI> {
  String questions;
  String answer1;
  String answer2;
  String answer3;
  String answer4;
  String correctAnswer;

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

  bool createQuestion() {
    var res = true;

    //generate qid
    var getRandom = new Random();
    var qID = 100000 + getRandom.nextInt(999999 - 100000);

    var answers = [this.answer1, this.answer2, this.answer3, this.answer4];

    var definitions = ['def1', 'def2', 'def3', 'def4'];

    try {
      QuestionsAndAnswerModel question = new QuestionsAndAnswerModel(
        qID,
        this.questions,
        answers,
        this.correctAnswer,
        definitions,
      );

      createNewQuestion(question);
    } catch (e) {
      print(e);
      res = false;
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
          title: Text("Create Question"),
          backgroundColor: Colors.deepPurple,
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  margin: EdgeInsets.all(15.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      contentPadding: EdgeInsets.only(left: 25.0),
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'Question',
                      hintText: 'Ex: He ____ to school now.',
                    ),
                    onChanged: (txt) {
                      getQuestion(txt);
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(15.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25)),
                      contentPadding: EdgeInsets.only(left: 25.0),
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'Answer 1',
                      hintText: 'Ex: is going',
                    ),
                    onChanged: (txt) {
                      getAnswer1(txt);
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(15.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25)),
                      contentPadding: EdgeInsets.only(left: 25.0),
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'Answer 2',
                      hintText: 'Ex: is going',
                    ),
                    onChanged: (txt) {
                      getAnswer2(txt);
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(15.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25)),
                      contentPadding: EdgeInsets.only(left: 25.0),
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'Answer 3',
                      hintText: 'Ex: is going',
                    ),
                    onChanged: (txt) {
                      getAnswer3(txt);
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(15.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25)),
                      contentPadding: EdgeInsets.only(left: 25.0),
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'Answer 4',
                      hintText: 'Ex: is going',
                    ),
                    onChanged: (txt) {
                      getAnswer4(txt);
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(15.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25)),
                      contentPadding: EdgeInsets.only(left: 25.0),
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'Correct Answer',
                      hintText: 'Ex: is going',
                    ),
                    onChanged: (txt) {
                      getCorrectAnswer(txt);
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(15.0),
                  child: ElevatedButton(
                    style: elevatedButtonStyle,
                    onPressed: () {
                      var res = createQuestion();
                      SnackBar snackBar;
                      if (res) {
                        snackBar = SnackBar(
                            content: Text('Successfully created!'),
                            backgroundColor: Colors.green);
                      } else {
                        snackBar = SnackBar(
                            content: Text('Somthing went wrong!'),
                            backgroundColor: Colors.red);
                      }

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    child: Text('CREATE'),
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
