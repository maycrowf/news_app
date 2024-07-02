import 'package:news/repositories/news/models/models.dart';

abstract interface class NewsRepositoryInterface {
  Future<List<NewsModel>> getNews(GetNewsQueryParams getNewsParams);
}
