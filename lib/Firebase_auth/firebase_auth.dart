import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../model/user_model.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // sign Up user

  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
  }) async {
    String res = "Some error occured";
    try {
      if (email.isNotEmpty || password.isNotEmpty || username.isNotEmpty) {
        // register user
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        // ! Create a user model
        UserModel um = UserModel(
          Username: username,
          email: email,
          uid: cred.user!.uid,
          height: "0",
          weight: "0",
        );

        await _firestore
            .collection("users")
            .doc(cred.user!.uid)
            .set(um.toJson());

        res = "success";
      }
    } catch (error) {
      res = error.toString();
      print(error.toString());
    }
    return res;
  }

  // Login User
  Future<String> loginUser(
      {required String email, required String pass}) async {
    String res = "Some error Occured";
    try {
      if (email.isNotEmpty || pass.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(email: email, password: pass);
        res = "success";
      } else {
        res = "Please enter all the fields";
      }
    } catch (error) {
      res = error.toString();
    }
    return res;
  }

  // !log out
  Future signout() async {
    await _auth.signOut();
  }

  // !get user details
  Future<UserModel> getUserDetails() async {
    User currentUser = _auth.currentUser!;

    DocumentSnapshot snap =
        await _firestore.collection("users").doc(currentUser.uid).get();

    return UserModel.fromSnap(snap);
  }
}
