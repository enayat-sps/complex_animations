import 'package:complex_animations/config/constants.dart';
import 'package:flutter/material.dart';

import '../../models/menu_item.dart';

class ZoomMenu extends StatefulWidget {
  final ValueSetter setIndex;
  const ZoomMenu({Key? key, required this.setIndex}) : super(key: key);

  @override
  State<ZoomMenu> createState() => _ZoomMenuState();
}

class _ZoomMenuState extends State<ZoomMenu> {
  final List<MenuItem> options = [
    MenuItem(Icons.payment, homeTitle),
    MenuItem(Icons.favorite, 'Flight Survey '),
    MenuItem(Icons.notifications, 'Notification'),
    MenuItem(Icons.format_list_bulleted, 'Orders'),
    MenuItem(Icons.help, 'Help'),
  ];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[700],
      body: Theme(
        data: ThemeData(brightness: Brightness.dark),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text(homeTitle),
              onTap: () {
                setState(() {
                  index = 0;
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.airplanemode_active),
              title: const Text('Flight Survey'),
              onTap: () {
                setState(() {
                  index = 1;
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.format_list_bulleted),
              title: const Text('Orders'),
              onTap: () {
                setState(() {
                  index = 2;
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.help),
              title: const Text('Help'),
              onTap: () {
                setState(() {
                  index = 3;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
