import 'package:flutter/material.dart';

Widget drawerColumn() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.max,
    children: const [
      SizedBox(
        height: 100,
        width: 200,
        child: Center(
          child: Text(
            'Drawer',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      ListTile(
        leading: Icon(Icons.new_releases),
        title: Text('News'),
      ),
      ListTile(
        leading: Icon(Icons.star),
        title: Text('Favourites'),
      ),
      ListTile(
        leading: Icon(Icons.map),
        title: Text('Map'),
      ),
      ListTile(
        leading: Icon(Icons.settings),
        title: Text('Settings'),
      ),
      ListTile(
        leading: Icon(Icons.person),
        title: Text('Profile'),
      ),
    ],
  );
}
