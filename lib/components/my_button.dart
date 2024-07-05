import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final Function()? onTap;

  const MyButton({
    required this.onTap,
    required this.text,
    super.key
    });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      
        child: Container(
          width: 127,
          height: 49,
          decoration: BoxDecoration(
            color: Color(0xFF96DDD6),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                offset: Offset(0, 1),
                blurRadius: 2,
              ),
            ],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
        ),
    );
  }
}