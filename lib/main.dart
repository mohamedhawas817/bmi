import 'package:flutter/material.dart';
import 'input_page.dart';
import 'results.dart';

void main() {
  runApp(BMI());
}

class BMI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xFF0A0E21),
          accentColor: Colors.purple,
          scaffoldBackgroundColor: Color(0XFF0A0E21),


      ),

      home: InputPAge() ,

    );
  }
}



