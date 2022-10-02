import 'package:flutter/material.dart';
import 'package:warframe_info/screens/change_details_screen.dart';

import '../custom_animations.dart';
import '../custom_appbar.dart';
import '../recipe.dart';

List<Recipe> recipeList = <Recipe>[];

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String appBarImg =
      "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/homemade-bread-horizontal-1547759080.jpg?crop=0.671xw:1.00xh;0.0801xw,0&resize=640:*";

  void _addRecipe() async {
    final value = await Navigator.of(context).push(createRoute(ChangeDetailsScreen(list: recipeList)));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            CustomAppBar(
              title: "Recipes",
              imgSrc: appBarImg,
              barFactor: 4.0,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: recipeList.length,
                (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: index.isOdd ? Colors.white10 : Colors.white,
                      ),
                      height: 50,
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Recipe(name: recipeList[index].name, imgSrc: recipeList[index].imgSrc)),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButton: Align(
          alignment: Alignment.bottomRight,
          child: FloatingActionButton(
            onPressed: () {
              _addRecipe();
            },
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
