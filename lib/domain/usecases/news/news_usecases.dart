import 'package:news/domain/entities/export_entities.dart';
import 'package:news/domain/repositories/export_repositories.dart';

class NewsUseCases {
  final NewsRepository _newsRepository;

  NewsUseCases(this._newsRepository);

  Future<List<NewsEntity>> getNews({
    required String country,
    required String category,
  }) async {
    return _newsRepository.getNews(country: country, category: category);
  }
}
