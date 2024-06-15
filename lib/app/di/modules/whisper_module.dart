import 'package:path/path.dart' as path;
import "package:whisper_dart/whisper_dart.dart";
import 'package:whisper_offline/core/services/asset_manager.dart';
import 'package:whisper_offline/core/services/whisper_inferencer.dart';

import 'package:whisper_offline/data/data_source/localdb/database/app_db.dart';
import '../dependency_injection.dart';
import 'base_module.dart';

final class WhisperModule extends BaseModule {

  @override
  Future<void> register() async {
    // Whisper
    final whisperSharedLibrary = (await AssetLoader.getFileFromAssets(path.join("whisper", "libwhisper.so"))).path;
    final whisper = Whisper(whisperLib: whisperSharedLibrary);
    locator.registerLazySingleton<Whisper>(() => whisper);
    // WhisperInferencer
    locator.registerLazySingleton<WhisperInferencer>(() => WhisperInferencer(model: locator<Whisper>()));
  }

}