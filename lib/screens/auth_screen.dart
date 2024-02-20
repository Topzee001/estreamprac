import 'package:estreamprac/screens/home_screen.dart';
import 'package:estreamprac/screens/login_or_register_screen.dart';
//import 'package:estreamprac/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //user logged in?
          if (snapshot.hasData) {
            return HomeScreen();
          }

          //user not logged in
          else {
            return const LoginOrRegisterScreen();
          }
        },
      ),
    );
  }
}
