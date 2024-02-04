import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('welcome screen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: const Text(
              "Welcome you're logged in",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
