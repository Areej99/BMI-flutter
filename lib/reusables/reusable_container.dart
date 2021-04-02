import 'package:flutter/material.dart';


class ReusableCard extends StatelessWidget {
  ReusableCard({this.myColor,this.myIcon,this.label,this.onTap});
final Function onTap;
final Color myColor;
final IconData myIcon;
final String label;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: myColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        margin: EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              myIcon,
              size: 80,
            ),
            SizedBox(height: 10,),
            Text(label,style: TextStyle(fontSize: 15),),
          ],
        ),
//decoration:
      ),
    );
  }
}