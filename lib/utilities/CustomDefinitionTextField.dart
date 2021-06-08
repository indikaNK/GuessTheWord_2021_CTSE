import 'package:flutter/material.dart';

class CustomDefinitionTextField extends StatelessWidget {
  String label;
  String hint;
  Function getText;

  CustomDefinitionTextField(this.label, this.hint, this.getText);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25)),
          contentPadding: EdgeInsets.only(left: 25.0,top: 15.0),
          filled: true,
          fillColor: Colors.white,
          labelText: this.label,
          hintText: this.hint,
        ),
        onChanged: (txt) {
          getText(txt);
        },
        maxLines: 3,
      ),
    );
  }
}
