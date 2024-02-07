import 'package:flutter/material.dart';
import 'package:calorieapp/data/nlp.dart';

class chatscreen extends StatelessWidget {
  const chatscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        title: Text("Chatscreen"),
      ),
    );
  }
}
