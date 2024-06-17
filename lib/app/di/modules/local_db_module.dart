import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:whisper_offline/data/data_source/localdb/database/app_db.dart';
import '../dependency_injection.dart';
import 'base_module.dart';

final class LocalDBModule extends BaseModule {

  @override
  Future<void> register() async {
    // SQLite
    sl.registerLazySingleton<AppDB>(() => AppDB());
    // SharedPreference
    sl.registerLazySingletonAsync<SharedPreferences>(() async => SharedPreferences.getInstance());
    await sl.isReady<SharedPreferences>();
    // DotEnv
    await dotenv.load(fileName: ".env");
    sl.registerLazySingleton<DotEnv>(() => dotenv);
  }

}