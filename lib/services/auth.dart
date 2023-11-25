import 'package:firebase_auth/firebase_auth.dart';

//create auth class
class AuthServices {
  //firebase instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

//following are services use for authentication

  //Sign in anonymous
  Future signInAnonymously() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return user;
    } catch (err) {
      print(err.toString());
      return null;
    }
  }
  //Register using email and password
  //Sign in using email and password
  //Sign in using gmail
  //Signout
}
