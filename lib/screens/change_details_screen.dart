import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:warframe_info/custom_appbar.dart';

import '../recipe.dart';
import './home_screen.dart';

class ChangeDetailsScreen extends StatelessWidget {
  List<Recipe> list = <Recipe>[];

  ChangeDetailsScreen({Key? key, required this.list}) : super(key: key);

  String? recipeName;
  Image img = Image.asset("lib/images/blank_img.jpg", fit: BoxFit.cover,);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            const CustomAppBarNoImg(
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
                                  FilePickerResult? result =
                                      await FilePicker.platform.pickFiles(
                                    type: FileType.custom,
                                    allowedExtensions: ["jpg", "png"],
                                  );
                                  if (result != null) {
                                    img = Image.file(File(
                                        result.files.single.path.toString()));
                                  }
                                },
                                child: const Text("Select Image"),
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 12.0, bottom: 12.0),
                          child: Divider(
                            thickness: 2.0,
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  recipeList.add(Recipe(
                                    name: recipeName!,
                                    // TODO: Make file default to "lib/images/blank_img.jpg" if no image is chosen
                                    img: img,
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
