part of 'news_bloc.dart';

@immutable
abstract class NewsState extends Equatable {}

class NewsInitial extends NewsState {
  @override
  List<Object?> get props => [];
}

class NewsLoading extends NewsState {
  @override
  List<Object?> get props => [];
}

class NewsLoadingFailure extends NewsState {
  final Object? exception;

  NewsLoadingFailure({required this.exception});

  @override
  List<Object?> get props => [exception];
}

class NewsLoaded extends NewsState {
  final List<NewsEntity> newsList;

  NewsLoaded({required this.newsList});

  @override
  List<Object?> get props => [newsList];
}
