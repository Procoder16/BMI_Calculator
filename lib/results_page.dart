import 'package:bmi_calculator/Bottom%20_Button.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/reusableCard.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(
      {@required this.result,
      @required this.resultInterpretation,
      @required this.resultText});

  final String resultText;
  final String resultInterpretation;
  final String result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR',
          style: TextStyle(
            color: Color(0xFFEDE5CC),
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: kResultsPageHeading,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kInactiveCardsColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultText.toUpperCase(),
                    style: kResultText,
                  ),
                  Text(result, style: kBmiResult),
                  Text(
                    resultInterpretation,
                    textAlign: TextAlign.center,
                    style: kResultInterpretation,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
              buttonTitle: 'RE-CALCULATE',
              onTap: () {
                Navigator.pop(context);
              })
        ],
      ),
    );
  }
}
