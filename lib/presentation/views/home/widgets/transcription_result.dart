import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:whisper_offline/presentation/providers/home_provider.dart';

class TranscriptionResult extends StatelessWidget{

  const TranscriptionResult({super.key});

  @override
  Widget build(BuildContext context) {
    final result = context.select<HomeProvider, String?>((provider) => provider.transcription);
    final state = context.select<HomeProvider, TranscriptionState>((provider) => provider.transcriptionState);

    if (state==TranscriptionState.transcribing){
      return const Center(
          child: CircularProgressIndicator()
      );
    }

    if (state==TranscriptionState.modelDownloading){
      return const SizedBox.shrink();
    }

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Text(result.toString()),
        )
      )
    );
  }

}
