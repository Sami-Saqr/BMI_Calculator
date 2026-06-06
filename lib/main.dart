import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_two/users_screen.dart' show UsersScreen;

import 'bmi_calculator.dart';
import 'bmi_calculator_two.dart';
import 'bmi_result_screen.dart';
import 'counter_screen.dart';
import 'home_screen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BmiCalculatorTwo(),
    );
  }
}
