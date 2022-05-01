import 'package:flutter/material.dart';

class TextInfo extends StatelessWidget {
  final String text;
  final double fontsize;
  final FontWeight fontWeight;
  final Color color;

  TextInfo({Key? key, required this.text, required this.fontsize, this.fontWeight = FontWeight.normal, this.color = Colors.black}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontsize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
