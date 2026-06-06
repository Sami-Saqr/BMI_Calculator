import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int counter = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                setState(() {
                  counter--;
                });
                print(counter);
              },
              child: Text('MINUS'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                '$counter',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  counter++;
                });
                print(counter);
              },
              child: Text('PLUS'),
            ),
          ],
        ),
      ),
    );
  }
}
