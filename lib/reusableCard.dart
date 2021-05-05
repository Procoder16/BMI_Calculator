import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.colour, this.cardChild, this.tapDetector});

  final Color colour;
  final Widget cardChild;
  final Function tapDetector;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tapDetector,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xFFEDE5CC),
          ),
          borderRadius: BorderRadius.circular(10.0),
          color: colour,
        ),
      ),
    );
  }
}
