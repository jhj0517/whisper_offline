import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../dependency_injection.dart';
import 'base_module.dart';
import 'package:whisper_offline/constants/app_constants.dart';
import 'package:whisper_offline/data/data_source/network/binance/binance_client.dart';

final class NetworkModule extends BaseModule {

  @override
  Future<void> register() async {
    // Dio
    locator.registerSingleton<Dio>(Dio(BaseOptions(contentType: "application/json")));

    // Clients
    locator.registerLazySingleton<BinanceClient>(() => BinanceClient(
      locator.get<Dio>(),
      baseUrl: locator.get<DotEnv>().env[AppConstants.binanceBaseUrl]!
    ));
  }

}