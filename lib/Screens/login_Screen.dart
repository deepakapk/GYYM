import 'package:flutter/material.dart';
import 'package:gyym/Firebase_auth/firebase_auth.dart';
import 'package:gyym/Screens/signup_Screen.dart';
import 'package:gyym/widgets/showsnackbar.dart';

import '../Responsive/mobile_screen.dart';
import '../Responsive/responsive.dart';
import '../Responsive/web_screen.dart';
import '../widgets/textinput.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _email = TextEditingController();
  TextEditingController _pass = TextEditingController();
  bool _isLoading = false;

  void login() async {
    setState(() {
      _isLoading = true;
    });
    String res =
        await AuthMethods().loginUser(email: _email.text, pass: _pass.text);

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
        child: Column(children: [
          Expanded(
            flex: 2,
            child: Container(),
          ),
          const Image(
            image: AssetImage("assets/images/logo.png"),
            width: 200,
            height: 200,
          ),
          Column(
            children: [
              TextFieldInput(
                  textEditingController: _email,
                  hintText: "Enter Your Email",
                  textInputType: TextInputType.emailAddress),
              const SizedBox(
                height: 10,
              ),
              TextFieldInput(
                textEditingController: _pass,
                hintText: "Enter Your Password",
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
                    backgroundColor: Color.fromARGB(255, 150, 69, 14),
                  ),
                  onPressed: login,
                  child: _isLoading
                      ? CircularProgressIndicator()
                      : const Text("LOGIN"),
                ),
              ),
            ],
          ),
          Expanded(flex: 2, child: Container()),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Don't Have an account? "),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()));
                },
                child: const Text(
                  "Sing Up",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
              )
            ],
          )
        ]),
      ),
    );
  }
}
