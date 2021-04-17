import 'dart:math';

import 'package:flutter/material.dart';

class CalcuBrain {

  CalcuBrain({this.heghit, this.weight});

  final int heghit;
  final int weight;

  double _bmi;

  String calculauteBmi(){
    _bmi = weight / pow(heghit/100, 2);
    return _bmi.toStringAsFixed(1);


  }
  String getResult(){
    if(_bmi >= 25) {
      return "OVER WEIGHT";
    }else if(_bmi > 18.5) {
      return "Normal";
    }else {
      return "Under Weghit";
    }
  }

  String getInterpretaion() {
    if(_bmi >= 25) {
      return "it's over weight";
    }else if(_bmi > 18.5) {
      return "وزنك طبيعي بس حافظ علي كدا وابعد عن الفاست فود";
    }else {
      return "اقل من الطبيعي ...بياكلوا اكلك ولا ايه ههههه";
    }

  }
}