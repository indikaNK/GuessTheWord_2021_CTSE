import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:guesstheword/models/QuestionsAndAnswersModel.dart';

createNewQuestion(QuestionsAndAnswerModel question) async {
  try {
    CollectionReference questionRef = FirebaseFirestore.instance.collection('q_n_a');
    var id = question.qID;
    await questionRef.doc(question.qID.toString()).set(question.toMap()).whenComplete(() => print("$id created"));

  } catch (e) {
    print(e);
  }
}