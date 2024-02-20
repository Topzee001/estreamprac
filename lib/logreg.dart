import 'package:estreamprac/components/my_button.dart';
import 'package:estreamprac/screens/auth_screen.dart';
//import 'package:estreamprac/screens/login_screen.dart';
import 'package:estreamprac/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogReg extends StatelessWidget {
  const LogReg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey.shade100,
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
              )),
        ),
        //elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Welcome back you've been missed",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            MyButton(
              text: 'Log in',
              onTap: () {
                Get.to(
                  () => AuthScreen(),
                  transition: Transition.upToDown,
                  duration: Duration(seconds: 1),
                );
              },
            ),
            const SizedBox(height: 20),
            MyButton(
              text: 'Register',
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => RegisterScreen()),
                // );
                Get.to(
                  () => RegisterScreen(
                    onTap: () {},
                  ),
                  transition: Transition.downToUp,
                  duration: const Duration(seconds: 1),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
