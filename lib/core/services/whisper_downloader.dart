import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:whisper_flutter_new/whisper_flutter_new.dart';
import 'package:path/path.dart' as path;
import "package:path_provider/path_provider.dart";

const defaultDownloadHost = "https://huggingface.co/ggerganov/whisper.cpp/resolve/main";

class WhisperDownloader {

  WhisperDownloader({
   required this.httpClient
  });

  final HttpClient httpClient;

  Future<String> downloadModel({
    required WhisperModel modelType,
    String? modelDir,
    String? downloadHost,
    Function(double)? onProgress,
  }) async {
    if (downloadHost == null || downloadHost.isEmpty) {
      downloadHost = defaultDownloadHost;
    }

    if (modelDir == null || modelDir.isEmpty){
      final tempDir = await getTemporaryDirectory();
      modelDir = path.join(tempDir.path, "whisper_offline", "models");
    }

    if (!Directory(modelDir).existsSync()){
      Directory(modelDir).createSync(recursive: true);
    }

    if (await isModelExist(modelType: modelType, modelDir: modelDir)){
      return path.join(modelDir, "ggml-${modelType.modelName}.bin");
    }

    final Uri modelUri = Uri.parse(
      "$downloadHost/ggml-${modelType.modelName}.bin",
    );

    final request = await httpClient.getUrl(
      modelUri,
    );

    final response = await request.close();

    final file = File(path.join(modelDir, "ggml-${modelType.modelName}.bin"));
    final raf = file.openSync(mode: FileMode.write);

    final contentLength = response.headers.contentLength;
    int bytesRead = 0;
    await for (var chunk in response) {
      raf.writeFromSync(chunk);
      bytesRead += chunk.length;
      if (onProgress != null) {
        onProgress(bytesRead / contentLength);
      }
    }

    await raf.close();

    if (kDebugMode) {
      debugPrint("Download Down . Path = ${file.path}");
    }
    return file.path;
  }

  Future<bool> isModelExist({
    required WhisperModel modelType,
    String? modelDir,
  }) async {
    if (modelDir == null || modelDir.isEmpty){
      final tempDir = await getTemporaryDirectory();
      modelDir = path.join(tempDir.path, "whisper_offline", "models");
    }
    final modelPath = path.join(modelDir, "ggml-${modelType.modelName}.bin");
    final modelFile = File(modelPath);

    return await modelFile.exists();
  }

}