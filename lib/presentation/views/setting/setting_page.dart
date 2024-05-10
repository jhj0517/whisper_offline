import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../widgets/common/common.dart';


class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {

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
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: NormalAppBar(title: Intl.message("appTitle"), enableBackButton: true),
        body: Center(
          child: Text("setting"),
        )
    );
  }
}