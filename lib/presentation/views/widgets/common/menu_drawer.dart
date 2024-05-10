import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  MenuDrawer({
    super.key,
  });

  final List<String> _menuItems = <String>[
    'About': ,
    'Contact',
    'Settings',
    'Sign Out',
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: _menuItems
            .map((item) => ListTile(
          onTap: () {

          },
          title: Text(item),
        ))
            .toList(),
      ),
    );
  }
}