import 'package:get_it/get_it.dart';
import 'package:whisper_offline/app/di/modules/whisper_module.dart';

import 'modules/local_db_module.dart';
import 'modules/repository_module.dart';

final sl = GetIt.I;

final class DependencyInjection{

  static Future<void> register() async {
    for (final module in [
      LocalDBModule(),
      RepositoryModule(),
      WhisperModule()
    ]) {
      await module.register();
    }
  }

}