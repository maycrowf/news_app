import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:news/repositories/news/news.dart';

part 'news_event.dart';

part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepositoryInterface _newsRepositoryInterface;

  NewsBloc(this._newsRepositoryInterface) : super(NewsInitial()) {
    on<LoadNews>(_onLoadNews);
  }

  Future<void> _onLoadNews(LoadNews event, Emitter<NewsState> emmit) async {
    try {
      if (state is! NewsLoading) emmit(NewsLoading());

      final newsList = await _newsRepositoryInterface.getNews(
        event.getNewsQueryParams,
      );

      emmit(NewsLoaded(newsList: newsList));
    } catch (e) {
      emmit(NewsLoadingFailure(exception: e));
    } finally {
      event.completer?.complete();
    }
  }
}
