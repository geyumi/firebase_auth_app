import 'package:firebase_auth_app/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //ref object for AuthServices class
  final AuthServices _auth = AuthServices();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("HOME"),
          actions: [
            ElevatedButton(
                onPressed: () async {
                  await _auth.signOut();
                },
                child: const Icon(Icons.logout))
          ],
        ),
      ),
    );
  }
}
