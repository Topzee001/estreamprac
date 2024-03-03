import 'package:estreamprac/screens/email_verification_screen.dart';
import 'package:estreamprac/screens/home_screen.dart';
import 'package:estreamprac/screens/login_or_register_screen.dart';
//import 'package:estreamprac/screens/login_screen.dart';
//import 'package:estreamprac/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// class AuthScreen extends StatelessWidget {
//   const AuthScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: StreamBuilder<User?>(
//         stream: FirebaseAuth.instance.authStateChanges(),
//         builder: (context, snapshot) {
//           //user logged in?
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const CircularProgressIndicator();
//           } else if (snapshot.hasData) {
//             Navigator.pop(context);
//             User? user = snapshot.data;
//             print(user);
//             if (user != null && !user.emailVerified) {
//               //Navigator.pop(context);
//               //return VerifyEmailScreen(user: user);
//               return const VerifyEmailScreen();
//             } else {
//               return HomeScreen();
//             }
//           }
//           //user not logged in
//           else {
//             return const LoginOrRegisterScreen();
//           }
//         },
//       ),
//     );
//   }
// }

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<User?>(
        future: FirebaseAuth.instance.authStateChanges().first,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasData) {
            User? user = snapshot.data;
            print(user);
            if (user != null && !user.emailVerified) {
              return const VerifyEmailScreen();
            } else {
              return HomeScreen();
            }
          } else {
            return const LoginOrRegisterScreen();
          }
        },
      ),
    );
  }
}
