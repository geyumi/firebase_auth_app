import 'package:firebase_auth_app/constants/colors.dart';
import 'package:firebase_auth_app/constants/description.dart';
import 'package:firebase_auth_app/constants/styles.dart';
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

  //form key --> by using form key we can identify user has entered correct password,email
  final _formKey = GlobalKey<FormState>();

  //email password states
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgBlack,
        appBar: AppBar(
            title: const Text(
              "SIGN IN",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            backgroundColor: bgBlack),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 15, right: 10),
            child: Column(
              children: [
                //description
                Text(description, style: descriptionStyle),
                Center(
                    child: Image.asset(
                  "assets/images/man.png",
                  height: 180,
                  width: 150,
                )),
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        //email
                        TextFormField(
                          validator: (val) => val?.isEmpty == true
                              ? "Enter a valid email"
                              : null,
                          onChanged: (val) {
                            setState(() {
                              email = val;
                            });
                          },
                        ),

                        //password
                        TextFormField(
                          validator: (val) =>
                              val!.length < 6 ? "Enter a valid password" : null,
                          onChanged: (val) {
                            setState(() {
                              password = val;
                            });
                          },
                        ),

                        //google
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Login with social accounts",
                          style: descriptionStyle,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Center(
                              child: Image.asset(
                            "assets/images/google.png",
                            height: 50,
                          )),
                        ),
                        SizedBox(
                          height: 15,
                        ),

                        ///register
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Do not have an account?",
                                style: descriptionStyle,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                //go to the register page
                                onTap: () {},
                                child: Text("REGISTER",
                                    style: TextStyle(
                                        color: mainBlue,
                                        fontWeight: FontWeight.w600)),
                              )
                            ]),

                        //button
                        //anon
                      ],
                    ))
              ],
            ),
          ),
        ));
  }
}


// ElevatedButton(
//         child: const Text("Sign in Anonymously"),
//         onPressed: () async {
//           dynamic result = await _auth.signInAnonymously();
//           if (result == null) {
//             print("Error in signing");
//           } else {
//             print("Sign in anonymously");
//             print(result.uid);
//           }
//         },
//       ),