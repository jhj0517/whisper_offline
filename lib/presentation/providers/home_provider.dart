import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:whisper_flutter_new/download_model.dart';
import 'package:whisper_offline/core/services/file_manager.dart';
import 'package:whisper_offline/core/services/whisper_downloader.dart';
import 'package:whisper_offline/core/services/whisper_inferencer.dart';

enum TranscriptionState{
  transcribing,
  modelDownloading,
  done
}

class HomeProvider extends ChangeNotifier {

  HomeProvider({
    required this.modelDownloader,
    required this.whisperInf
  });

  final WhisperDownloader modelDownloader;
  final WhisperInferencer whisperInf;

  String? _audioPath;
  String? get audioPath => _audioPath;

  WhisperModel _selectedModel=WhisperModel.tiny;
  WhisperModel get selectedModel => _selectedModel;

  String? _transcription;
  String? get transcription => _transcription;

  TranscriptionState _transcriptionState=TranscriptionState.done;
  TranscriptionState get transcriptionState => _transcriptionState;

  double? _downloadProgress;
  double? get downloadProgress => _downloadProgress;

  Future<void> transcribe() async {

    if (audioPath==null){
      throw("Error : No audio file");
    }

    if (!await modelDownloader.isModelExist(modelType: selectedModel)){
      _setTranscriptionState(TranscriptionState.modelDownloading);
      await modelDownloader.downloadModel(
        modelType: selectedModel,
        onProgress:  (progress) => _onDownloadProgress(progress)
      );
    }

    _setTranscriptionState(TranscriptionState.transcribing);
    _transcription = await whisperInf.transcribe(
      filePath: audioPath!,
      modelType: selectedModel
    );
    _setTranscriptionState(TranscriptionState.done);
  }

  Future<void> pickAudioFile() async {
    final String? pickedFile = await FileManager.pickAudioFile();
    if (pickedFile==null){
      throw("Error : Failed to pick audio File");
    }
    _audioPath = pickedFile;
    notifyListeners();
  }

  void setModel(WhisperModel newModel){
    _selectedModel = newModel;
    notifyListeners();
  }

  void _setTranscriptionState(TranscriptionState state){
    _transcriptionState = state;
    notifyListeners();
  }

  void _onDownloadProgress(double progress){
    _downloadProgress = progress;
    notifyListeners();
  }
}