import 'package:flutter/material.dart';
import '../reusables/reusable_button.dart';

class ResultPage extends StatelessWidget {
  ResultPage({this.bmi, this.status, this.statusText});
  final double bmi;
  final String status;
  final String statusText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'BMI Calculator',
          style: TextStyle(fontSize: 30),
        ),
      ),
      //---------------------------------
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              'Your Result',
              style: TextStyle(fontSize: 40),
            ),
          )),
          Expanded(
            flex: 5,
            child: Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(25),
              width: double.infinity,
              color: Color(0xff1D1F33),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    status,
                    style: TextStyle(color: Colors.green, fontSize: 40),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    bmi.toString(),
                    style: TextStyle(fontSize: 80),
                  ),
                  Text(
                    statusText,
                    style: TextStyle(fontSize: 25),
                  ),
                ],
              ),
            ),
          ),
          //-----------------------------------------------------------
          ReusableButton(
            text: 'Re-calculate',
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
