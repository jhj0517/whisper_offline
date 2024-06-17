import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:whisper_offline/app/di/dependency_injection.dart';
import 'package:whisper_offline/core/services/whisper_inferencer.dart';
import 'package:file_picker/file_picker.dart';
import 'package:whisper_offline/presentation/views/home/widgets/download_progress.dart';
import 'package:whisper_offline/presentation/views/home/widgets/model_dropdown.dart';
import 'package:whisper_offline/presentation/views/home/widgets/transcription_result.dart';

import '../../providers/providers.dart';
import '../widgets/common/common.dart';
import 'widgets/audio_file_display.dart';

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
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: MenuAppBar(title: Intl.message("appTitle")),
      drawer: MenuDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 20),
            OutlinedButton(
                onPressed: () async => homeProvider.pickAudioFile(),
                child: const Text("Pick Audio File")
            ),
            const AudioFileDisplay(),
            const Divider(),
            const SizedBox(height: 10),
            const ModelDropdown(),
            const Divider(),
            const SizedBox(height: 10),
            OutlinedButton(
                onPressed: () async => homeProvider.transcribe(),
                child: const Text("Transcribe")
            ),
            const SizedBox(height: 10),
            const DownloadProgress(),
            const Divider(),
            const TranscriptionResult(),
          ],
        )
      )
    );
  }
}
