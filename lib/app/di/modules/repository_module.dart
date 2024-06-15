import 'package:whisper_offline/data/data_source/localdb/daos/memo_dao.dart';
import 'package:whisper_offline/data/data_source/network/binance/binance_client.dart';
import 'package:whisper_offline/data/repositories/binance_repository.dart';
import 'package:whisper_offline/data/repositories/memo_repository.dart';
import '../dependency_injection.dart';
import 'base_module.dart';

final class RepositoryModule extends BaseModule {

  @override
  Future<void> register() async {
    locator.registerFactory(() => MemoRepository(memoDao: locator.get<MemoDao>()));
    locator.registerFactory(() => BinanceRepository(client: locator.get<BinanceClient>()));
  }

}