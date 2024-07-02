import 'package:news/core/api/api_interface.dart';
import 'package:news/core/api/main_api.dart';
import 'package:news/repositories/news/news.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class ServiceLocator {
  static Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    final getIt = GetIt.instance;
    final Dio dio = Dio();
    final ApiInterface api = MainApi(dio: dio);

    getIt.registerSingleton<ApiInterface>(api);
    getIt.registerSingleton<NewsRepositoryInterface>(
      NewsRepository(api: api),
    );
  }
}
