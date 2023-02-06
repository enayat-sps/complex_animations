import 'package:flutter/material.dart';

AppBar appBarWithNoElevation(String title, Color backgroundColor,
    bool centerTitle, AnimatedBuilder animatedBuilder) {
  return AppBar(
    elevation: 0,
    backgroundColor: backgroundColor,
    title: Text(title),
    centerTitle: centerTitle,
    actions: [animatedBuilder],
  );
}
