import 'package:path/path.dart' as path;
import "package:whisper_dart/whisper_dart.dart";
import 'package:whisper_offline/core/services/file_manager.dart';
import 'package:whisper_offline/core/services/whisper_inferencer.dart';

import '../dependency_injection.dart';
import 'base_module.dart';

final class WhisperModule extends BaseModule {

  @override
  Future<void> register() async {
    // Whisper
    final whisperSharedLibrary = (await FileManager.getFileFromAssets(path.join("whisper", "libwhisper.so"))).path;
    final whisper = Whisper(whisperLib: whisperSharedLibrary);
    locator.registerLazySingleton<Whisper>(() => whisper);
    // WhisperInferencer
    locator.registerLazySingleton<WhisperInferencer>(() => WhisperInferencer(model: locator<Whisper>()));
  }

}