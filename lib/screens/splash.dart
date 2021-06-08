import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'InsertUI.dart';

class splashscreen extends StatefulWidget {
  @override
  SPlashScreen createState() => SPlashScreen();
}

class SPlashScreen extends State<splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => InsertUI(),
      ));
    });
  }
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
                child: Column(
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top:200.0),
                        child: SizedBox(
                          height: 200,
                          width: 200,
                          child: Lottie.asset('assets/rocket1.json'),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(top:20.0),
                  child: Text(
                    "Let's Begin !",
                    style: TextStyle(color: Colors.white , fontSize: 45),
                  ),
                ),
              ),
            ],
          ),
        ),

      ],
    ));
  }


}


