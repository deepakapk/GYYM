import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserModel {
  final String Username;
  final String Email;
  final String uid;
  final String weight;
  final String height;

  const UserModel(
      {required this.Username,
      required this.Email,
      required this.uid,
      required this.height,
      required this.weight});

  Map<String, dynamic> toJson() => {
        'username': Username,
        'uid': uid,
        'email': 'email',
        'height': height,
        'weight': weight,
      };

  static UserModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return UserModel(
        Username: snapshot['username'],
        Email: snapshot['email'],
        uid: snapshot['uid'],
        height: snapshot['height'],
        weight: snapshot['weight']);
  }
}
