import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:week_22_example/home_store.dart';
import 'package:week_22_example/recipe.dart';
import 'package:week_22_example/recipe_card.dart';
import 'package:week_22_example/recipe_service.dart';

class RecipesScreen extends StatefulWidget {
  const RecipesScreen({Key? key}) : super(key: key);

  @override
  State<RecipesScreen> createState() => _RecipesScreenState();
}

class _RecipesScreenState extends State<RecipesScreen> {
  final _viewModel = HomeStore();

  @override
  void initState() {
    super.initState();
    _viewModel.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Recipes'),
        ),
        body: Observer(builder: (_) {
          final data = _viewModel.value;
          return ListView.builder(
            itemBuilder: (_, i) => RecipeCard(
              recipe: data[i],
            ),
            itemCount: data.length,
          );
        }));
  }
}
