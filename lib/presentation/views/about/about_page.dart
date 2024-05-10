import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../widgets/common/common.dart';


class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {

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
        appBar: NormalAppBar(title: Intl.message("about"), enableBackButton: true),
        body: Center(
          child: Text("about"),
        )
    );
  }
}