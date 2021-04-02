import 'package:flutter/material.dart';

class ReusableButton extends StatelessWidget {
  ReusableButton({this.text,this.onPressed});
  final String text;

  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: double.infinity,
      child: FlatButton(
        color: Color(0xffE71657),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}