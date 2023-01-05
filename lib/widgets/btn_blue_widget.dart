import 'package:flutter/material.dart';

class BtnBlueWidget extends StatelessWidget {
  const BtnBlueWidget({super.key, required this.text, required this.onPressed});

  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          elevation: 5, shape: const StadiumBorder(), primary: Colors.blue),
      onPressed: onPressed,
      child: Container(
        width: double.infinity,
        height: 50,
        child: Center(
          child: Text(text,
              style: const TextStyle(color: Colors.white, fontSize: 20)),
        ),
      ),
    );
  }
}
