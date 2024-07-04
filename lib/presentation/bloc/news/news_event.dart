part of 'news_bloc.dart';

@immutable
abstract class NewsEvent extends Equatable {}

class LoadNews extends NewsEvent {
  final String country;
  final String category;
  final Completer? completer;

  LoadNews({
    required this.country,
    required this.category,
    this.completer,
  });

  @override
  List<Object?> get props => [
        country,
        category,
        completer,
      ];
}
