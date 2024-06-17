import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:whisper_offline/presentation/providers/home_provider.dart';

class AudioFileDisplay extends StatelessWidget{

  const AudioFileDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    final audioPath = context.select<HomeProvider, String?>((provider) => provider.audioPath);
    if (audioPath==null){
      return const Text("Audio File Path : null");
    }
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Text("Audio File Path : $audioPath"),
    );
  }

}
