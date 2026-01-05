import 'package:get_it/get_it.dart';
import '../../data/datasources/local_data_source.dart';
import '../../data/repositories/deal_repository_impl.dart';
import '../../domain/repositories/deal_repository.dart';
import '../../domain/usecases/get_deal_details.dart';
import '../../domain/usecases/get_deals.dart';
import '../../presentation/providers/deal_provider.dart';

final sl = GetIt.instance; // Service Locator

Future<void> init() async {
  // Features - Deals
  // Helper to ensure types are correct

  // Provider
  sl.registerFactory(() => DealProvider(getDeals: sl(), getDealDetails: sl()));

  // Use Cases
  sl.registerLazySingleton(() => GetDeals(sl()));
  sl.registerLazySingleton(() => GetDealDetails(sl()));

  // Repository
  sl.registerLazySingleton<DealRepository>(
    () => DealRepositoryImpl(localDataSource: sl()),
  );

  // Data Source
  sl.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl());

  // Core
  // External
}
