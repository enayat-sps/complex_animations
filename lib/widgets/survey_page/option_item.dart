import '../survey_page/ui_items.dart';
import 'package:flutter/material.dart';

class OptionItem extends StatefulWidget {
  const OptionItem({
    Key? key,
    required this.name,
    required this.onTap,
    this.showDot = true,
  }) : super(key: key);
  final String name;
  final void Function(Offset dotOffset) onTap;
  final bool showDot;

  @override
  State<OptionItem> createState() => _OptionItemState();
}

class _OptionItemState extends State<OptionItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        RenderBox renderBox = context.findRenderObject() as RenderBox;
        Offset globalPosition = renderBox.localToGlobal(Offset.zero);
        widget.onTap(globalPosition);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          children: <Widget>[
            const SizedBox(width: 26),
            dot(widget.showDot),
            const SizedBox(width: 26),
            Expanded(
              child: Text(
                widget.name,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
              ),
            )
          ],
        ),
      ),
    );
  }
}
