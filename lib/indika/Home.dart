import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:guesstheword/indika/splash.dart';

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
        Center(
          child: RaisedButton(

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14)
            ),
            onPressed: () {
              print('play button presesd');
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> splashscreen()));
            },
            color: Colors.purple,
            child: Text(
              "PLAY",
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.5),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top:300),
          child: Container(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
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
        )

      ],
    ));
  }
}
