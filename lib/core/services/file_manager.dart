import 'package:file_picker/file_picker.dart';

class FileManager{

  static Future<String?> pickAudioFile() async {
    final audioExtensions = [
      'mp3', 'wav', 'aac', 'flac', 'alac', 'ogg', 'm4a', 'wma', 'aiff'
    ];
    final videoExtensions = [
      'mp4', 'avi', 'mov', 'wmv', 'flv', 'mkv', 'webm', 'mpeg', '3gp'
    ];
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: [...audioExtensions, ...videoExtensions],
    );

    if (result != null && result.files.single.path != null) {
      return result.files.single.path;
    }
    return null;
  }

}