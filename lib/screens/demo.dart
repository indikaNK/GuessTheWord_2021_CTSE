import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Demo extends StatelessWidget {
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
      ],
    ));
  }
}
