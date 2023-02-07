import 'package:complex_animations/pages/main_screen.dart';
import 'package:complex_animations/widgets/menus/zoom_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class ZoomDrawerScreen extends StatefulWidget {
  const ZoomDrawerScreen({Key? key}) : super(key: key);

  @override
  State<ZoomDrawerScreen> createState() => _ZoomDrawerScreenState();
}

class _ZoomDrawerScreenState extends State<ZoomDrawerScreen> {
  final _zoomDrawerController = ZoomDrawerController();

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      controller: _zoomDrawerController,
      menuBackgroundColor: Colors.blue[700]!,
      menuScreenOverlayColor: Colors.purple[600],
      menuScreen: ZoomMenu(
        setIndex: (value) {},
      ),
      mainScreen: const MainScreen(),
      showShadow: true,
    );
  }
}

Widget setScreen() {
  return Container();
}
