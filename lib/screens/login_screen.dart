import 'package:estreamprac/components/my_button.dart';
import 'package:estreamprac/components/my_textfield.dart';
import 'package:estreamprac/components/square_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signUserIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey.shade300,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 30,
              color: Colors.black,
            ),
          ),
        ),
        title: Text(
          'Login screen',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SlideTransition(
              position: Tween<Offset>(
                begin: Offset(0, 1), // Slide from the bottom
                end: Offset.zero,
              ).animate(
                CurvedAnimation(
                  parent: ModalRoute.of(context)!.animation!,
                  curve: Curves.easeInOut,
                ),
              ),
            ),
            MyTextField(
              controller: emailController,
              labelText: 'Input Email',
              obscureText: false,
            ),
            SizedBox(
              height: 10,
            ),
            MyTextField(
              controller: passwordController,
              labelText: 'Input Password',
              obscureText: true,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Text(
                    'Forgotten password?',
                    style: TextStyle(color: Colors.grey.shade800),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            MyButton(
              onTap: signUserIn,
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey.shade400,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      'Or continue with',
                      style: TextStyle(
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey.shade400,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            //google button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SquareTile(imagePath: 'images/google.png'),
                // SizedBox(width: 10),
                // SquareTile(imagePath: 'images/apple.png'),
              ],
            ),

            SizedBox(height: 50),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: TextStyle(color: Colors.grey.shade700),
                ),
                Text(
                  ' Register now',
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
