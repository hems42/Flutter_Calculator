import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final Function(String data)? onComplete;
  final String title;

  const CalculatorButton({Key? key, this.onComplete, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(20)),
        onPressed: () {
          onComplete!('');
        },
        child: Text(title));
  }
}
