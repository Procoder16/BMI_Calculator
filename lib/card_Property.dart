import 'package:flutter/material.dart';
import 'constants.dart';

class CardProperty extends StatelessWidget {
  CardProperty({this.iconName, this.label});

  final IconData iconName;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconName,
          size: 80.0,
          color: Color(0xFFEDE5CC),
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(label, style: kInactiveLabelTextStyle),
      ],
    );
  }
}
