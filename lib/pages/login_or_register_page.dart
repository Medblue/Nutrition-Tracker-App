import 'package:flutter/material.dart';
import 'package:nutritrackerapp/pages/login_page.dart';
import 'package:nutritrackerapp/pages/register_page.dart';

class LoginOrRegisterPage extends StatefulWidget {
  const LoginOrRegisterPage({super.key});

  @override
  State<LoginOrRegisterPage> createState() => _LoginOrRegisterPageState();
}

class _LoginOrRegisterPageState extends State<LoginOrRegisterPage> {

  //intially show login page
  bool showLoginPage = true;

  //toggle between login and register page 
  void togglePages(){
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }
  @override
  Widget build(BuildContext context) {
    if(showLoginPage){
      return LoginPage(onTap: togglePages,);
    }
    else{
      return RegisterPage(onTap: togglePages,);
    }
  }
}