import 'package:flutter/material.dart';

class SquareTile extends StatelessWidget {
  final Function()? onTap;
  final imagePath;
  const SquareTile({
    required this.imagePath,
    required this.onTap,
    super.key
    });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: 
            Border.all(
              color: Color.fromARGB(255, 31, 69, 153),
            ),
            borderRadius: BorderRadius.circular(16),
          ),
        child: Image.asset(imagePath, height: 50,),
      ),
    );
  }
}