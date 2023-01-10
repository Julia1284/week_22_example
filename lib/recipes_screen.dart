import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

const String apiKey = '7279a320eab944b8aff178700a97ba02';

class RecipesScreen extends StatefulWidget {
  const RecipesScreen({Key? key}) : super(key: key);

  @override
  State<RecipesScreen> createState() => _RecipesScreenState();
}

class _RecipesScreenState extends State<RecipesScreen> {
  var data = <String>[];

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipes'),
      ),
      body: ListView.builder(
        itemBuilder: (_, i) => Image.network(data[i]),
        itemCount: data.length,
      ),
    );
  }

  Future<void> _fetchData() async {
    const url =
        'https://api.spoonacular.com/recipes/complexSearch?apiKey=$apiKey';
    final request = Uri.parse(url);
    var response = await http.get(request);
    print('Hello');
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    final result = jsonDecode(response.body)['results'] as List<dynamic>;
    setState(() {
      data = result.map((e) => e['image'].toString()).toList();
    });
  }
}
