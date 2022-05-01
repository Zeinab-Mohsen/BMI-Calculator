import 'dart:math';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibm_calculator/componenets/app_bar.dart';
import 'package:ibm_calculator/componenets/bloc/cubit.dart';
import 'package:ibm_calculator/componenets/bloc/states.dart';
import 'package:ibm_calculator/componenets/button.dart';
import 'package:ibm_calculator/componenets/text_info.dart';
import 'package:ibm_calculator/componenets/triangle.dart';
import 'package:ibm_calculator/views/bmi_result_screen.dart';


class BMIScreen extends StatelessWidget {

  String appToStringAsFixed(double number, int afterDecimal) {
    return '${number.toString().split('.')[0]}.${number.toString().split('.')[1].substring(0,afterDecimal)}';
  }

  @override
  Widget build(BuildContext context)
  {
    return BlocProvider(
      create: (BuildContext context) => CounterCubit(),
      child: BlocConsumer<CounterCubit, CounterStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.black,
            appBar: App_Bar(
              appBar: AppBar(),
              function: (){},
            ),
            body: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextInfo(text: 'BMI Calculator', fontsize: 40.0, color: Colors.white, fontWeight: FontWeight.w900,),
                  SizedBox(height: 20.0,),
                  TextInfo(text: ' Gender', fontsize: 20.0, color: Colors.white,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Triangle(gender: 'Male', icon: Icons.man_outlined, function: (){print('Male');CounterCubit.get(context).click(true);},color : CounterCubit.get(context).isMale? Colors.green : Colors.grey,),
                      SizedBox(width: 20.0,),
                      Triangle(gender: 'Female', icon: Icons.woman_outlined, function: (){print('Female');CounterCubit.get(context).click(false);},color : CounterCubit.get(context).isMale? Colors.grey : Colors.green,),
                    ],
                  ),
                  SizedBox(height: 25.0,),
                  TextInfo(text: ' Weight', fontsize: 20.0, color: Colors.white,),
                  SizedBox(height: 5.0,),
                  Row(
                    children: [
                      SizedBox(width: 10.0,),
                      Container(
                        color: Colors.white,
                        child: Row(
                          children: [
                            Button(icon: Icons.remove, function: (){CounterCubit.get(context).weightMinus();}, heroTag: 'weight--'),
                            SizedBox(width: 85.0,),
                            TextInfo(text: '${CounterCubit.get(context).weight}', fontsize: 40.0, fontWeight: FontWeight.w900,),
                            SizedBox(width: 85.0,),
                            Button(icon: Icons.add, function: (){CounterCubit.get(context).weightPlus();}, heroTag: 'weight++'),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20.0,),
                  TextInfo(text: ' Height', fontsize: 20.0, color: Colors.white,),
                  SizedBox(height: 5.0,),
                  Row(
                    children: [
                      SizedBox(width: 10.0,),
                      Container(
                        color: Colors.white,
                        child: Row(
                          children: [
                            Button(icon: Icons.remove, function: (){CounterCubit.get(context).heightMinus();}, heroTag: 'height--'),
                            SizedBox(width: 82.0,),
                            TextInfo(text: '${CounterCubit.get(context).height}', fontsize: 40.0, fontWeight: FontWeight.w900,),
                            SizedBox(width: 82.0,),
                            Button(icon: Icons.add, function: (){CounterCubit.get(context).heightPlus();}, heroTag: 'height++'),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20.0,),
                  TextInfo(text: ' Age', fontsize: 20.0, color: Colors.white,),
                  SizedBox(height: 5.0,),
                  Row(
                    children: [
                      SizedBox(width: 10.0,),
                      Container(
                        color: Colors.white,
                        child: Row(
                          children: [
                            Button(icon: Icons.remove, function: (){CounterCubit.get(context).ageMinus();}, heroTag: 'age--'),
                            SizedBox(width: 82.0,),
                            TextInfo(text: '${CounterCubit.get(context).age}', fontsize: 40.0, fontWeight: FontWeight.w900,),
                            SizedBox(width: 82.0,),
                            Button(icon: Icons.add, function: (){CounterCubit.get(context).agePlus();}, heroTag: 'age++'),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 30.0,),
                  Container(
                    width: double.infinity,
                    height: 50,
                    child: MaterialButton(
                      onPressed: (){
                        print("calculate");
                        double result = CounterCubit.get(context).weight / pow(CounterCubit.get(context).height/ 100, 2);
                        print(result);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BmiResultScreen(
                              result: appToStringAsFixed(result, 2),
                            ),
                          ),
                        );
                      },
                      color: Colors.teal,
                      child: TextInfo(text: 'Calculate', fontsize: 20.0, color: Colors.white,),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
