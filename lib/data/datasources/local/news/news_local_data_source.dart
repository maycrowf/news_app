abstract class NewsLocalDataSource {
  const NewsLocalDataSource();

  Future<void> likeNews({required String url});

  Future<void> unlikeNews({required String url});

  Future<bool> isNewsLiked({required String url});
}
