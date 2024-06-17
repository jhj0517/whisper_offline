import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whisper_flutter_new/download_model.dart';

import 'package:whisper_offline/presentation/providers/home_provider.dart';

class DownloadProgress extends StatelessWidget{

  const DownloadProgress({super.key});

  @override
  Widget build(BuildContext context) {
    final progress = context.select<HomeProvider, double?>((provider) => provider.downloadProgress);
    final selectedModel = context.select<HomeProvider, WhisperModel>((provider) => provider.selectedModel);
    if (progress==null){
      return const SizedBox.shrink();
    }

    if (progress >= 1){
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Text('Downloading "${selectedModel.modelName}" model..'),
          const SizedBox(height: 20),
          LinearProgressIndicator(value: progress),
          Text("${(progress*100).toStringAsFixed(2)}%"),
        ],
      )
    );
  }

}