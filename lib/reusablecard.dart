import 'package:flutter/material.dart';
import 'input_page.dart';

class ReuseableCard extends StatelessWidget {

  ReuseableCard({@required this.coleur, this.cardChild, this.onPress});

  final Color coleur;
  final Widget cardChild;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress ,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: coleur,
            borderRadius: BorderRadius.circular(10.0)
        ),
      ),
    );
  }
}