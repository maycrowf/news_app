import 'package:news/domain/entities/export_entities.dart';
import 'package:news/domain/repositories/export_repositories.dart';

class NewsUsecases {
  final NewsRepository _newsRepository;

  NewsUsecases(this._newsRepository);

  Future<List<NewsEntity>> getNews({
    required String country,
    required String category,
  }) async {
    return _newsRepository.getNews(country: country, category: category);
  }
}
