import 'package:news/data/models/export_models.dart';

abstract interface class NewsRemoteDatasource {
  Future<List<NewsModel>> getNews({
    required String country,
    required String category,
  });
}
