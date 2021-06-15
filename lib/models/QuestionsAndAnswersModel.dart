import 'package:cloud_firestore/cloud_firestore.dart';

class QuestionsAndAnswerModel {
   int qID;
   String questions;
   List<dynamic> answers;
   String correctAnswer;
   List<dynamic> definitions;

    QuestionsAndAnswerModel(
      this.qID,
      this.questions,
      this.answers,
      this.correctAnswer,
      this.definitions,
      );

  QuestionsAndAnswerModel.fromMap(Map<String, dynamic> data) {
    qID = data['qID'];
    questions = data['questions'];
    answers = data['answers'];
    correctAnswer = data['correct_answer'];
    definitions = data['definitions'];
  }

  Map<String, dynamic> toMap() {
    return {
      'qID': qID,
      'questions': questions,
      'answers': answers,
      'correct_answer': correctAnswer,
      'definitions': definitions
    };
  }
}
