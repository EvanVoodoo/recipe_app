import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:warframe_info/custom_appbar.dart';
import 'package:warframe_info/custom_palette.dart';
import 'package:warframe_info/instructions.dart';

import '../recipe.dart';
import './home_screen.dart';

class ChangeDetailsScreen extends StatefulWidget {
  List<Recipe> list = <Recipe>[];

  ChangeDetailsScreen({Key? key, required this.list}) : super(key: key);

  @override
  State<ChangeDetailsScreen> createState() => _ChangeDetailsScreenState();
}

class _ChangeDetailsScreenState extends State<ChangeDetailsScreen> {
  String? recipeName;
  Instructions instructions = Instructions();
  Image img = Image.asset(
    "lib/images/blank_img.jpg",
    fit: BoxFit.cover,
  );

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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 12.0),
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
                                  recipeName = value;
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
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: img,
                                  ),
                                  ElevatedButton(
                                    onPressed: () async {
                                      FilePickerResult? result =
                                          await FilePicker.platform.pickFiles(
                                        type: FileType.custom,
                                        allowedExtensions: ["jpg", "png"],
                                      );
                                      if (result != null) {
                                        img = Image.file(
                                          File(result.files.single.path
                                              .toString()),
                                          fit: BoxFit.cover,
                                        );
                                        setState(() {});
                                      }
                                    },
                                    style: ButtonStyle(
                                      overlayColor:
                                          MaterialStateProperty.all<Color>(
                                              ColorPalette().red),
                                    ),
                                    child: const Text("Select Image"),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Please enter the recipe steps"),
                                ...instructions.steps.map((e) {
                                  return e;
                                }).toList(),
                                Padding(
                                  padding: const EdgeInsets.only(top: 12.0),
                                  child: SizedBox(
                                    width: 150,
                                    child: ButtonBar(
                                      alignment: MainAxisAlignment.spaceBetween,
                                      buttonPadding: EdgeInsets.zero,
                                      children: [
                                        Ink(
                                            decoration: ShapeDecoration(
                                              color: ColorPalette().amber,
                                              shape: const CircleBorder(),
                                            ),
                                            child: IconButton(
                                              onPressed: () {
                                                instructions.addStep();
                                                setState(() {});
                                              },
                                              padding: EdgeInsets.zero,
                                              splashRadius: 24,
                                              icon: const Icon(Icons.add),
                                              tooltip: "Adds a new step",
                                            )),
                                        Ink(
                                          decoration: ShapeDecoration(
                                            color: ColorPalette().amber,
                                            shape: const CircleBorder(),
                                          ),
                                          child: IconButton(
                                            onPressed: () {
                                              instructions.removeStep();
                                              setState(() {});
                                            },
                                            padding: EdgeInsets.zero,
                                            splashRadius: 24,
                                            icon: const Icon(Icons.remove),
                                            tooltip: "Removes the newest step",
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 12.0),
                          child: Divider(
                            thickness: 1.0,
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  recipeList.add(Recipe(
                                    name: recipeName ?? "",
                                    instructions: instructions,
                                    img: img,
                                  ));
                                  Navigator.of(context).pop();
                                },
                                style: ButtonStyle(
                                  overlayColor:
                                      MaterialStateProperty.all<Color>(
                                          ColorPalette().red),
                                ),
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
