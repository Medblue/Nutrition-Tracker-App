import 'package:flutter/material.dart';

class UserIcon extends StatelessWidget {
  const UserIcon({super.key});

  @override
  Widget build(BuildContext context) {
     return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            // User Circle Light
            Positioned(
              left: 49,
              top: 143,
              child: Container(
                width: 57,
                height: 54,
                decoration: BoxDecoration(
                  color: Colors.white, // Assuming a background color if needed
                  shape: BoxShape.circle,
                  border: Border.all(color: Color(0xFF222222)),
                ),
              ),
            ),
            // Ellipse 46
            Positioned(
              left: MediaQuery.of(context).size.width * 0.375,
              right: MediaQuery.of(context).size.width * 0.375,
              top: MediaQuery.of(context).size.height * 0.2917,
              bottom: MediaQuery.of(context).size.height * 0.4583,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Color(0xFF222222)),
                ),
              ),
            ),
            // Ellipse 47
            Positioned(
              left: MediaQuery.of(context).size.width * 0.125,
              right: MediaQuery.of(context).size.width * 0.125,
              top: MediaQuery.of(context).size.height * 0.125,
              bottom: MediaQuery.of(context).size.height * 0.125,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Color(0xFF222222)),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            // Ellipse 48
            Positioned(
              left: MediaQuery.of(context).size.width * 0.25,
              right: MediaQuery.of(context).size.width * 0.25,
              top: MediaQuery.of(context).size.height * 0.625,
              bottom: MediaQuery.of(context).size.height * 0.2206,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Color(0xFF222222)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}