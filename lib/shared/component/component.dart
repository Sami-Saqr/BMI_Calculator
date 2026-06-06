import 'package:flutter/material.dart';

Widget defaultButton({
  required double width,
  required Color backgroundColor,
  required String text,
  required Function() function,
}) => SizedBox(
  width: width,
  child: OutlinedButton(
    onPressed: function,
    style: ElevatedButton.styleFrom(
      backgroundColor: backgroundColor,

      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
    child: Text(text.toUpperCase(), style: TextStyle(color: Colors.black)),
  ),
);
