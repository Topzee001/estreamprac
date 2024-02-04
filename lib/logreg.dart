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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
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
            GestureDetector(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => LoginScreen(),
                //   ),
                // );
                Get.to(
                  () => AuthScreen(),
                  transition: Transition.upToDown,
                  duration: Duration(seconds: 1),
                );
              },
              child: Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.lightBlueAccent,
                ),
                child: Center(
                  child: Text(
                    'Log in!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => RegisterScreen()),
                // );
                Get.to(
                  () => RegisterScreen(),
                  transition: Transition.downToUp,
                  duration: Duration(seconds: 1),
                );
              },
              child: Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.lightBlueAccent,
                ),
                child: Center(
                  child: Text(
                    'Register!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
