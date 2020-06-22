import 'package:flutter/material.dart';
class InTextDot extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 3.0,
      height: 3.0,
      margin: EdgeInsets.symmetric(horizontal: 6.0),
      decoration: BoxDecoration(
        color: Color(0xffb2bac2),
        borderRadius: BorderRadius.all(Radius.circular(3.0))
      ),
    );
  }
}