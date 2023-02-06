import '../config/app_colors.dart';
import 'package:flutter/material.dart';

import '../config/constants.dart';
import '../widgets/survey_page/ui_items.dart';
import '../widgets/survey_page/pages.dart';

class FlightSurveyPage extends StatefulWidget {
  const FlightSurveyPage({super.key});

  @override
  State<FlightSurveyPage> createState() => _FlightSurveyPageState();
}

class _FlightSurveyPageState extends State<FlightSurveyPage> {
  int _pageNumber = 1;

  @override
  Widget build(BuildContext context) {
    Widget page = _pageNumber == 1
        ? SurveyPages(
            key: const Key(page1Key),
            onOptionSelected: () => setState(() => _pageNumber = 2),
            question: question1,
            answers: answers1,
            number: 1,
          )
        : _pageNumber == 2
            ? SurveyPages(
                key: const Key(page2Key),
                onOptionSelected: () => setState(() => _pageNumber = 3),
                question: question2,
                answers: answers2,
                number: 2,
              )
            : SurveyPages(
                number: 3,
                question: question3,
                answers: answers3,
                onOptionSelected: () => setState(() => _pageNumber = 1),
              );
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: SurveyPageColors.backgroundDecoration,
        child: SafeArea(
          child: Stack(
            children: <Widget>[
              arrowIcons(),
              plane(),
              line(),
              Positioned.fill(
                left: 40,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  child: page,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
