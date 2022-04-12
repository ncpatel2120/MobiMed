import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:m_health/Screens/ProviderLogin.dart';

class ProviderState extends ChangeNotifier {
  ProviderState({this.uid});
  String _uid;
  String _email;
  String uid;
  String firstname;
  String email;

  String get getUid => _uid;

  String get getEmail => _email;


  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> signUpUser(String email, String password) async {


    bool success = false;

    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      if (userCredential != null) {
        _uid = userCredential.user.uid;
        _email = userCredential.user.email;
        return success = true;
      }
    } catch (e) {
      showToastComponent2();
    }

    return success;
  }

  Future<bool> LoginUser(String email, String password) async {
    bool success = false;
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      if (userCredential != null) {
        _uid = userCredential.user.uid;
        _email = userCredential.user.email;
        return success = true;
      }
    } catch (e) {
      showToastComponent();
    }
    return success;
  }


  void signOut() async {
    await _auth.signOut();
  }

  void showToastComponent() {
    Fluttertoast.showToast(
        msg: "Incorrect Email or Password",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  void showToastComponent2() {
    Fluttertoast.showToast(
        msg: "The Email Address is already in use by another account.",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

}



