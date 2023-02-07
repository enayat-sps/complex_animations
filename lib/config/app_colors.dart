import 'package:flutter/material.dart';

class HomepageColors {
  static const homeBackground = Color.fromRGBO(237, 225, 209, 1.0);
}

class DrawerColors {
  static const drawerBackground = Colors.blueGrey;
}

class SurveyPageColors {
  static const backgroundDecoration = BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Color.fromRGBO(76, 61, 243, 1),
        Color.fromRGBO(120, 58, 183, 1),
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
  );
  static const iconColor = Colors.white;
  static const fontColor = Colors.white;
  static const btnContainerColor = Colors.white;
  static final lineColor = Colors.white.withOpacity(0.5);
}
