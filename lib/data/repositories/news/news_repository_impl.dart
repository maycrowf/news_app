import 'package:dio/dio.dart';
import 'package:news/data/datasources/export_datasources.dart';
import 'package:news/domain/entities/export_entities.dart';
import 'package:news/domain/repositories/export_repositories.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsRemoteDatasource _newsRemoteDatasource;
  final NewsLocalDataSource _newsLocalDataSource;

  NewsRepositoryImpl(this._newsRemoteDatasource, this._newsLocalDataSource);

  @override
  Future<List<NewsEntity>> getNews({
    required String country,
    required String category,
  }) async {
    try {
      final result = await _newsRemoteDatasource.getNews(
        country: country,
        category: category,
      );

      return result.map((e) => e.toEntity()).toList();
    } on DioException catch (e) {
      throw Exception(e.response?.data);
    }
  }

  @override
  Future<void> likeNews({required String url}) async {
    try {
      return await _newsLocalDataSource.likeNews(url: url);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> unlikeNews({required String url}) async {
    try {
      return await _newsLocalDataSource.unlikeNews(url: url);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<bool> isNewsLiked({required String url}) async {
    try {
      return await _newsLocalDataSource.isNewsLiked(url: url);
    } catch (e) {
      throw Exception(e);
    }
  }
}
