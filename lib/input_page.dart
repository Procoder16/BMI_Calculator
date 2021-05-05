import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'card_Property.dart';
import 'reusableCard.dart';
import 'constants.dart';
import 'results_page.dart';
import 'Round_Icon.dart';
import 'Bottom _Button.dart';
import 'Calculator_Brain.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

Gender selectedGender;

int height = 180;
int weight = 60;
int age = 19;

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'BMI CALCULATOR',
          style: TextStyle(
            color: Color(0xFFEDE5CC),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    tapDetector: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? kActiveCardsColour
                        : kInactiveCardsColour,
                    cardChild: CardProperty(
                      iconName: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    tapDetector: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? kActiveCardsColour
                        : kInactiveCardsColour,
                    cardChild: CardProperty(
                      iconName: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kInactiveCardsColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kInactiveLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kBoldLabelStyle,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        'cm',
                        style: kInactiveLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Color(0xFFEDE5CC),
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbColor: Color(0xFFEDE5CC),
                      overlayColor: Color(0x29EDE5CC),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: ReusableCard(
                  colour: kInactiveCardsColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'WEIGHT',
                        style: kInactiveLabelTextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: kBoldLabelStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            inputIcon: FontAwesomeIcons.minus,
                            onTapped: () {
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(
                            onTapped: () {
                              setState(() {
                                weight++;
                              });
                            },
                            inputIcon: FontAwesomeIcons.plus,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  colour: kInactiveCardsColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'AGE',
                        style: kInactiveLabelTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kBoldLabelStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            inputIcon: FontAwesomeIcons.minus,
                            onTapped: () {
                              setState(() {
                                age--;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(
                            onTapped: () {
                              setState(() {
                                age++;
                              });
                            },
                            inputIcon: FontAwesomeIcons.plus,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
          BottomButton(
              buttonTitle: 'CALCULATE',
              onTap: () {
                CalculatorBrain calc =
                    CalculatorBrain(height: height, weight: weight);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsPage(
                      result: calc.calculateBMI(),
                      resultText: calc.getResult(),
                      resultInterpretation: calc.getInterpretation(),
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
