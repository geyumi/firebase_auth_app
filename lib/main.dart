import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_app/models/UserModel.dart';
import 'package:firebase_auth_app/screens/wrapper.dart';
import 'package:firebase_auth_app/services/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  //to correctly initialize firebase
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: "AIzaSyBLlqyZZ0NwiryWSVknoHDaaKvistqpH_k",
              appId: "1:964319989532:android:2777ba683023d4d677f4d9",
              messagingSenderId: "964319989532",
              projectId: "authenticationfirebase-efcc3"),
        )
      : await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel?>.value(
      initialData: UserModel(uid: ""),
      value: AuthServices().user,
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}
