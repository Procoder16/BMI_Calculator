import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.inputIcon, @required this.onTapped});

  final IconData inputIcon;
  final Function onTapped;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(
        inputIcon,
        color: Color(0xFF11292F),
      ),
      onPressed: onTapped,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      elevation: 6.0,
      shape: CircleBorder(),
      fillColor: Color(0xFFEDE5CC),
    );
  }
}
