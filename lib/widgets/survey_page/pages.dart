import 'package:complex_animations/widgets/survey_page/ui_items.dart';
import 'package:flutter/material.dart';

import 'option_item.dart';

class SurveyPages extends StatefulWidget {
  const SurveyPages(
      {Key? key,
      required this.number,
      required this.question,
      required this.answers,
      required this.onOptionSelected})
      : super(key: key);
  final int number;
  final String question;
  final List<String> answers;
  final VoidCallback onOptionSelected;

  @override
  State<SurveyPages> createState() => _SurveyPagesState();
}

class _SurveyPagesState extends State<SurveyPages>
    with SingleTickerProviderStateMixin {
  late List<GlobalKey<_ItemFaderState>> keys;
  int _selectedOptionKeyIndex = 0;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    keys = List.generate(
      2 + widget.answers.length,
      (_) => GlobalKey<_ItemFaderState>(),
    );
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    onInit();
  }

  Future<void> animateDot(Offset startOffset) async {
    OverlayEntry overlayEntry = OverlayEntry(
      builder: (context) {
        double minTop = MediaQuery.of(context).padding.top + 60;
        return AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return Positioned(
              left: 26.0 + 32 + 8,
              top: minTop +
                  (startOffset.dy - minTop) * (1 - _animationController.value),
              child: child!,
            );
          },
          child: dot(true),
        );
      },
    );
    Overlay.of(context).insert(overlayEntry);
    await _animationController.forward(from: 0);
    overlayEntry.remove();
  }

  void onTap(int keyIndex, Offset offset) async {
    for (GlobalKey<_ItemFaderState> key in keys) {
      await Future.delayed(const Duration(milliseconds: 40));
      key.currentState?.hide();
      if (keys.indexOf(key) == keyIndex) {
        setState(() => _selectedOptionKeyIndex = keyIndex);
        animateDot(offset).then((_) => widget.onOptionSelected());
      }
    }
  }

  void onInit() async {
    for (GlobalKey<_ItemFaderState> key in keys) {
      await Future.delayed(const Duration(milliseconds: 40));
      key.currentState?.show();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 32),
        ItemFader(key: keys[0], child: stepNumber(widget.number)),
        ItemFader(
          key: keys[1],
          child: stepQuestion(widget.question),
        ),
        const Spacer(),
        ...widget.answers.map((String answer) {
          int answerIndex = widget.answers.indexOf(answer);
          int keyIndex = answerIndex + 2;
          return ItemFader(
            key: keys[keyIndex],
            child: OptionItem(
              name: answer,
              onTap: (offset) => onTap(keyIndex, offset),
              showDot: _selectedOptionKeyIndex != keyIndex,
            ),
          );
        }),
        const SizedBox(height: 64),
      ],
    );
  }
}

class ItemFader extends StatefulWidget {
  const ItemFader({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  State<ItemFader> createState() => _ItemFaderState();
}

class _ItemFaderState extends State<ItemFader>
    with SingleTickerProviderStateMixin {
  int position = 1;
  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void show() {
    setState(() => position = 1);
    _animationController.forward();
  }

  void hide() {
    setState(() => position = -1);
    _animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, 64 * position * (1 - _animation.value) as double),
          child: Opacity(
            opacity: _animation.value,
            child: child,
          ),
        );
      },
      child: widget.child,
    );
  }
}
