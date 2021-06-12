import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:guesstheword/api/question_n_answer_api.dart';

class GetQuestion extends StatefulWidget {
  GetQuestion();

  @override
  State<GetQuestion> createState() {
    return GetQuestionState();
  }
}

class GetQuestionState extends State<GetQuestion> {
  int index = 0;

  GetQuestionState();

  final CollectionReference questionList =
      FirebaseFirestore.instance.collection("q_n_a");

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      child: Container(
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection("q_n_a").snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return new Text('Error: ${snapshot.error}');
            }
            if (!snapshot.hasData) {
              print('test phrase');
              // return Text("Loading.....");
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return new ListView(
                children: snapshot.data.docs
                    .map((DocumentSnapshot document) => Container(
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.white38,
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              )),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      (++index).toString() + ". ",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    ),
                                    Container(
                                      width: 260,
                                      child: Text(
                                        "" + document['questions'],
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.white),
                                        maxLines: 3,
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    // crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.all(5.0),
                                        child: ElevatedButton(
                                          style: elevatedButtonStyle,
                                          onPressed: () {
                                            print('edit pressed');
                                          },
                                          child: Icon(
                                            Icons.edit_rounded,
                                            size: 20,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.all(5.0),
                                        child: ElevatedButton(
                                          style: elevatedButtonStyle,
                                          onPressed: () {
                                            print('delete pressed'+document["qID"].toString());
                                            deleteFruit(document["qID"]);
                                          },
                                          child: Icon(
                                            Icons.delete_forever,
                                            size: 20,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ))
                    .toList());
          },
        ),
      ),
    );
  }

  final ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
    primary: Colors.deepPurple,
    padding: EdgeInsets.all(0.0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
    ),
  );
}
