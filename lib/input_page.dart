import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'card_Property.dart';
import 'reusableCard.dart';

const bottomContainerHeight = 80.0;
const activeCardsColour = Color(0xFF1D1E33);
const inactiveCardsColour = Color(0xFF111328);
const bottomContainerColour = Color(0xFFEB1555);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

Color maleCardColour = inactiveCardsColour;
Color femaleCardColour = inactiveCardsColour;

void changeColour(int cardNumber) {
  if (cardNumber == 1) {
    //male card was tapped
    if (maleCardColour == inactiveCardsColour) {
      maleCardColour = activeCardsColour;
      femaleCardColour = inactiveCardsColour;
    } else {
      maleCardColour = inactiveCardsColour;
    }
  } else if (cardNumber == 2) {
    if (femaleCardColour == inactiveCardsColour) {
      femaleCardColour = activeCardsColour;
      maleCardColour = inactiveCardsColour;
    } else {
      femaleCardColour = inactiveCardsColour;
    }
  }
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        changeColour(1);
                      });
                    },
                    child: ReusableCard(
                      colour: maleCardColour,
                      cardChild: CardProperty(
                          iconName: FontAwesomeIcons.mars, label: 'MALE'),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        changeColour(2);
                      });
                    },
                    child: ReusableCard(
                      colour: femaleCardColour,
                      cardChild: CardProperty(
                        iconName: FontAwesomeIcons.venus,
                        label: 'FEMALE',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: activeCardsColour,
            ),
          ),
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: ReusableCard(
                  colour: activeCardsColour,
                ),
              ),
              Expanded(
                child: ReusableCard(
                  colour: activeCardsColour,
                ),
              ),
            ],
          )),
          Container(
            color: bottomContainerColour,
            height: bottomContainerHeight,
            width: double.infinity,
            margin: EdgeInsets.only(top: 10.0),
          )
        ],
      ),
    );
  }
}
