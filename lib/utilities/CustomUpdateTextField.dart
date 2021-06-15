import 'package:flutter/material.dart';

class CustomUpdateTextField extends StatelessWidget {
  String label;
  String hint;
  Function getText;
  String initVal;
  String err;

  CustomUpdateTextField(this.label, this.hint, this.getText, this.initVal, this.err);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25)),
          contentPadding: EdgeInsets.only(left: 25.0),
          filled: true,
          fillColor: Colors.white,
          labelText: this.label,
          hintText: this.hint,
          errorText: this.err,
        ),
        initialValue: initVal,
        onChanged: (txt) {
          getText(txt);
        },
      ),
    );
  }
}
