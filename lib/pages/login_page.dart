import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nutritrackerapp/components/SquareTile.dart';
import 'package:nutritrackerapp/components/my_button.dart';
import 'package:nutritrackerapp/components/my_textfield.dart';
import 'package:nutritrackerapp/pages/forgot_pw_page.dart';
import 'package:nutritrackerapp/services/auth_services.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';



class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  //text editing controllers
final emailController = TextEditingController();
final passwordController = TextEditingController();

//User sign in method
void signUserIn() async{
  

  //show loading circle
  showDialog(
    context: context, 
    builder: (context) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    },
    );


  //try sign in
  try {
  await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: emailController.text,
    password: passwordController.text,
    );
     //pop the loading circle
    Navigator.pop(context);

} on FirebaseAuthException catch (e) {
  // TODO

    //pop the loading circle
    Navigator.pop(context);

    //show error message
    showErrorMessage(e.code);
  }
}

//error message to user
void showErrorMessage(String message){
  showDialog(
    context: context,
   builder: (context) {
      return  AlertDialog(
        title: Center(
          child: Text(
            message,
            style: const TextStyle(color: Colors.black),
            ),
        ),
      );
   },
   );
}

  @override
  Widget build(BuildContext context) {
    // Get the screen's dimensions
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
        
        child: Align(
            alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min, //ensures that only the required space is taken up 
              children: [
            
               const SizedBox(height: 200),
                
                //mail textfield
                MyTextfield(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),
            
                SizedBox(height: 20),//Space b/w the two input fields
                
                //password textfield
                MyTextfield(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
            
                SizedBox(height: 30),
            
                MyButton(
                  onTap: signUserIn,
                  text: 'Sign In',
                ),
            
                SizedBox(height: 20),
            
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                       return ForgotPasswordPage(); 
                  },
                    ),
                    );
                  },
                  child: Text(
                  "Forgot Password?",
                   style: TextStyle(color: Colors.grey[400]),
                ),
                ),
                
            
                SizedBox(height: 50),
            
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: [
                     
                    const  Expanded(
                        child: Divider(
                          color: Colors.black,
                          thickness: 0.5,
                        ),
                      ),
                  
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text('Or continue with', 
                        style: TextStyle(color: Colors.grey[400]),
                        ),
                      ),
                  
                    const  Expanded(
                        child: Divider(
                          color: Colors.black,
                          thickness: 0.5,
                        ),
                      ),
                    ],
                  ),
                ),
            
                SizedBox(height: 40),
            
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //google button
                  SquareTile(
                    imagePath: 'lib/images/google.png',
                    onTap: () => AuthServices().signInWithGoogle(),
                    ),
                    const SizedBox(width: 20,),
                  //apple button
                   SquareTile(
                    imagePath: 'lib/images/apple.png',
                    onTap:() {},
                    ),
                ],
              ),
            
              SizedBox(height: 40,),
            
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not a member?', 
                     style: 
                      TextStyle(
                        color: Colors.grey[400],
                        )
                      ),
                  
                  SizedBox(width: 4),
            
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      'Register Now', 
                      style: 
                        TextStyle(
                          color: Color(0xFF40E0D0),
                          fontWeight: FontWeight.bold
                          ),
                        ),
                  ),
                ],
              )
            ],
                    ),
          ),
      ),
        
      ),
    );
  }
}





