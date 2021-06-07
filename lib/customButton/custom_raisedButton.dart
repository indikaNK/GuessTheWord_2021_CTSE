import 'package:flutter/material.dart';

class CustomButtonRaised extends StatelessWidget {
  final GestureTapCallback onTap;

  final Color color;
  final String text;
  final bool isEnable;
  final double fontSize;
  final double width;
  final double height;
  final Color fontColor;

  CustomButtonRaised(
      {@required this.text,
        @required this.onTap,
        this.color,
        this.width,
        this.fontSize,
        this.height,
        this.fontColor,
        this.isEnable = true});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        onTap();
      },
      child: Container(
        alignment: Alignment.center,
        height: height ?? 30,
        width: width ?? MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: LinearGradient(colors: [
              color?? Color.fromRGBO(255, 186, 114, 1),
              color??Color.fromRGBO(255, 177, 115, 0.8),
            ])),
        child: Text(
          text.toUpperCase(),
          style:TextStyle(
              color: fontColor ?? Colors.black,
              fontSize: fontSize ?? 14,
              letterSpacing: 1,
              fontWeight: FontWeight.w900),
        ),
      ),
    );
  }
}
