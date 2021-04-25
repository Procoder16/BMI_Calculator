import 'package:flutter/material.dart';

const labelTextStyle = TextStyle(
  fontSize: 18.0,
  color: Color(0xFF8D9E98),
);

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
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(label, style: labelTextStyle),
      ],
    );
  }
}
