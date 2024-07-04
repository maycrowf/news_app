import 'package:news/core/network/client.dart';
import 'package:news/data/datasources/remote/news/news_remote_datasource.dart';
import 'package:news/data/models/export_models.dart';

class NewsRemoteDatasourceImpl implements NewsRemoteDatasource {
  final Client _client;

  const NewsRemoteDatasourceImpl(this._client);

  @override
  Future<List<NewsModel>> getNews({
    required String country,
    required String category,
  }) async {
    try {
      final response = await _client.get(
        "/top-headlines",
        queryParameters: {
          "country": country,
          "category": category,
        },
      );

      final newsList = List<NewsModel>.from(response["articles"].map(
        (article) => NewsModel.fromJson(article),
      ));

      return newsList;
    } catch (_) {
      rethrow;
    }
  }
}
