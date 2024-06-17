import 'dart:io';
import 'package:whisper_offline/core/services/whisper_downloader.dart';
import 'package:whisper_offline/core/services/whisper_inferencer.dart';

import '../dependency_injection.dart';
import 'base_module.dart';

final class WhisperModule extends BaseModule {

  @override
  Future<void> register() async {
    // Model Downloader
    final httpClient = HttpClient();
    sl.registerLazySingleton<WhisperDownloader>(() => WhisperDownloader(httpClient: httpClient));
    // Inferencer
    final whisperInferencer = WhisperInferencer();
    await whisperInferencer.init();
    sl.registerLazySingleton<WhisperInferencer>(() => whisperInferencer);
  }

}