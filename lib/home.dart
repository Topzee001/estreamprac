import 'package:estreamprac/logreg.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHomepage extends StatelessWidget {
  const MyHomepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            // decoration: BoxDecoration(
            //   image: DecorationImage(
            //     image: AssetImage(
            //       'images/code1.png',
            //     ),
            //     fit: BoxFit.cover,
            //   ),
            // ),
            decoration: BoxDecoration(
              // borderRadius: BorderRadius.only(
              //   topLeft: Radius.circular(20),
              //   topRight: Radius.circular(20),
              // ),
              color: Colors.grey.shade300,
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 25, left: 15),
              child: Text(
                'Topzee\nTechnologies\nAcademy',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Colors.lightBlueAccent.shade400,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 200.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                image: DecorationImage(
                  image: AssetImage(
                    'images/code1.png',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.only(
              //     topLeft: Radius.circular(20),
              //     topRight: Radius.circular(20),
              //   ),
              //   color: Colors.grey.shade300,
              // ),
              height: double.infinity,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => LogReg(),
                      //   ),
                      // );
                      Get.to(
                        () => const LogReg(),
                        transition: Transition.rightToLeft,
                        duration: Duration(milliseconds: 500),
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
                          'Let\'s get started!',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
