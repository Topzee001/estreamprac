import 'package:estreamprac/screens/email_verification_screen.dart';
import 'package:estreamprac/screens/home_screen.dart';
import 'package:estreamprac/screens/login_or_register_screen.dart';
//import 'package:estreamprac/screens/login_screen.dart';
//import 'package:estreamprac/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //user logged in?
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasData) {
            User? user = snapshot.data;
            print(user);
            if (user != null && !user.emailVerified) {
              //Navigator.pop(context);
              return VerifyEmailScreen(user: user);
            } else {
              return HomeScreen();
            }
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

// class VerifyEmailScreen extends StatefulWidget {
//   final User user;
//   const VerifyEmailScreen({
//     super.key,
//     required this.user,
//   });

//   @override
//   State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
// }

// class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
//   Future<void> _sendVerificationEmail() async {
//     await widget.user.sendEmailVerification();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Email Verification'),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Center(child: const Text("please open email to verify")),
//           const Text("if you haven't recieve an email, press the button below"),
//           const SizedBox(
//             height: 15,
//           ),
//           TextButton(
//             onPressed: _sendVerificationEmail,
//             child: const Text(
//               'Resend email verification',
//             ),
//           ),
//           const SizedBox(
//             height: 15,
//           ),
//           TextButton(
//             onPressed: () async {
//               Get.to(
//                 () => const LoginOrRegisterScreen(),
//               );
//             },
//             child: const Text(
//               'Back',
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
