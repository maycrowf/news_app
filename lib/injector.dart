part of 'main.dart';

final injector = GetIt.instance;

Future<void> initInjector() async {
  final prefs = await SharedPreferences.getInstance();

  injector
    // Network
    ..registerLazySingleton<Client>(
      () => DioClient(Dio()),
    )

    // Storage
    ..registerLazySingleton<LocalStorage>(
      () => LocalStorageImpl(prefs),
    )

    // Data Sources
    ..registerLazySingleton<NewsRemoteDatasource>(
      () => NewsRemoteDatasourceImpl(injector<Client>()),
    )

    // Repositories
    ..registerLazySingleton<NewsRepositoryInterface>(
      () => NewsRepository(injector<Client>()),
    );
}
