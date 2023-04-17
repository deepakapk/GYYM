import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gyym/Firebase_auth/firebase_auth.dart';
import 'package:gyym/Responsive/mobile_screen.dart';
import 'package:gyym/Responsive/responsive.dart';
import 'package:gyym/Responsive/web_screen.dart';
import 'package:gyym/Screens/login_Screen.dart';

import '../widgets/showsnackbar.dart';
import '../widgets/textinput.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _email = TextEditingController();
  TextEditingController _pass = TextEditingController();
  TextEditingController _name = TextEditingController();
  bool _isLoading = false;

  void signUpUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().signUpUser(
        email: _email.text, password: _pass.text, username: _name.text);
    setState(() {
      _isLoading = false;
    });
    if (res == "success") {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => ResponsiveScreen(
                  webScreen: WebScreen(), mobScreen: MobileScreen())));
    } else {
      showSnackBar(res, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          children: [
            Expanded(flex: 2, child: Container()),
            Column(
              children: [
                const Image(
                  image: AssetImage("assets/images/logo.png"),
                  width: 200,
                  height: 200,
                ),
                TextFieldInput(
                  hintText: "Enter Your Name",
                  textEditingController: _name,
                  textInputType: TextInputType.text,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFieldInput(
                  hintText: "Enter Your Email",
                  textEditingController: _email,
                  textInputType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFieldInput(
                  hintText: "Enter Your Password",
                  textEditingController: _pass,
                  textInputType: TextInputType.visiblePassword,
                  isPass: true,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shadowColor: Colors.redAccent,
                            backgroundColor: Color.fromARGB(255, 150, 69, 14)),
                        onPressed: signUpUser,
                        child: _isLoading
                            ? CircularProgressIndicator()
                            : const Text("Sing up")))
              ],
            ),
            Expanded(flex: 2, child: Container()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account? "),
                GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    },
                    child: const Text(
                      "Sign in",
                      style: TextStyle(decoration: TextDecoration.underline),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
