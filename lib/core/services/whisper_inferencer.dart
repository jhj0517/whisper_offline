import "dart:io";
import "package:flutter/material.dart";
import "package:path_provider/path_provider.dart";
import 'package:flutter_ffmpeg/flutter_ffmpeg.dart';
import 'package:whisper_flutter_new/whisper_flutter_new.dart';
import 'package:path/path.dart' as path;

class WhisperInferencer{

  WhisperInferencer({
    this.modelType,
    this.modelDir,
  });

  final defaultModel = WhisperModel.base;
  final FlutterFFmpeg ffmpeg = FlutterFFmpeg();
  final availableModels = WhisperModel.values.map((model) => model.modelName).toList();
  String? modelDir;
  WhisperModel? modelType;
  Whisper? model;

  Future<void> init() async {
    if (modelDir==null){
      final tempDir = await getTemporaryDirectory();
      modelDir = path.join(tempDir.path, "whisper_offline", "models");
    }

    modelType ??= defaultModel;

    _initModel(newModelType: modelType!);
  }

  Future<String> transcribe({
    required String filePath,
    required WhisperModel modelType,
    bool isTranslate=false,
    bool isNoTimestamps=false,
  }) async {
    final startTime = DateTime.now();
    _initModel(newModelType: modelType);
    
    final preprocessedAudio = await _preProcessAudio(filePath: filePath);
    if (preprocessedAudio==null){
      throw("Error pre-process input File");
    }

    final WhisperTranscribeResponse transcription = await model!.transcribe(
      transcribeRequest: TranscribeRequest(
        audio: preprocessedAudio,
        isTranslate: false,
        isNoTimestamps: false,
        splitOnWord: false,
        isVerbose: true,
        diarize: false
      ),
    );
    final endTime = DateTime.now();
    final elapsedTime = endTime.difference(startTime).inMilliseconds;

    return "${transcription.toJson()}\n\nTook $elapsedTime ms.";
  }

  void _initModel({
    required WhisperModel newModelType,
  }) {
    if (newModelType != modelType || model == null){
      model = Whisper(
        model: newModelType,
        modelDir: modelDir!,
      );
      modelType = newModelType;
    }
  }

  Future<String?> _preProcessAudio({
    required String filePath,
  }) async {
    String tempDir = (await getTemporaryDirectory()).path;
    tempDir = path.join(tempDir, "whisper_offline");
    if (!(await Directory(tempDir).exists())) {
      await Directory(tempDir).create(recursive: true);
    }

    final tempFilePath = path.join(tempDir, "preprocessed_temp.wav");

    try {
      int result = await ffmpeg.execute(
          '-y -i "$filePath" -ar 16000 -ac 1 -c:a pcm_s16le "$tempFilePath"'
      );

      if (result == 0) {
        debugPrint('Conversion successful');
      } else {
        debugPrint('Error during conversion: error code is $result');
      }

      return tempFilePath;
    } catch (e) {
      debugPrint('Error: $e');
      return null;
    }
  }
}