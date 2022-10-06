import 'package:flutter/material.dart';
import 'package:warframe_info/custom_palette.dart';
import 'package:warframe_info/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Web App',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        splashColor: ColorPalette().red,
        highlightColor: Colors.transparent,
      ),
      home: const InfoHomePage(),
    );
  }
}

class InfoHomePage extends StatefulWidget {
  const InfoHomePage({Key? key}) : super(key: key);

  @override
  State<InfoHomePage> createState() => _InfoHomePageState();
}

class _InfoHomePageState extends State<InfoHomePage> {
  @override
  Widget build(BuildContext context) {
    return const HomeScreen();
  }
}
