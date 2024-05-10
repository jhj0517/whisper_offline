import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../views.dart';

class MenuDrawer extends StatelessWidget {
  MenuDrawer({
    super.key,
  });

  final _menuItems = {
    Intl.message("about"): const AboutPage(),
    Intl.message("settings"): const SettingsPage()
  };

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: _menuItems.keys.map((item) =>
          ListTile(
            title: Text(item),
            onTap: () {
              Scaffold.of(context).openEndDrawer();
              _navigateTo(context, _menuItems[item]!);
            },
          ),
        ).toList(),
      ),
    );
  }

  void _navigateTo(BuildContext context, StatefulWidget page){
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }

}