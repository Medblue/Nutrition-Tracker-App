import 'package:flutter/material.dart';

class NutriWidget extends StatelessWidget {
  final String mainText;
  const NutriWidget({Key? key, required this.mainText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 210, 
        height: 150, 
        padding: EdgeInsets.all(12.0), 
        decoration: BoxDecoration(
          color: Color(0xFFA7E6FF),
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 8,
              offset: Offset(0, 3), 
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center, 
          children: [
            Text(
              mainText,
              style: const TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                fontSize: 20, 
                letterSpacing: -0.02,
                color: Colors.black,
              ),
              textAlign: TextAlign.center, 
            ),
          ],
        ),
      ),
    );
  }
}
