import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../widgets/common/common.dart';


class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> init() async{
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: NormalAppBar(title: Intl.message("settings"), enableBackButton: true),
        body: Center(
          child: Text("setting page"),
        )
    );
  }
}