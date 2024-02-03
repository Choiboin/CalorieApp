import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  _RegisterScreenState createState() => _RegisterScreenState();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class _RegisterScreenState {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Widget bsuild(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'Enter your email',
              ),
              keyboardType:
                  TextInputType.emailAddress, // Optimized for email input
            ),
            SizedBox(height: 16.0), // Add spacing between fields
            TextFormField(
              controller: _passwordController,
              obscureText: true, // Hide password input
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Enter your password',
              ),
            ),
            // Add more fields or buttons as needed
          ],
        ),
      ),
    );
  }
}
