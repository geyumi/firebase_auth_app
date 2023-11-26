import 'package:firebase_auth_app/constants/colors.dart';
import 'package:firebase_auth_app/constants/description.dart';
import 'package:firebase_auth_app/constants/styles.dart';
import 'package:firebase_auth_app/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  //function for toggle
  final Function toggle;
  const SignIn({Key? key, required this.toggle}) : super(key: key);

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
  String error = "";

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
                  height: 150,
                )),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          //email
                          TextFormField(
                            style: TextStyle(color: Colors.white),
                            decoration: textInputDecoration,
                            validator: (val) => val?.isEmpty == true
                                ? "Enter a valid email"
                                : null,
                            onChanged: (val) {
                              setState(() {
                                email = val;
                              });
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),

                          //password
                          TextFormField(
                            obscureText: true,
                            style: TextStyle(color: Colors.white),
                            decoration: textInputDecoration.copyWith(
                                hintText: "Password"),
                            validator: (val) => val!.length < 6
                                ? "Enter a valid password"
                                : null,
                            onChanged: (val) {
                              setState(() {
                                password = val;
                              });
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),

                          Text(
                            error,
                            style: TextStyle(color: Colors.red),
                          ),
                          //google
                          const SizedBox(
                            height: 5,
                          ),

                          const Text(
                            "Login with social accounts",
                            style: descriptionStyle,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Center(
                                child: Image.asset(
                              "assets/images/google.png",
                              height: 40,
                            )),
                          ),
                          SizedBox(
                            height: 10,
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
                                  onTap: () {
                                    widget.toggle();
                                  },
                                  child: Text("REGISTER",
                                      style: TextStyle(
                                          color: mainBlue,
                                          fontWeight: FontWeight.w600)),
                                )
                              ]),

                          SizedBox(
                            height: 15,
                          ),

                          //button
                          GestureDetector(
                            //method for login user
                            onTap: () async {
                              dynamic result = await _auth
                                  .signInUsingEmailAndPassword(email, password);
                              if (result == null) {
                                setState(() {
                                  error =
                                      "Could not sign in with those credentials";
                                });
                              }
                            },
                            child: Container(
                              height: 40,
                              width: 200,
                              child: Center(
                                  child: const Text(
                                "LOGIN",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              )),
                              decoration: BoxDecoration(
                                  color: bgBlack,
                                  borderRadius: BorderRadius.circular(100),
                                  border:
                                      Border.all(width: 2, color: mainYellow)),
                            ),
                          ),

                          SizedBox(
                            height: 15,
                          ),

                          //anon
                          GestureDetector(
                            //method for login user as anon
                            onTap: () async {
                              await _auth.signInAnonymously();
                            },
                            child: Container(
                              height: 40,
                              width: 200,
                              child: Center(
                                  child: const Text(
                                "LOGIN AS GEUEST",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              )),
                              decoration: BoxDecoration(
                                  color: bgBlack,
                                  borderRadius: BorderRadius.circular(100),
                                  border:
                                      Border.all(width: 2, color: mainYellow)),
                            ),
                          )
                        ],
                      )),
                )
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
