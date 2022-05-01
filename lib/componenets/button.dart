import 'package:flutter/material.dart';

Widget Button({
  Color backgroundColor = Colors.black,
  required IconData icon,
  required Function() function,
  required String heroTag,

}) =>  FloatingActionButton(
  onPressed: function,
  heroTag: heroTag,
  mini: true,
  backgroundColor: backgroundColor,
  child: Icon(
    icon,
  ),
);