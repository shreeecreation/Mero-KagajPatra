import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class LoginAuth {
  static signInwithEmailandPass(String email, String password, BuildContext context) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await Permission.storage.request();
      });

// ignore: nullable_type_in_catch_clause
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  static logOutUser() {
    FirebaseAuth.instance.signOut();
  }
}
