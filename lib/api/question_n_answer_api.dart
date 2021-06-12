import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:guesstheword/models/QuestionsAndAnswersModel.dart';

createNewQuestion(QuestionsAndAnswerModel question) async {
  try {
    CollectionReference questionRef =
        FirebaseFirestore.instance.collection('q_n_a');
    var id = question.qID;
    await questionRef
        .doc(question.qID.toString())
        .set(question.toMap())
        .whenComplete(() => print("$id created"));
  } catch (e) {
    print(e);
  }
}

getQuestions(Function updateQuestionList) async {
  try {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('q_n_a').get();

    List<QuestionsAndAnswerModel> _questionsList = [];

    snapshot.docs.forEach((document) {
      QuestionsAndAnswerModel question =
          QuestionsAndAnswerModel.fromMap(document.data());
      _questionsList.add(question);
    });

    updateQuestionList(_questionsList);
//    _questionsList.forEach((question) => {
//          print('************'),
//          print(question.qID),
//          print(question.questions),
//          print(question.correctAnswer),
//          print(question.answers[0]),
//          print(question.definitions[0]),
//        });
  } catch (e) {
    print(e);
  }
}

//getOneQuestion(int qID, Function func) async {
//  try {
//    DocumentReference documentReference = await FirebaseFirestore.instance
//        .collection('q_n_a')
//        .doc(qID.toString());
//    documentReference.get().then((datasnapshot) {
//      QuestionsAndAnswerModel question = new QuestionsAndAnswerModel(
//        datasnapshot.get("qID"),
//        datasnapshot.get("questions"),
//        datasnapshot.get("answers"),
//        datasnapshot.get("correctAnswer"),
//        datasnapshot.get("definitions"),
//      );
//
//      func(question);
//    });
//  } catch (e) {
//    print(e);
//  }
//}

deleteFruit(int qID) async {
  await FirebaseFirestore.instance
      .collection('q_n_a')
      .doc(qID.toString())
      .delete();
}
