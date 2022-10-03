import 'dart:io';

import 'package:flutter/material.dart';

import 'custom_animations.dart';
import 'custom_appbar.dart';

class Recipe extends StatefulWidget {
  final String name;
  final File img;
  final String instructions = "";

  const Recipe({
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
          title: widget.name,
          img: widget.img,
        )));
      },
      child: Row(
        children: [
          SizedBox(
            width: 100.0,
            height: 100.0,
            child: Image.file(widget.img),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                widget.name,
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
  final String title;
  final File img;

  const RecipeDetailsScreen({Key? key, required this.title, required this.img})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            CustomAppBar(
              title: title,
              img: img,
              barFactor: 2.0,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: 12,
                (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: index.isOdd ? Colors.white12 : Colors.white,
                      ),
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
