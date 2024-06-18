import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nutritrackerapp/components/UserDisplay.dart';
import 'package:nutritrackerapp/pages/userInfo_page.dart';


class HomePage extends StatelessWidget {
   HomePage({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  //Register new user
  void registerNewUser(BuildContext context){
   
       Navigator.push(context, MaterialPageRoute(builder: (context) => UserInfoPage(),),);
   
  }

  //Sign out mehtod
  void signUserOut(){
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
     final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF40E0D0), 
              Color(0xFF1C1563), 
            ],
          ),
        ), 
      child: Column(
        children: [
          // Custom AppBar-like section
          Container(
            padding: const EdgeInsets.only(left: 185, top: 26, right: 9),
            height: 42 + 26, // Account for padding
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Color.fromARGB(255, 255, 255, 255),
                  width: 0.5,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              //  IconButton(
               //   icon: const Icon(Icons.arrow_back, color: Colors.black),
               //   onPressed: () {
               //     Navigator.of(context).pop(); // Navigate back to the previous page
               //   },
               // ),
              const Align(
                  alignment: Alignment.center,
                  child: const Text(
                    'User List',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      letterSpacing: -0.02,
                      color: Colors.black,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.logout, color: Colors.black),
                  onPressed: signUserOut,
                ),
              ],
            ),
          ),
          // Main content
         Expanded(
            child: Center(
             child: UserDisplay(
              onTap: () => registerNewUser(context),
              mainText: "User1",
             ),
            ),
          ),
        ],
      ),
        ),
    );
  }
}