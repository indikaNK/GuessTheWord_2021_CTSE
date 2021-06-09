import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GetQuestion extends StatefulWidget {
  GetQuestion();

  @override
  State<GetQuestion> createState() {
    return GetQuestionState();
  }
}

class GetQuestionState extends State<GetQuestion> {
  GetQuestionState();
  
  final CollectionReference questionList = FirebaseFirestore.instance.collection("q_n_a");

  // @override
  // void initState(){
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      child: Container(
        child: StreamBuilder<QuerySnapshot>(
          // stream: Firestore.instance("q_n_a").snapshots(),
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
                  margin: const EdgeInsets.only(bottom:32 ),
                      decoration: BoxDecoration(
                        color: Colors.white54,
                        borderRadius: BorderRadius.all(Radius.circular(20),)
                      ),
                      // width: MediaQuery.of(context).size.width /1.2,
                      // height: MediaQuery.of(context).size.height / 6,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom:10.0),
                        child: Column(
                          children: [
                            Text("" + document['questions'],style: TextStyle(
                              fontSize: 20,
                              color: Colors.white

                            ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                // crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  ElevatedButton(onPressed: (){}, child: Text("Edit")),
                                  SizedBox(width: 5,),
                                  ElevatedButton(onPressed: (){}, child: Text("Delete"))
                                ],
                              ),
                            ),

                          ],
                        ),
                      ),
                    )).toList()
            );

          },
        ),
      ),







    );
  }

}


