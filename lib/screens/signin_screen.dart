import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/screens/home_screen.dart';
import 'package:flutter_firebase_auth/screens/signup_screen.dart';
import 'package:flutter_firebase_auth/utils/colors.dart';
import 'package:flutter_firebase_auth/widgets/logo_widget.dart';
import 'package:flutter_firebase_auth/widgets/onboarding_button_widget.dart';
import 'package:flutter_firebase_auth/widgets/text_field_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                logoWidget("assets/images/firebaselogo.png"),
                const SizedBox(
                  height: 30,
                ),
                textField(
                    "Email", Icons.person_outline, false, _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                textField("Password", Icons.lock_outline, true,
                    _passwordTextController),
                const SizedBox(
                  height: 20,
                ),
                onboardingButton(context, "Login", () {
                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: _emailTextController.text,
                          password: _passwordTextController.text)
                      .then((value) => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()))
                          });
                }),
                signUpFunction(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row signUpFunction() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have an account?",
            style: TextStyle(color: Colors.white70)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignUpScreen()));
          },
          child: const Text(
            " Sign Up",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
