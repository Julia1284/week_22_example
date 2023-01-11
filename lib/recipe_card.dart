import 'package:flutter/material.dart';
import 'package:week_22_example/recipe.dart';

class RecipeCard extends StatelessWidget {
  final void Function()? onTap;
  final Recipe recipe;
  const RecipeCard({
    Key? key,
    this.onTap,
    required this.recipe,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Image.network(recipe.image),
          Text(recipe.title),
        ],
      ),
    );
  }
}
