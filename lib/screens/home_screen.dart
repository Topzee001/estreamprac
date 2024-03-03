import 'package:estreamprac/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final user = FirebaseAuth.instance.currentUser;
  final AuthService _authService = AuthService();

  void signUserOut() {
    FirebaseAuth.instance.signOut();
    _authService.handleSignOut();
    //Navigator.pop();
    print('Signed out successfully.');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('welcome screen'),
        actions: [
          IconButton(
            onPressed: signUserOut,
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Welcome you're logged in as: ${user?.email ?? 'Guest'}",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
