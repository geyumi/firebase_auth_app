import 'package:firebase_auth_app/screens/authentication/authenticate.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Authenticate());
  }
}
