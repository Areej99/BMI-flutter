import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ReusableRow extends StatelessWidget {
ReusableRow({this.minusFunction,this.addFunction});
final Function minusFunction , addFunction;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        InkWell(
          onTap: addFunction,
          child: Container(
            width: 50,
            height: 50,
            child: Icon(Icons.add,size: 30,),
            decoration: BoxDecoration(
                color: Color(0xff111528),
                shape: BoxShape.circle
            ),
          ),
        ),
        //----------------------------------
        SizedBox(width: 30,),
        //-----------------------------------
        GestureDetector(
          onTap: minusFunction,
          child: Container(
            width: 50,
            height: 50,
            child: Icon(FontAwesomeIcons.minus,size: 30,),
            decoration: BoxDecoration(
                color: Color(0xff111528),
                shape: BoxShape.circle
            ),
          ),
        ),
      ],
    );
  }
}