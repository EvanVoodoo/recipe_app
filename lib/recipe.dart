import 'package:flutter/material.dart';

import 'custom_animations.dart';
import 'custom_appbar.dart';

class Ingredient {
  final String name;
  final String amount;

  Ingredient({
    required this.name,
    required this.amount,
  });

  @override
  String toString() {
    return "$amount of $name";
  }
}

class Recipe extends StatefulWidget {
  final String name;
  final Image img;
  final String instructions =
      "1. Get materials\n2. Get ingredients\n3. ???\n4. Profit\n5. Profit\n6. Profit\n7. Profit\n8. Profit\n9. Profit\n10. Profit\n11. Profit\n12. Profit\n13. Profit\n14. Profit\n15. Profit\n16. Profit\n17. Profit\n8. Profit\n9. Profit\n10. Profit\n11. Profit\n12. Profit\n13. Profit\n14. Profit\n15. Profit\n16. Profit\n17. Profit\n8. Profit\n9. Profit\n10. Profit\n11. Profit\n12. Profit\n13. Profit\n14. Profit\n15. Profit\n16. Profit\n17. Profit";
  final List<Ingredient> ingredients = [
    Ingredient(name: "Tomatoes", amount: "12"),
    Ingredient(name: "Cheese", amount: "4"),
    Ingredient(name: "Bread", amount: "1"),
  ];
  final List<String> materials = [
    "Twelve pots",
    "11 pans",
    "1 spork",
  ];

  Recipe({
    super.key,
    required this.name,
    required this.img,
  });

  @override
  State<Recipe> createState() => _RecipeState();
}

class _RecipeState extends State<Recipe> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).push(createRoute(RecipeDetailsScreen(
          recipe: widget,
        )));
      },
      child: Row(
        children: [
          SizedBox(
            width: 100.0,
            height: 100.0,
            child: widget.img,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                "${widget.name} Recipe",
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RecipeDetailsScreen extends StatelessWidget {
  final Recipe recipe;

  const RecipeDetailsScreen({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            CustomAppBar(
              title: recipe.name,
              img: recipe.img,
              barFactor: 2.0,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: 1,
                (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(12.0),
                                decoration: BoxDecoration(
                                  color: Colors.amberAccent,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Materials",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(bottom: 4.0),
                                    ),
                                    ...recipe.materials.map((e) {
                                      return Text("\u2022 $e");
                                    }),
                                  ],
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(bottom: 12.0),
                              ),
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(12.0),
                                decoration: BoxDecoration(
                                  color: Colors.amberAccent,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Ingredients",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(bottom: 4.0),
                                    ),
                                    ...recipe.ingredients.map((e) {
                                      return Text("\u2022 ${e.toString()}");
                                    }),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 12.0),
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(12.0),
                                decoration: BoxDecoration(
                                  color: Colors.amberAccent,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "How to Cook:",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(bottom: 4.0),
                                    ),
                                    Text(recipe.instructions),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
