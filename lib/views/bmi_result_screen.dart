import 'dart:ui';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:ibm_calculator/componenets/chart.dart';
import 'package:ibm_calculator/views/bmi_screen.dart';
import '../componenets/app_bar.dart';
import '../componenets/text_info.dart';

class BmiResultScreen extends StatelessWidget {
  final String result;

  BmiResultScreen({required this.result,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: App_Bar(
        appBar: AppBar(),
        icon: Icons.arrow_back_ios_outlined,
        function: () {Navigator.pop(context,);},
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LineChartSample2(),
                TextInfo(text: 'Your BMI calculator result is', fontsize: 30.0, color: Colors.white, fontWeight: FontWeight.bold,),
                TextInfo(text: '$result', fontsize: 30.0, color: Colors.white, fontWeight: FontWeight.bold,),
              ],
            ),
          Container(
            width: double.infinity,
            height: 50,
            child: MaterialButton(
              onPressed: (){
                print("Recalculate BMI");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BMIScreen(),),
                );
              },
              color: Colors.teal,
              child: TextInfo(text: 'Recalculate BMI', fontsize: 20.0, color: Colors.white,),
            ),
          ),
        ],
      ),
    );
  }
}
