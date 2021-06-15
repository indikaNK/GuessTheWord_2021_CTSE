import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function updateSelectedAnswer;
  final String answerText;
  final String definitionTxt;
  bool isSelected;
  Function setButtonSelected;
  int index;

  Answer(
    this.updateSelectedAnswer,
    this.answerText,
    this.definitionTxt,
    this.isSelected,
    this.setButtonSelected,
    this.index,
  );

  void buttonEvent() {
    //update the selected answer text
    updateSelectedAnswer(answerText);
    //set button is selected for colour change
    setButtonSelected(index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(15.0),
        width: double.infinity,
        child: Row(
          children: [
            //answer button
            Container(
              width: 250.0,
              margin: EdgeInsets.only(right: 5.0),
              child: ElevatedButton(
                style: (isSelected != true)
                    ? elevatedButtonStyle
                    : elevatedSelectedButtonStyle,
                onPressed: buttonEvent,
                child: Text(answerText),
              ),
            ),
            //definition button
            Container(
              width: 40.0,
              height: 25.0,
              margin: EdgeInsets.only(left: 5.0),
              child: ElevatedButton(
                style: elevatedHelpButtonStyle,
                onPressed: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    backgroundColor: Colors.purple[100],
                    contentPadding: EdgeInsets.all(20.0),
                    title: Text(answerText),
                    content: Text(definitionTxt),
                  ),
                ),
                child: Text('?'),
              ),
            ),
          ],
        ));
  }

  //button styles
  final ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
    primary: Colors.white54,
    minimumSize: Size(150, 45),
    padding: EdgeInsets.symmetric(horizontal: 16.0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(25.0)),
    ),
  );
  final ButtonStyle elevatedSelectedButtonStyle = ElevatedButton.styleFrom(
    primary: Colors.deepPurpleAccent,
    minimumSize: Size(150, 45),
    padding: EdgeInsets.symmetric(horizontal: 16.0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(25.0)),
    ),
  );
  final ButtonStyle elevatedHelpButtonStyle = ElevatedButton.styleFrom(
    primary: Colors.white54,
    minimumSize: Size(150, 45),
//    padding: EdgeInsets.symmetric(horizontal: 16.0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(25.0)),
    ),
  );
}
