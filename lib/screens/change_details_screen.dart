import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:warframe_info/custom_appbar.dart';

import '../recipe.dart';
import './home_screen.dart';

class ChangeDetailsScreen extends StatelessWidget {
  List<Recipe> list = <Recipe>[];

  ChangeDetailsScreen({Key? key, required this.list}) : super(key: key);

  String? recipeName;
  String? recipeImg = "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/homemade-bread-horizontal-1547759080.jpg?crop=0.671xw:1.00xh;0.0801xw,0&resize=640:*";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            CustomAppBar(
              title: "Add New Recipe",
              barFactor: 4.0,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: 1,
                (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(right: 48.0),
                              child: Text("Please enter the recipe name:"),
                            ),
                            Expanded(
                              child: TextField(
                                onChanged: (String? value) {
                                  recipeName = value ?? "";
                                },
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(right: 48.0),
                              child: Text("Please enter the recipe picture:"),
                            ),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () async {
                                  // TODO: Implement adding images through FilePicker
                                  final result = await FilePicker.platform.pickFiles();
                                },
                                child: const Text("Pick File"),
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 24.0),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  recipeList.add(Recipe(
                                    name: recipeName!,
                                    imgSrc: recipeImg!,
                                  ));
                                  Navigator.of(context).pop();
                                },
                                child: const Text("Add recipe!"),
                              ),
                            )
                          ],
                        )
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
