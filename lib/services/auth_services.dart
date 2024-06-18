import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices{
  
  //Google sign in
  signInWithGoogle() async{

  try{
    //begin interactive sign in process
  final GoogleSignInAccount? gUser = await GoogleSignIn().signIn(); //user can select their Google account

  if(gUser == null){
    return null; //User cancelled the sign in
  }
    //obtain auth details from request
  final GoogleSignInAuthentication gAuth = await gUser.authentication;

    //create a new credential for user
  final credential = GoogleAuthProvider.credential(
    accessToken: gAuth.accessToken,
    idToken: gAuth.idToken,
    );
    //finally, sign in
  return await FirebaseAuth.instance.signInWithCredential(credential);
  }
  catch(e){
     print('Error during Google sign-in: $e');
      return null;
  }
  }
}