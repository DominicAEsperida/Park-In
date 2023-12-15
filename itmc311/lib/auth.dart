import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Authentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Sign in with email and password
  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      return credential.user;
    } catch (e) {
      _handleAuthException(e);
      return null;
    }
  }

  // Sign out
  Future<void> signOut() async {
    await _auth.signOut();
  }

  // Handle FirebaseAuthException
  void _handleAuthException(dynamic e) {
    if (e is FirebaseAuthException) {
      switch (e.code) {
        case 'invalid-email':
          print('Email is Invalid');
          break;
        case 'user-not-found':
          print('No user found for that email.');
          break;
        case 'wrong-password':
          print('Wrong password provided for that user.');
          break;
        default:
          print('Email and Password do not match: ${e.message}');
      }
    } else {
      print('An unexpected error occurred: $e');
    }
  }
}

// Example usage:
// Authentication auth = Authentication();
// auth.signInWithEmailAndPassword("chip@gbox.adnu.edu.ph", "password");
// auth.signOut();
