import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:news/domain/entities/export_entities.dart';
import 'package:news/domain/usecases/export_usecases.dart';

part 'news_event.dart';

part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsUsecases _newsUseCases;

  NewsBloc(this._newsUseCases) : super(NewsInitial()) {
    on<LoadNews>(_onLoadNews);
  }

  Future<void> _onLoadNews(LoadNews event, Emitter<NewsState> emmit) async {
    try {
      if (state is! NewsLoading) emmit(NewsLoading());

      final newsList = await _newsUseCases.getNews(
        country: event.country,
        category: event.category,
      );

      emmit(NewsLoaded(newsList: newsList));
    } catch (e) {
      emmit(NewsLoadingFailure(exception: e));
    } finally {
      event.completer?.complete();
    }
  }
}
