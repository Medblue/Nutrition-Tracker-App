import 'package:flutter/material.dart';
//import 'package:nutritrackerapp/Icons/User.dart';


class UserDisplay extends StatelessWidget {
  final Function()? onTap;
  final String mainText;
  const UserDisplay({super.key, required this.onTap, required this.mainText});

  @override
  Widget build(BuildContext context) {
   return GestureDetector(
    onTap: onTap,
     child: Container(
        width: 292,
        height: 85,
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const[
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                mainText,
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  letterSpacing: -0.02,
                  color: Colors.black,
                ),
              ),
            ),
           /* SizedBox(height: 8),
          const Text(
              'Additional information goes here.',
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Colors.black54,
              ),
            ),*/
          ],
        ),
      ),
   );
  }
}

