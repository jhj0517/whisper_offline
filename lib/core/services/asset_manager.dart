import 'dart:io';
import 'dart:typed_data';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart';

class AssetLoader{

  static Future<File> getFileFromAssets(String filePath) async {
    final Directory tempDir = await getTemporaryDirectory();
    final String tempPath = tempDir.path;
    final String tempFilePath = path.join(tempPath, filePath);
    final file = File(tempFilePath);
    if (file.existsSync()) {
      return file;
    } else {
      final ByteData byteData = await rootBundle.load(path.join("assets", filePath));
      final ByteBuffer buffer = byteData.buffer;
      await file.create(recursive: true);
      return file.writeAsBytes(buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
    }
  }

}