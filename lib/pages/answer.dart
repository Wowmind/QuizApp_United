import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String answers;
  final Color answerColor;
  final VoidCallback callback;

  Answer({required this.answers, required this.answerColor, required this.callback});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: callback,
      child: Container(
        height: 60,
        width: double.infinity,
        margin: EdgeInsets.only(left: 60, right: 60,top: 20),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.red, style: BorderStyle.solid, width: 2.0),
          borderRadius: BorderRadius.circular(28),
          color: answerColor,
        ),
        child: Center(
            child: Text(
                answers,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        )),
      ),
    );
  }
}
