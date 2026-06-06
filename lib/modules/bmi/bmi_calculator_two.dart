import 'dart:math';

import 'package:flutter/material.dart';

import '../bmi_result/bmi_result_screen.dart';

class BmiCalculatorTwo extends StatefulWidget {
  const BmiCalculatorTwo({super.key});

  @override
  State<BmiCalculatorTwo> createState() => _BmiCalculatorTwoState();
}

bool isMale = true;
double height = 120;
int weightCounter = 60;
int ageCounter = 28;

class _BmiCalculatorTwoState extends State<BmiCalculatorTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
        backgroundColor: Color(0xff0b0f1f),
        foregroundColor: Colors.white,
      ),

      body: Column(
        children: [
          // First Section MALE and FEMALE Gender
          Expanded(
            child: Container(
              color: Color(0xff0b0f1f),

              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isMale = true;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: isMale
                                ? Color(0xffe7144c)
                                : Color(0xff111324),
                            // color: Colors.grey,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,

                            children: [
                              Icon(Icons.male, color: Colors.white, size: 30),
                              SizedBox(height: 10),
                              Text(
                                'MALE',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isMale = false;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: isMale
                                ? Color(0xff111324)
                                : Color(0xffe7144c),
                            // color: Colors.grey,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.female, color: Colors.white, size: 30),
                              SizedBox(height: 10),
                              Text(
                                'FEMALE',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Second Section Slider HEIGHT
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(color: Color(0xff0b0f1f)),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xff1b1a2e),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'HEIGHT',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            '${height.round()}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          SizedBox(width: 5),
                          Text('CM', style: TextStyle(color: Colors.white)),
                        ],
                      ),
                      Slider(
                        activeColor: Color(0xffe7144c),
                        value: height,
                        max: 220,
                        min: 80,
                        onChanged: (value) {
                          setState(() {
                            height = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Last Section WEIGHT and AGE
          Expanded(
            child: Container(
              decoration: BoxDecoration(color: Color(0xff0b0f1f)),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xff1b1a2e),
                          borderRadius: BorderRadiusGeometry.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'WEIGHT',

                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '$weightCounter',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  heroTag: 'weight-',
                                  onPressed: () {
                                    setState(() {
                                      weightCounter--;
                                    });
                                  },
                                  foregroundColor: Colors.white,
                                  backgroundColor: Color(0xffe7144c),
                                  mini: true,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadiusGeometry.circular(
                                      50,
                                    ),
                                  ),
                                  child: Icon(Icons.remove),
                                ),
                                FloatingActionButton(
                                  heroTag: 'weight+',
                                  onPressed: () {
                                    setState(() {
                                      weightCounter++;
                                    });
                                  },
                                  foregroundColor: Colors.white,
                                  backgroundColor: Color(0xffe7144c),
                                  mini: true,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadiusGeometry.circular(
                                      50,
                                    ),
                                  ),
                                  child: Icon(Icons.add),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xff1b1a2e),
                          borderRadius: BorderRadiusGeometry.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'AGE',

                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '$ageCounter',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  heroTag: 'age-',
                                  onPressed: () {
                                    setState(() {
                                      ageCounter--;
                                    });
                                  },
                                  foregroundColor: Colors.white,
                                  backgroundColor: Color(0xffe7144c),
                                  mini: true,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadiusGeometry.circular(
                                      50,
                                    ),
                                  ),
                                  child: Icon(Icons.remove),
                                ),
                                FloatingActionButton(
                                  heroTag: 'age+',
                                  onPressed: () {
                                    setState(() {
                                      ageCounter++;
                                    });
                                  },
                                  foregroundColor: Colors.white,
                                  backgroundColor: Color(0xffe7144c),
                                  mini: true,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadiusGeometry.circular(
                                      50,
                                    ),
                                  ),
                                  child: Icon(Icons.add),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Button Calculate
          SizedBox(
            width: double.infinity,
            child: MaterialButton(
              onPressed: () {
                var result = weightCounter / pow(height / 100, 2);
                print(result.round());
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BmiResultScreen(
                      isMale: isMale,
                      result: result,
                      age: ageCounter,
                    ),
                  ),
                );
              },
              color: Color(0xffe7144c),
              height: 50,
              child: Text(
                'CALCULATE',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// var result = weight / pow(height / 100, 2);
// print(result.round());
