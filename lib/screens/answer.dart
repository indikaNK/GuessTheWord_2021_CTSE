import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function updateSelectedAnswer;
  final String answerText;
  bool  isSelected;
  Function setButtonSelected;
  int index;

  Answer(this.updateSelectedAnswer, this.answerText, this.isSelected, this.setButtonSelected, this.index);

  void buttonEvent() {
    updateSelectedAnswer(answerText);
    setButtonSelected(index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      width: double.infinity,
      child: ElevatedButton(
        style: (isSelected!=true)?elevatedButtonStyle:elevatedSelectedButtonStyle,
        onPressed: buttonEvent,
        child: Text(answerText),
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
  final ButtonStyle elevatedSelectedButtonStyle = ElevatedButton.styleFrom(
    primary: Colors.deepPurpleAccent,
    minimumSize: Size(150, 45),
    padding: EdgeInsets.symmetric(horizontal: 16.0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(25.0)),
    ),
  );
}
