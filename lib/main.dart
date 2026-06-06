import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_two/modules/users/users_screen.dart' show UsersScreen;

import 'modules/bmi/bmi_calculator.dart';
import 'modules/bmi/bmi_calculator_two.dart';
import 'modules/bmi_result/bmi_result_screen.dart';
import 'modules/counter/counter_screen.dart';
import 'modules/login/login_screen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
