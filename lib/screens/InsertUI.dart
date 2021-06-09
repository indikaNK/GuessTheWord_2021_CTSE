import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:guesstheword/models/QuestionsAndAnswersModel.dart';
import 'package:guesstheword/api/question_n_answer_api.dart';
import 'package:guesstheword/utilities/CustomTextField.dart';
import 'package:guesstheword/utilities/CustomDefinitionTextField.dart';

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
  String definition1;
  String definition2;
  String definition3;
  String definition4;

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
  bool createQuestion() {
    var res = true;

    //generate qid
    var getRandom = new Random();
    var qID = 100000 + getRandom.nextInt(999999 - 100000);

    //answer list
    var answers = [this.answer1, this.answer2, this.answer3, this.answer4];

    //definition list
    var definitions = [this.definition1, this.definition2, this.definition3, this.definition4];

    try {
      //create a new Question and Answer object
      QuestionsAndAnswerModel question = new QuestionsAndAnswerModel(
        qID,
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
                CustomTextField('Question', 'Ex: He ____ to school now.', getQuestion),
                CustomTextField('Answer 1', 'Ex: is going', getAnswer1),
                CustomDefinitionTextField('Definition', 'Type relevent definition.', getDefinition1),
                CustomTextField('Answer 2', 'Ex: is going', getAnswer2),
                CustomDefinitionTextField('Definition', 'Type relevent definition.', getDefinition2),
                CustomTextField('Answer 3', 'Ex: is going', getAnswer3),
                CustomDefinitionTextField('Definition', 'Type relevent definition.', getDefinition3),
                CustomTextField('Answer 4', 'Ex: is going', getAnswer4),
                CustomDefinitionTextField('Definition', 'Type relevent definition.', getDefinition4),
                CustomTextField('Correct Answer', 'Ex: is going', getCorrectAnswer),
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
