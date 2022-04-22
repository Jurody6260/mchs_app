import 'package:flutter/material.dart';

class Answer extends StatefulWidget {
  final String answerText;
  final Color answerColor;
  final Function answerTap;
  const Answer(
      {required this.answerText,
      Key? key,
      required this.answerColor,
      required this.answerTap})
      : super(key: key);

  @override
  State<Answer> createState() => _AnswerState();
}

class _AnswerState extends State<Answer> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.answerTap();
      },
      child: Container(
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
        width: double.infinity,
        decoration: BoxDecoration(
          color: widget.answerColor,
          border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          widget.answerText,
          style: TextStyle(
            fontSize: 15.0,
          ),
        ),
      ),
    );
  }
}
