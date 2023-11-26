import 'package:firebase_auth_app/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  //ref object for AuthServices class
  final AuthServices _auth = AuthServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "SIGN IN",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.blue),
      body: ElevatedButton(
        child: const Text("Sign in Anonymously"),
        onPressed: () async {
          dynamic result = await _auth.signInAnonymously();
          if (result == null) {
            print("Error in signing");
          } else {
            print("Sign in anonymously");
            print(result.uid);
          }
        },
      ),
    );
  }
}
