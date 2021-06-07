import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:guesstheword/utilities/customButton/custom_raisedButton.dart';
import 'package:guesstheword/screens/splash.dart';


class QuestionList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
            title: Text('Question List'),
            centerTitle: true,
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
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.5),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 50.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  // crossAxisAlignment:CrossAxisAlignment.end,
                  children: [
                    CustomButtonRaised(
                        text: "Create Question",
                        onTap: () {
                          print('Add new questions pressed');
                          //     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> InsertQuestion()));
                        },
                        color: Colors.white54,
                        height: 50,
                        width: 350,
                        fontColor: Colors.white,
                        fontSize: 24)

                  ],
                ),
              ),
            )
          ],
        ));
  }
}
