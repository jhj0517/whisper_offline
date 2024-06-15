import "dart:io";
import "package:flutter/material.dart";
import "package:whisper_dart/scheme/scheme.dart";
import "package:whisper_dart/whisper_dart.dart";

class WhisperInferencer{

  WhisperInferencer({
    required this.model
  });

  Whisper model;

  void transcribe({
    required String audioPath,
    String modelPath="large-v2"
  }) async {
    Transcribe transcribeAnyAudio = await model.transcribe(
      audio: WhisperAudioconvert.convert(
        audioInput: File("./path_audio_any_format"),
        audioOutput: File("./path_audio_convert.wav"),
      ).path,
      model: "./path_model_whisper_bin",
      language: "id", // language
    );

    debugPrint("$transcribeAnyAudio");
  }
}