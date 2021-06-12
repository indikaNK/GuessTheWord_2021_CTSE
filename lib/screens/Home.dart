import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:guesstheword/utilities/customButton/custom_raisedButton.dart';
import 'package:guesstheword/screens/questions.dart';
import 'package:guesstheword/screens/splash.dart';

class HOME extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
          body: new Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/bodybg.jpg'), fit: BoxFit.cover)),
          ),
          Container(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 250.0),
                    child: Text(
                      "GUESS THE WORD",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.5),
                    ),
                  ),
                ),
                Container(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 50.0),
                      child: CustomButtonRaised(
                        text: 'PLAY',
                        onTap: () {
                          print('play button presesd');
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) => splashscreen()));
                        },
                        color: Colors.purple[300],
                        height: 50,
                        width: 120,
                        fontColor: Colors.white,
                        fontSize: 24,
                      ),
                    ),),

              ],
            ),
          ),

          Container(
            alignment: Alignment.topRight,
            child: SafeArea(
              minimum: const EdgeInsets.only(right: 20.0),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => QuestionList()));
                  print("setting icon clicked");
                },
                icon: Icon(
                  Icons.settings,
                  size: 50,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      )

      );





    //



  }
}
