import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:guesstheword/customButton/custom_raisedButton.dart';
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
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(top: 200.0),
                child: CustomButtonRaised(
                  text: 'PLAY',
                  onTap: () {
                    print('play button presesd');
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => splashscreen()));
                  },
                  color: Colors.purple[300],
                  height: 50,
                  width: 350,
                  fontColor: Colors.white,
                  fontSize: 24,
                ),
              )),
          Container(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 400.0),
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
                  Icons.build,
                  size: 50,
                  color: Colors.white,
                ),
                // icon: Icons.account_tree_outlined,
                // icon: Icons.app_registration,
                // icon: Icons.apps_sharp,
                // icon: Icons.build,
              ),
            ),
          ),
        ],
      )

      );





    //



  }
}
