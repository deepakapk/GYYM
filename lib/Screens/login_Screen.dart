import 'package:flutter/material.dart';
import 'package:gyym/Screens/signup_Screen.dart';

import '../widgets/textinput.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _email = TextEditingController();
  TextEditingController _pass = TextEditingController();
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
                  onPressed: () {},
                  child: const Text("LOGIN"),
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
