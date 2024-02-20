import 'package:estreamprac/components/my_button.dart';
import 'package:estreamprac/components/my_textfield.dart';
import 'package:estreamprac/components/square_tile.dart';
import 'package:estreamprac/services/auth_service.dart';
//import 'package:estreamprac/screens/home_screen.dart';
//import 'package:estreamprac/screens/register_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  final Function()? onTap;
  const LoginScreen({Key? key, required this.onTap}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signUserIn() async {
    showDialog(
        context: context,
        builder: ((context) {
          return const Center(child: CircularProgressIndicator());
        }));
    try {
      //final userCredential =
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      // print(userCredential);
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);

      invalidCredentials(e.code);
      // print('wrong email or password');
    }
  }

  void invalidCredentials(String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Center(child: Text(message)),
              //content: const Text('wrong email or password'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('OK'),
                ),
              ]);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey.shade200,
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
        title: const Text(
          'Login',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 130,
                ),
                SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0, 1), // Slide from the bottom
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
                const SizedBox(
                  height: 10,
                ),
                MyTextField(
                  controller: passwordController,
                  labelText: 'Input Password',
                  obscureText: true,
                ),
                const SizedBox(
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
                const SizedBox(
                  height: 20,
                ),
                MyButton(
                  text: 'Log in',
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
                  children: [
                    SquareTile(
                        imagePath: 'images/google.png',
                        onTap: () {
                          AuthService().signInWithGoogle();
                        }),
                    // SizedBox(width: 10),
                    // SquareTile(imagePath: 'images/apple.png'),
                  ],
                ),

                const SizedBox(height: 50),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(color: Colors.grey.shade700),
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        ' Register now',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
