import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:calorieapp/pages/chatgpt.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  Map<String, double> foodData = {};
  final TextEditingController _foodController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadCSVs(); // Load CSVs immediately
  }

  void _loadCSVs() async {
    await _loadCSV("assets/3.csv");
    await _loadCSV("assets/4.csv");
  }

  Future<void> _loadCSV(String assetPath) async {
    final _rawData = await rootBundle.loadString(assetPath);
    List<List<dynamic>> _listData = CsvToListConverter().convert(_rawData);

    // Assuming the first row contains column titles, skip it
    if (_listData.isNotEmpty) {
      _listData = _listData.skip(1).toList();
    }

    foodData.addAll(Map.fromIterable(_listData,
        key: (element) =>
            element[0].toLowerCase(), // Convert food names to lowercase
        value: (element) =>
            double.parse(element[1]))); // Parse calories as doubles
  }

  String _calories = 'Enter a food name'; // Initialize _calories

  void _findCalories() {
    final foodName = _foodController.text.toLowerCase();
    final calories = foodData[foodName];
    setState(() {
      _calories = calories?.toStringAsFixed(2) ?? 'Food not found';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        title: Text("Chatscreen"),
      ),
      body: Column(
        children: [
          TextField(
            controller: _foodController,
            decoration: InputDecoration(hintText: 'Enter food name'),
          ),
          ElevatedButton(
            onPressed: _findCalories,
            child: Text('Find Calories'),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              child: Text("Go to ChatGpt"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => chatgpt()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
