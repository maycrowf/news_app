import 'package:news/domain/entities/news/news_entity.dart';

abstract interface class NewsRepository {
  Future<List<NewsEntity>> getNews({
    required String country,
    required String category,
  });

  Future<void> likeNews({required String url});

  Future<void> unlikeNews({required String url});

  Future<bool> isNewsLiked({required String url});
}
