import 'package:flutter/material.dart';

class ButtonsContainer extends StatelessWidget {
  const ButtonsContainer({
    super.key,
    required this.buttonValue,
    required this.buttonColor,
    required this.textColor,
    required this.onTap,
  });
  final String buttonValue;
  final Color buttonColor;
  final Color textColor;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
        color: buttonColor,
        shape: BoxShape.circle
        ),
        child: Center(
          child: Text(buttonValue,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: textColor,
            fontSize: 35,
          ),),
        ),
      ),
    );
  } 
}