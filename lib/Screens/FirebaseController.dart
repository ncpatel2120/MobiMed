

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:m_health/Screens/ProviderDashboard.dart';
import 'package:m_health/Screens/ProviderLogin.dart';


class FirebaseController extends GetxController{

  FirebaseAuth _auth = FirebaseAuth.instance;

  Rx<User> _firebaseUser = Rx<User>();

  String get user => _firebaseUser.value?.email;
  final String uid;
  FirebaseController({this.uid});

  @override
  void onInit() {
    _firebaseUser.bindStream(_auth.authStateChanges());
  }


  CollectionReference reference = FirebaseFirestore.instance.collection('Users');
  void createUser(String firstname,String lastname,String email,String password, String contact, String doc, String date, String time, String condtn) async
  {

    return await reference.doc(uid).set({
      "firstName": firstname,
      "lastName": lastname,
      "email":email,
      "contact": contact,
      "doctor": doc,
      "date": date,
      "time": contact,
      "condition": condtn,
    });

  }



  void login(String email,String password) async
  {
    await _auth.signInWithEmailAndPassword(email: email, password: password).then((value) => Get.offAll(ProviderDashboard())).
    catchError((onError)=>
        Get.snackbar("Error while sign in ", onError.message));
  }

  void signout() async{
    await _auth.signOut().then((value) => Get.offAll(ProviderLogin()));

  }


  void sendpasswordresetemail(String email) async{
    await _auth.sendPasswordResetEmail(email: email).then((value) {
      Get.offAll(ProviderLogin());
      Get.snackbar("Password Reset email link is been sent", "Success");
    }).catchError((onError)=> Get.snackbar("Error In Email Reset", onError.message) );
  }

  void deleteuseraccount(String email,String pass) async{
    User user = await _auth.currentUser;

    AuthCredential credential = EmailAuthProvider.credential(email: email, password: pass);


    await user.reauthenticateWithCredential(credential).then((value) {
      value.user.delete().then((res) {
        Get.offAll(ProviderLogin());
        Get.snackbar("User Account Deleted ", "Success");
      });
    }

    ).catchError((onError)=> Get.snackbar("Credential Error", "Failed"));
  }

}