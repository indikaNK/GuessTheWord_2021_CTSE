import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
                    padding: const EdgeInsets.only(top: 100.0),
                    child: Image(
                      image: AssetImage('assets/main_logo.png'),
                    )),
              ),
              Container(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: ElevatedButton(
                    style: elevatedButtonStyle,
                    onPressed: () {
                      print('play button presesd');
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => splashscreen()));
                    },
                    child: Container(
                      width: 150.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "PLAY",
                              style: TextStyle(fontSize: 24),
                            ),
                          ),
                          Icon(
                            Icons.play_arrow_rounded,
                            size: 70,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
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
    ));
  }

  final ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
    primary: Colors.deepPurple,
//    padding: EdgeInsets.all(10.0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(50.0)),
    ),
  );
}
