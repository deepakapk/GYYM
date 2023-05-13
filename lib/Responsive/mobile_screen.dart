import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gyym/Firebase_auth/firebase_auth.dart';
import 'package:gyym/model/user_model.dart';
import 'package:gyym/providers/user_provider.dart';
import 'package:provider/provider.dart';

class MobileScreen extends StatelessWidget {
  const MobileScreen({super.key});

  void logout() async {
    await AuthMethods().signout();
  }

  @override
  Widget build(BuildContext context) {
    // Provider.of<UserProvider>(context, listen: false).refreshUser();s
    final UserModel? user = Provider.of<UserProvider>(context).getUser;

    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(child: Text(user!.Username)),
        ElevatedButton(onPressed: logout, child: const Text("Log out"))
      ],
    )));
  }
}
