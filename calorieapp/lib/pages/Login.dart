import 'package:calorieapp/pages/chatscreen.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Center(
        child: ElevatedButton(
          child: Text("Login as Guest"),
          onPressed: () {
            // navigate to chatscreen
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => chatscreen()), // MaterialPageRoute
            );
          },
        ),
      ),
    );
  }
}
