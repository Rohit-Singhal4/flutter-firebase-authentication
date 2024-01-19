import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/screens/home_screen.dart';
import 'package:flutter_firebase_auth/utils/colors.dart';
import 'package:flutter_firebase_auth/widgets/onboarding_button_widget.dart';
import 'package:flutter_firebase_auth/widgets/text_field_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _usernameTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            "Sign Up",
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              hexStringToColor("#00B7FF"),
              hexStringToColor("#09B9FF"),
              hexStringToColor("#12BBFF"),
              hexStringToColor("#1CBDFF"),
              hexStringToColor("#25BFFF"),
              hexStringToColor("#2EC1FF"),
              hexStringToColor("#37C3FF"),
              hexStringToColor("#40C5FF"),
              hexStringToColor("#49C7FF"),
              hexStringToColor("#53C9FF")
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                    20, MediaQuery.of(context).size.height * 0.2, 20, 0),
                child: Column(
                  children: <Widget>[
                    textField("Enter Username", Icons.person_outline, false,
                        _usernameTextController),
                    const SizedBox(
                      height: 20,
                    ),
                    textField("Enter Email ID", Icons.person_outline_outlined,
                        false, _emailTextController),
                    const SizedBox(
                      height: 20,
                    ),
                    textField("Enter Password", Icons.lock_outline, true,
                        _passwordTextController),
                    const SizedBox(
                      height: 20,
                    ),
                    onboardingButton(context, "Sign Up", () {
                      FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: _emailTextController.text,
                              password: _passwordTextController.text)
                          .then((value) => {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomeScreen()))
                              });
                    }),
                  ],
                ),
              ),
            )));
  }
}
