import 'package:flutter/material.dart';
import 'package:gyym/Firebase_auth/firebase_auth.dart';
import 'package:gyym/model/user_model.dart';

class UserProvider with ChangeNotifier {
  UserModel? _user;
  final AuthMethods _auth = AuthMethods();

  UserModel? get getUser => _user;

  Future<void> refreshUser() async {
    UserModel user = await _auth.getUserDetails();
    _user = user;
    notifyListeners();
  }
}
