import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../reusables/reusable_container.dart';
import '../reusables/reusable_row.dart';
import 'result_page.dart';
import 'dart:math';
import '../reusables/reusable_button.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height = 183;
  int weight = 75;
  int age = 25;
  Color activeColor = Color(0xff1D1F33);
  Color inactiveColor = Color(0xff101427);
  Color male = Color(0xff101427);
  Color female = Color(0xff101427);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //-------------------------------------
        appBar: AppBar(
          centerTitle: true,
          title: Text('BMI CALCULATOR'),
        ),
        //-------------------------------------
        body: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      myColor: male,
                      myIcon: FontAwesomeIcons.mars,
                      label: 'MALE',
                      onTap: () {
                        setState(() {
                          male = activeColor;
                          female = inactiveColor;
                        });
                      },
                    ),
                  ),
                  //-------------------------------------
                  Expanded(
                      child: ReusableCard(
                    myColor: female,
                    myIcon: FontAwesomeIcons.venus,
                    label: 'FEMALE',
                    onTap: () {
                      setState(() {
                        male = inactiveColor;
                        female = activeColor;
                      });
                    },
                  )),
                  //-------------------------------------
                ],
              ),
            ),
            //-----------------------------------------
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xff1D1F33),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                margin: EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'HEIGHT',
                      style: TextStyle(fontSize: 20),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: TextStyle(fontSize: 50),
                        ),
                        Text('cm'),
                      ],
                    ),
                    Slider(
                      activeColor: Color(0xffE71657),
                      inactiveColor: Color(0xffffffff),
                      min: 100,
                      max: 210,
                      value: height.toDouble(),
                      onChanged: (value) {
                        setState(() {
                          height = value.toInt();
                        });
                      },
                    )
                  ],
                ),
              ),
            ),
            //------------------------------------------
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xff1D1F33),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      margin: EdgeInsets.all(15.0),
                      child: Column(
                        //crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'WEIGHT',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            weight.toString(),
                            style: TextStyle(fontSize: 35),
                          ),
                          ReusableRow(
                            addFunction: () {
                              setState(() {
                                weight++;
                              });
                            },
                            minusFunction: () {
                              setState(() {
                                weight--;
                              });
                            },
                          )
                        ],
                      ),

                      //decoration: ,
                    ),
                  ),
                  //-------------------------------------
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xff1D1F33),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      margin: EdgeInsets.all(15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'AGE',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            age.toString(),
                            style: TextStyle(fontSize: 35),
                          ),
                          ReusableRow(
                            addFunction: () {
                              setState(() {
                                age++;
                              });
                            },
                            minusFunction: () {
                              setState(() {
                                age--;
                              });
                            },
                          )
                        ],
                      ),
                      //decoration: ,
                    ),
                  ),
                  //-------------------------------------
                ],
              ),
            ),
            ReusableButton(
              text: 'calculate',
              onPressed: () {
                double bmi = weight / pow((height / 100), 2);
                String status;
                String statusText;
                if (bmi < 18.0) {
                  status = 'Underweight';
                  statusText = 'you are underweight';
                } else if (bmi > 25.0) {
                  status = 'overweight';
                  statusText = 'you are overweight';
                } else {
                  status = 'normal';
                  statusText = 'you are normal';
                }
                print(bmi);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      bmi: double.parse(bmi.toStringAsFixed(1)),
                      status: status,
                      statusText: statusText,
                    ),
                  ),
                );
              },
            )
          ],
        )
        //-------------------------------------
        );
  }
}
