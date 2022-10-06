import 'package:flutter/material.dart';

class Instructions extends StatelessWidget {
  List<RecipeStep> steps = [];
  List<Ingredient> ingredients = [];
  List<String> materials = [];

  Instructions({Key? key}) : super(key: key);

  void addStep() {
    steps.add(RecipeStep(number: steps.length + 1,));
  }

  void removeStep() {
    steps.removeLast();
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    String res = "";
    for (int i = 0; i < steps.length - 1; i++) {
      res += "${steps[i].toString()}\n";
    }
    res += steps[steps.length-1].toString();
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class RecipeStep extends StatelessWidget {
  String? text;
  int number;

  RecipeStep({super.key, this.text, required this.number});

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return "$number. $text";
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(width: 100, child: Text("Step $number:")),
        Flexible(
          child: SizedBox(
            width: MediaQuery.of(context).size.width - 150,
            child: TextField(
              onChanged: (String? value) {
                text = value!;
              },
            ),
          ),
        ),
      ],
    );
  }
}

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
