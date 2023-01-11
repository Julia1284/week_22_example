import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:week_22_example/const.dart';
import 'package:week_22_example/recipe.dart';

class RecipeService {
  Future<List<Recipe>> fetchRecipes() async {
    var url = Uri.parse(
        'https://api.spoonacular.com/recipes/complexSearch?apiKey=$apiKey');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    final results = jsonDecode(response.body)['results'] as List<dynamic>;
    return results.map((obj) => Recipe.fromJson(obj)).toList();
  }
}
