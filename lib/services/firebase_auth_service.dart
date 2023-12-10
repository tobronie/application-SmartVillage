import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class firebaseAuthService {
  FirebaseAuth _authServicev = FirebaseAuth.instance;

  Future<User?> signUpWithEmailandPassword(
    String email,
    String password,
    BuildContext context,
  ) async {
    try {
      UserCredential credential =
          await _authServicev.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return credential.user;
    } catch (e) {
      final String errorMessage = e.toString();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
          backgroundColor: Colors.red,
        ),
      );
      return null;
    }
  }

  Future<User?> loginUpWithEmailandPassword(
      String email, password, BuildContext context) async {
    try {
      UserCredential credential = await _authServicev
          .signInWithEmailAndPassword(email: email, password: password);
      return credential.user;
    } catch (e) {
      final String errorMessage = e.toString();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
          backgroundColor: Colors.red,
        ),
      );
      return null;
    }
  }
}
