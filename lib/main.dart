import 'package:estreamprac/home.dart';
import 'package:estreamprac/screens/auth_screen.dart';
import 'package:estreamprac/screens/email_verification_screen.dart';
import 'package:estreamprac/screens/login_screen.dart';
import 'package:estreamprac/logreg.dart';
import 'package:estreamprac/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// ...

// await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
// );

//import 'home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
   const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // Replace MaterialApp with GetMaterialApp
      debugShowCheckedModeBanner: false,
      title: 'web test app',
      initialRoute: '/', // Set the initial route
      getPages: [
        GetPage(
          name: '/',
          page: () => const MyHomepage(),
        ), // Define the home page route
        GetPage(
          name: '/logreg',
          page: () => const LogReg(),
        ), // Define the LogReg page route
        GetPage(
          name: '/login_screen',
          page: () => LoginScreen(
            onTap: () {},
          ),
        ),
        GetPage(
          name: '/register_screen',
          page: () => RegisterScreen(
            onTap: () {},
          ),
        ),
        GetPage(
          name: '/auth_screen',
          page: () => const AuthScreen(),
        ),
        // GetPage(
        //   name: '/auth_screen',
        //   page: () => VerifyEmailScreen(user: currentUser,),
        // ),
      ],
    );
  }
}
