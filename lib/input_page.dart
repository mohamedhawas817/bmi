import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusablecard.dart';
import 'columnIcon.dart';
import 'constants.dart';
import 'calculate_brain.dart';
import 'results.dart';


enum Gender {
  male,
  female

}

class InputPAge extends StatefulWidget {
  @override
  _InputPAgeState createState() => _InputPAgeState();
}

class _InputPAgeState extends State<InputPAge> {


  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 21;


/*
  Color maleCardColor = inActiveCardColeur;
  Color femaleCardColor = inActiveCardColeur;


  void updateColor(Gender gender) {
    if(gender == Gender.male) {
      if(maleCardColor == inActiveCardColeur) {
        maleCardColor = activeCardColour;
        femaleCardColor = inActiveCardColeur;
      }else {
        maleCardColor = inActiveCardColeur;
      }
    }
    if(gender ==Gender.female) {
      if(femaleCardColor == inActiveCardColeur) {
        femaleCardColor = activeCardColour;
        maleCardColor = inActiveCardColeur;
      }else {
        femaleCardColor = inActiveCardColeur;
      }
    }
  }

 */


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: [
          Expanded(child: Row(
            children: [
              Expanded(
                child: ReuseableCard(coleur: selectedGender == Gender.male ? activeCardColour: inActiveCardColeur,
                  cardChild: ColumnIcon(text: "Male", icon: FontAwesomeIcons.mars,),
                  onPress: () {
                  setState(() {
                    selectedGender = Gender.male;
                  });
                  },
                ),
              ),
              Expanded(
                child: ReuseableCard(coleur: selectedGender == Gender.female ? activeCardColour: inActiveCardColeur ,
                  cardChild: ColumnIcon(text: "Female", icon: FontAwesomeIcons.venus, ),
                onPress: () {
                  setState(() {
                    selectedGender = Gender.female;
                  });
                },),
              ),


            ],
          )),
          Expanded(child:ReuseableCard(
              coleur:activeCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "HEIGHT",
                    style: klabelText
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                      Text(
                          height.toString(),
                        style: kstylefont
                      ),
                      Text("cm",
                        style: klabelText,
                      ),


                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: Color(0xFFEB1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0 ),
                      overlayShape: RoundSliderThumbShape(enabledThumbRadius: 22.0)
                    ),
                    child: Slider(
                        value: height.toDouble(),
                        min:120.0,
                        max: 220,
                        onChanged: (double Value) {
                          setState(() {
                            height = Value.round();
                          });

                        }
                    ),
                  )
                ],
              ) ,
          ),
          ),

          Expanded(child: Row(
            children: [
              Expanded(
                child:ReuseableCard(
                    coleur: activeCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("WEIGHT",
                          style: klabelText,
                        ),
                        Text(weight.toString(), style: kstylefont,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(icon: FontAwesomeIcons.plus, changeweight: () {
                              setState(() {
                                weight++;
                              });
                            }, ),
                            SizedBox(width: 10.0,),
                            RoundIconButton(icon: FontAwesomeIcons.minus, changeweight: () {
                              setState(() {
                                weight--;
                              });
                            },)
                          ],
                        )
                      ],
                    ),
                ),
              ),
              Expanded(
                child:ReuseableCard(
                  coleur: activeCardColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("AGE",
                        style: klabelText,
                      ),
                      Text(age.toString(), style: kstylefont,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(icon: FontAwesomeIcons.plus, changeweight: () {
                            setState(() {
                              age++;
                            });
                          }, ),
                          SizedBox(width: 10.0,),
                          RoundIconButton(icon: FontAwesomeIcons.minus, changeweight: () {
                            setState(() {
                              age--;
                            });
                          },)
                        ],
                      )
                    ],
                  ),
                ),
              ),


            ],
          )),
          BottomButton(cal: "Calculate", tap: () {
            print(weight);

            CalcuBrain brain = CalcuBrain(heghit: height, weight: weight);


            Navigator.push(context, MaterialPageRoute(builder: (context) => ResultsPage(
              calculauteBmi: brain.calculauteBmi() ,
              getResult: brain.getResult() ,
              getInterpretaion: brain.getInterpretaion() ,
            ) ));
          })
        ],
      ),
      


      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
      ),
    );
  }
}

class BottomButton extends StatelessWidget {

  BottomButton({this.cal, this.tap});

  final String cal;
  final Function tap;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:  tap,
      child: Container(
        alignment: Alignment.center,
        child: Text(cal, style: kLargeButton,),
        color: bottomContainerColeur,
        margin: EdgeInsets.only(top:10.0),
        padding: EdgeInsets.only(bottom: 20.0),
        height: 80.0,
        width: double.infinity,
      ),
    );
  }
}


class RoundIconButton extends StatelessWidget {

  RoundIconButton({this.icon, this.changeweight});

  final IconData icon;
  final Function changeweight;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        child: Icon(icon) ,
        onPressed: changeweight,
        elevation: 6.0,
        constraints: BoxConstraints.tightFor(
          width: 56.0,
          height: 56.0
        ),
        shape: CircleBorder(),
      //RoundedReactangleBorder(borderRadius: BorderRadius.circular(10.0))
        fillColor: Color(0xFF4C45E) ,
    );
  }
}



