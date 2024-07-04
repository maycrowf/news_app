import 'package:news/core/storage/local_storage.dart';

import 'news_local_data_source.dart';

class NewsLocalDataSourceImpl implements NewsLocalDataSource {
  final LocalStorage _localStorage;

  const NewsLocalDataSourceImpl({
    required LocalStorage localStorage,
  }) : _localStorage = localStorage;

  @override
  Future<void> likeNews({required String url}) async {
    try {
      final newList = _localStorage.likedList;
      newList.add(url);
      _localStorage.likedList = newList;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> unlikeNews({required String url}) async {
    try {
      final newList = _localStorage.likedList;
      newList.remove(url);
      _localStorage.likedList = newList;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<bool> isNewsLiked({required String url}) async {
    try {
      return _localStorage.likedList.contains(url);
    } catch (_) {
      rethrow;
    }
  }
}
