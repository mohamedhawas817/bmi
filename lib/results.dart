import 'package:flutter/material.dart';
import 'constants.dart';
import 'input_page.dart';


int weight = 70;

class ResultsPage extends StatelessWidget {

  ResultsPage({this.calculauteBmi, this.getResult, this.getInterpretaion});

  final String calculauteBmi;
  final String getResult;
  final String getInterpretaion;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(child: Container(
            child: Text("Your Result", style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold
            ),),

          )),
          Expanded( child: Center(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),


              color: Color(0xFF1D1E33),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,



                children: [
                  Text(getResult, style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),),
                  SizedBox(height: 30,),
                  Text(calculauteBmi, style:TextStyle(fontSize: 35, fontWeight: FontWeight.bold) ),
                  SizedBox(height: 15,),
                  Text(getInterpretaion, style:TextStyle(fontSize: 18, fontWeight: FontWeight.bold) ),


                ],
              ),
            ),
          )),
          BottomButton(cal: "Re-Calculate", tap: () {
            Navigator.pop(context);
          })
        ],
      ),
    );
  }
}
