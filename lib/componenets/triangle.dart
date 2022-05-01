import 'package:flutter/material.dart';
import 'package:ibm_calculator/componenets/text_info.dart';

Widget Triangle({
  double width = 150,
  double height = 200,
  required String gender,
  required Color color,
  required IconData icon,
  required Function() function,

}) =>  Container(
  width: width,
  height: height,
  decoration: BoxDecoration(
    border: Border.all(
      color: color,
      width: 4.0,
    ),
  ),

  child: MaterialButton(
    elevation: 0.0,
    onPressed: function,
    color: Colors.grey,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 120.0,
          color: Colors.white,
        ),
        TextInfo(text: gender, fontsize: 20.0, color: Colors.white,),
      ],
    ),
  ),
);