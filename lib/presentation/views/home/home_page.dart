import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../../providers/providers.dart';
import '../widgets/common/common.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late ThemeProvider themeProvider;
  late HomeProvider homeProvider;

  @override
  void initState() {
    themeProvider = context.read<ThemeProvider>();
    homeProvider = context.read<HomeProvider>();
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
    /**
     * Todo :
     * - Gradio & 조카소 참조한 파일 업로드 UI
     * - 파일업로드 UI "https://www.youtube.com/watch?v=A6nrkVYUDEo" 참조할 것
     * ***/

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: MenuAppBar(title: Intl.message("appTitle")),
      drawer: MenuDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 20),
          OutlinedButton(
              onPressed: () async {
              },
              child: const Text("Transcribe")
          ),
          const SizedBox(height: 20),
        ],
      )
    );
  }
}
