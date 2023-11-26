import 'package:firebase_auth_app/constants/colors.dart';
import 'package:firebase_auth_app/constants/description.dart';
import 'package:firebase_auth_app/constants/styles.dart';
import 'package:firebase_auth_app/services/auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  //function for toggle
  final Function toggle;
  const Register({Key? key, required this.toggle}) : super(key: key);

  @override
  State<Register> createState() => _Sign_InState();
}

class _Sign_InState extends State<Register> {
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
              "REGISTER",
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

                          //google
                          const SizedBox(
                            height: 20,
                          ),
                          //error text
                          Text(
                            error,
                            style: TextStyle(color: Colors.red),
                          ),
                          const Text(
                            "Login with social accounts",
                            style: descriptionStyle,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          GestureDetector(
                            //sign in with google
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
                                  onTap: () {
                                    widget.toggle();
                                  },
                                  child: Text("LOGIN",
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
                            //goto sign in page
                            onTap: () async {
                              dynamic result =
                                  await _auth.registerWithEmailAndPassword(
                                      email, password);

                              if (result == null) {
                                //error
                                error = "Please enter a valid email";
                              } else {}
                            },
                            child: Container(
                              height: 40,
                              width: 200,
                              child: Center(
                                  child: const Text(
                                "REGISTER",
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
                        ],
                      )),
                )
              ],
            ),
          ),
        ));
  }
}
