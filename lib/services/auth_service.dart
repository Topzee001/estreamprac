//import 'package:estreamprac/screens/register_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  //google sign in
  Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

      //begin auth details from request
      final GoogleSignInAuthentication? gAuth = await gUser?.authentication;

      //create a new credential for user
      final credential = GoogleAuthProvider.credential(
        accessToken: gAuth?.accessToken,
        idToken: gAuth?.idToken,
      );

      //let's sign in
      final userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      return userCredential;
    } catch (e) {
      print('Error signing in with Google: $e');
    }
    // Call the signInWithGoogle function
    final UserCredential? userCredential = await signInWithGoogle();

// Check if the user exists
    if (userCredential != null) {
      // User signed in successfully
    } else {}

    //opens a page that allows you to select your email
    return null;
  }

  signUpWithGoogle() async {
    //opens a page that allows you to select your email
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    //begin auth details from request
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    //create a new credential for user
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    //let's sign in
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<void> handleSignOut() async {
    try {
      // Step 6: Sign out from Google
      await GoogleSignIn().signOut();
      print('Signed out successfully.');
    } catch (error) {
      print('Error signing out: $error');
    }
  }
}


