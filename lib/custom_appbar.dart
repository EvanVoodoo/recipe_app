import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final double barFactor;
  final String title;
  String? imgSrc;

  CustomAppBar({Key? key, required this.title, this.imgSrc, required this.barFactor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      floating: false,
      snap: false,
      expandedHeight: MediaQuery.of(context).size.height / barFactor,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(title,
            style: const TextStyle(
              fontWeight: FontWeight.bold
            )),
        background: Opacity(
          opacity: 1.0,
          child: imgSrc != null ? Image.network(
            imgSrc!,
            fit: BoxFit.cover,
          ) : null,
        ),
      ),
    );
  }
}
