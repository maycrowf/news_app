part of 'news_bloc.dart';

@immutable
abstract class NewsEvent extends Equatable {}

class LoadNews extends NewsEvent {
  final GetNewsQueryParams getNewsQueryParams;
  final Completer? completer;

  LoadNews({
    required this.getNewsQueryParams,
    this.completer,
  });

  @override
  List<Object?> get props => [
        getNewsQueryParams,
        completer,
      ];
}
