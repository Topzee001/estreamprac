import 'package:estreamprac/screens/auth_screen.dart';
import 'package:estreamprac/screens/login_or_register_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatefulWidget {
  // final User user;
  const VerifyEmailScreen({
    super.key,
    // required this.user,
  });
  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  Future<void> _sendVerificationEmail() async {
    //await FirebaseAuth.instance.currentUser!.sendEmailVerification();
    final user = FirebaseAuth.instance.currentUser;
    await user?.sendEmailVerification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Email Verification'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text("please open email to verify"),
          ),
          const Text("if you haven't recieve an email, press the button below"),
          const SizedBox(
            height: 15,
          ),
          TextButton(
            onPressed: _sendVerificationEmail,
            child: const Text(
              'Resend email verification',
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          TextButton(
            onPressed: () async {
              Get.to(
                () => const LoginOrRegisterScreen(),
              );
              // const return AuthScreen();
              // Navigator.pushAndRemoveUntil(context, newRoute, (route) => false)
            },
            child: const Text(
              'Verified email? Login now',
            ),
          ),
        ],
      ),
    );
  }
}
