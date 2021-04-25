import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'card_Property.dart';
import 'reusableCard.dart';

const bottomContainerHeight = 80.0;
const cardsColour = Color(0xFF1D1E33);
const bottomContainerColour = Color(0xFFEB1555);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
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
                      print('MALE CAR WAS TAPPED!');
                    },
                    child: ReusableCard(
                      colour: cardsColour,
                      cardChild: CardProperty(
                          iconName: FontAwesomeIcons.mars, label: 'MALE'),
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: cardsColour,
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
              colour: cardsColour,
            ),
          ),
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: ReusableCard(
                  colour: cardsColour,
                ),
              ),
              Expanded(
                child: ReusableCard(
                  colour: cardsColour,
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
