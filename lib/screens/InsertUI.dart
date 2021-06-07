import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InsertUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Create Question"),
        backgroundColor: Colors.deepPurple,
      ),
      body: new Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bodybg.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    margin: EdgeInsets.all(15.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25)),
                        contentPadding: EdgeInsets.only(left: 25.0),
                        filled: true,
                        fillColor: Colors.white,
                        labelText: 'Question',
                        hintText: 'Ex: He ____ to school now.',
                      ),
                      onChanged: null,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(15.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25)),
                        contentPadding: EdgeInsets.only(left: 25.0),
                        filled: true,
                        fillColor: Colors.white,
                        labelText: 'Answer 1',
                        hintText: 'Ex: is going',
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(15.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25)),
                        contentPadding: EdgeInsets.only(left: 25.0),
                        filled: true,
                        fillColor: Colors.white,
                        labelText: 'Answer 2',
                        hintText: 'Ex: is going',
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(15.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25)),
                        contentPadding: EdgeInsets.only(left: 25.0),
                        filled: true,
                        fillColor: Colors.white,
                        labelText: 'Answer 3',
                        hintText: 'Ex: is going',
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(15.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25)),
                        contentPadding: EdgeInsets.only(left: 25.0),
                        filled: true,
                        fillColor: Colors.white,
                        labelText: 'Answer 4',
                        hintText: 'Ex: is going',
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(15.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25)),
                        contentPadding: EdgeInsets.only(left: 25.0),
                        filled: true,
                        fillColor: Colors.white,
                        labelText: 'Correct Answer',
                        hintText: 'Ex: is going',
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(15.0),
                    child: ElevatedButton(
                      style: elevatedButtonStyle,
                      onPressed: () {},
                      child: Text('ADD'),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  final ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
    primary: Colors.white54,
    minimumSize: Size(150, 45),
    padding: EdgeInsets.symmetric(horizontal: 16.0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(25.0)),
    ),
  );
}
