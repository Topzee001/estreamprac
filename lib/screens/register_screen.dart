import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: Text('Register screen'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  // color: Colors.lightBlueAccent,
                ),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'input username',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                //color: Colors.lightBlueAccent,
              ),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'input password',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.lightBlueAccent,
                ),
                child: Center(
                  child: Text(
                    'Register',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
