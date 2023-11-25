import 'dart:io';

import 'package:firebase_auth_app/screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  //to correctly initialize firebase
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: "AIzaSyDPJ_nfV6fQJb-oeQaVPjsmsYnPSCw0bfo",
              appId: "1:487749653943:android:bf930deb2d7fe8067b0432",
              messagingSenderId: "487749653943",
              projectId: "authfirebase-9fe03"),
        )
      : await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrapper();
  }
}
