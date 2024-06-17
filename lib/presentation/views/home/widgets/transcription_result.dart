import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:whisper_offline/presentation/providers/home_provider.dart';

class TranscriptionResult extends StatelessWidget{

  const TranscriptionResult({super.key});

  @override
  Widget build(BuildContext context) {
    final result = context.select<HomeProvider, String?>((provider) => provider.transcription);
    if (result==null){
      return const Text("");
    }
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Text(result),
        )
      )
    );
  }

}
