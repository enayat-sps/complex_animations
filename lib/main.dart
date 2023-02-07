import 'package:complex_animations/widgets/drawers/zoom_drawer.dart';

import 'widgets/drawers/custom_drawer.dart';
import 'widgets/drawers/custom_drawer2.dart';
import 'package:flutter/material.dart';

import '../pages/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    bool flip = true;
    AppBar appBar = flip
        ? AppBar()
        : AppBar(
            leading: Builder(
              builder: (context) {
                return IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () => CustomDrawer.of(context)?.open(),
                );
              },
            ),
            title: const Text('Complex Animations'),
          );
    Widget child = HomePage(appBar: appBar);
    if (flip) {
      child = CustomFlipDrawer(key: UniqueKey(), child: child);
    } else {
      child = CustomDrawer(child: child);
    }
    return MaterialApp(
      title: 'Complex Animations',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const ZoomDrawerScreen(),
    );
  }
}
