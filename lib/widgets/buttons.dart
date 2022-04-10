import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Color color;
  final String title;
  final VoidCallback onpressed;
  final double textSize;

  MyButton(
      {required this.color,
      required this.title,
      required this.onpressed,
      required this.textSize});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(10),
        color: color,
        child: MaterialButton(
          onPressed: onpressed,
          // minWidth: 200,
          height: 42,
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: textSize,
            ),
          ),
        ),
      ),
    );
  }
}
