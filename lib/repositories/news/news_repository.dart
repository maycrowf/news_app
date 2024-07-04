import 'package:news/core/network/client.dart';
import 'package:news/repositories/news/models/get_news_query_params.dart';

import 'package:news/repositories/news/models/news_model.dart';

import 'news_repository_interface.dart';

class NewsRepository implements NewsRepositoryInterface {
  final Client _client;

  NewsRepository(this._client);

  @override
  Future<List<NewsModel>> getNews(GetNewsQueryParams getNewsParams) async {
    try {
      final response = await _client.get(
        "/top-headlines",
        queryParameters: getNewsParams.toMap(),
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
