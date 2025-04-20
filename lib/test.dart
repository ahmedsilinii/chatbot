import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
 import 'dart:convert';
import 'package:http/http.dart' as http;

class DebugScreen extends StatelessWidget {
  const DebugScreen({super.key});

 
Future<void> listAvailableModels() async {
  final apiKey = dotenv.env['API_KEY'];
  if (apiKey == null || apiKey.isEmpty) {
    print('Error: API_KEY is missing in the .env file');
    return;
  }

  final url = Uri.parse('https://generativelanguage.googleapis.com/v1beta/models?key=$apiKey');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    final models = data['models'] as List;
    for (var model in models) {
      print('Model: ${model['name']}, Supported Methods: ${model['supportedMethods']}');
    }
  } else {
    print('Error: Failed to fetch models. Status code: ${response.statusCode}');
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Debug Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: listAvailableModels,
          child: const Text('List Available Models'),
        ),
      ),
    );
  }
}