import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:guesstheword/api/RetriveQuestions.dart';

import 'InsertUI.dart';

class QuestionList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
            title: Text('Question List'),
            elevation: 0,
            backgroundColor: Colors.purple[900]),
        body: new Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/bodybg.jpg'),
                      fit: BoxFit.cover)),
            ),
            Container(
              height: double.infinity,
              child: GetQuestion(),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      style: elevatedButtonStyle,
                      onPressed: () {
                        print('Add new questions pressed');
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => InsertUI()));
                      },
                      child: Icon(
                        Icons.add_outlined,
                        size: 60,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  final ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
    primary: Colors.white,
    padding: EdgeInsets.all(4.0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(50.0)),
    ),
  );
}
