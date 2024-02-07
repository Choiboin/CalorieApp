import 'dart:io';
import 'package:flutter/material.dart';
import 'package:csv/csv.dart';
import 'package:path_provider/path_provider.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  Map<String, double> foodData = {};
  String _calories = 'Enter a food name';
  final TextEditingController _foodController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _readFoodData();
  }

  Future<void> _readFoodData() async {
    // Assuming separate files for food names and calories
    final directory = await getApplicationDocumentsDirectory();
    final foodNamesFile =
        File('${directory.path}/epi_r.csv'); // Remove extra ".csv"
    final calorieDataFile = File('${directory.path}/nutrients_csvfile.csv');

    final foodNames = await _readCsvFile(foodNamesFile);
    final calories = await _readCsvFile(calorieDataFile);

    // Ensure both files have data before combining
    if (foodNames.isEmpty || calories.isEmpty) {
      _calories = 'Error: Missing data in CSV files';
      return;
    }

    foodData = Map.fromIterables(
      foodNames,
      calories as Iterable<double>,
    );
  }

  Future<List<String>> _readCsvFile(File file) async {
    if (!await file.exists()) {
      _calories = 'Error: CSV file not found';
      return []; // Return an empty list for consistency
    }

    final lines = await file.readAsLines();
    final parser = const CsvToListConverter();
    final parsedData = parser.convert(lines.join('\n'));

    // Explicitly create a list of strings, assuming first column contains names
    return parsedData.map((row) => row[0] as String).toList();
  }

  void _findCalories() {
    final foodName = _foodController.text.toLowerCase();
    setState(() {
      _calories = foodData[foodName]?.toStringAsFixed(2) ?? 'Food not found';
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
          Text(_calories),
        ],
      ),
    );
  }
}
