
import 'package:flutter/material.dart';

final customTextTheme = TextTheme(
  headlineLarge: TextStyle(fontSize: 24, height: 1.5, fontWeight: FontWeight.bold),
  headlineSmall: TextStyle(fontSize: 20, height: 1.5, fontWeight: FontWeight.bold),


  // Add more text styles as needed
);

class CustomButton extends StatelessWidget {
  final String name;
  final VoidCallback onPressed;

  const CustomButton({
    required this.name,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(10),
          child: Center(
            child: Text(
              name,
              style: TextStyle(color: Colors.white, fontSize: 16,fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}