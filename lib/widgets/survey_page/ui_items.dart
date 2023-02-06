import 'package:flutter/material.dart';

import '../../config/app_colors.dart';

Widget stepNumber(int number) {
  return Padding(
    padding: const EdgeInsets.only(left: 64, right: 16),
    child: Text(
      '0$number',
      style: TextStyle(
        fontSize: 64,
        fontWeight: FontWeight.bold,
        color: Colors.white.withOpacity(0.5),
      ),
    ),
  );
}

Widget stepQuestion(String question) {
  return Padding(
    padding: const EdgeInsets.only(left: 64, right: 16),
    child: Text(
      question,
      style: const TextStyle(
        fontSize: 24,
        color: SurveyPageColors.fontColor,
      ),
    ),
  );
}

Widget dot(bool visible) {
  return Container(
    width: 12,
    height: 12,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: visible ? Colors.white : Colors.transparent,
    ),
  );
}

Widget line() {
  return Positioned(
    left: 72,
    top: 40,
    bottom: 0,
    width: 1,
    child: Container(
      color: SurveyPageColors.lineColor,
    ),
  );
}

Widget arrowIcons() {
  return Positioned(
    left: 10,
    bottom: 20,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.arrow_upward,
            color: SurveyPageColors.iconColor,
          ),
          onPressed: () {},
        ),
        Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: SurveyPageColors.btnContainerColor,
          ),
          child: IconButton(
            color: const Color.fromRGBO(120, 58, 183, 1),
            icon: const Icon(
              Icons.arrow_downward,
            ),
            onPressed: () {},
          ),
        ),
      ],
    ),
  );
}

Widget plane() {
  return const Positioned(
    left: 40,
    top: 32,
    child: RotatedBox(
      quarterTurns: 2,
      child: Icon(
        Icons.airplanemode_active,
        size: 64,
        color: SurveyPageColors.iconColor,
      ),
    ),
  );
}
