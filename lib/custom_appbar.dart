import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final double barFactor;
  final String title;
  var img;

  CustomAppBar(
      {Key? key,
      required this.title,
      required this.barFactor,
      required this.img})
      : super(key: key);

  Widget? _imageWidget(var img) {
    if (img.runtimeType == Image) {
      return img;
    } else if (img.runtimeType == String) {
      return Image.asset(
        img,
        fit: BoxFit.cover,
      );
    } else {
      return Image.file(
        img,
        fit: BoxFit.cover,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      floating: false,
      snap: false,
      elevation: 2.0,
      expandedHeight: MediaQuery.of(context).size.height / barFactor,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.only(left: 55.0, bottom: 16.0),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        background: Opacity(
          opacity: 1.0,
          child: _imageWidget(img),
        ),
      ),
    );
  }
}

class CustomAppBarNoImg extends StatelessWidget {
  final double barFactor;
  final String title;

  const CustomAppBarNoImg({
    Key? key,
    required this.title,
    required this.barFactor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      floating: false,
      snap: false,
      elevation: 2.0,
      expandedHeight: MediaQuery.of(context).size.height / barFactor,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.only(left: 30.0, bottom: 12.0),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
