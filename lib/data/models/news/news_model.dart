import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:news/domain/entities/export_entities.dart';

import '../source/source_model.dart';

part 'news_model.g.dart';

@JsonSerializable()
class NewsModel extends Equatable {
  final SourceModel source;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  @JsonKey(name: 'url_to_image')
  final String? urlToImage;
  @JsonKey(name: 'published_at')
  final String? publishedAt;
  final String? content;

  const NewsModel({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) =>
      _$NewsModelFromJson(json);

  NewsEntity toEntity() => NewsEntity(
        source: source.toEntity(),
        author: author,
        title: title,
        description: description,
        url: url,
        urlToImage: urlToImage,
        publishedAt: publishedAt,
        content: content,
      );

  Map<String, dynamic> toJson() => _$NewsModelToJson(this);

  @override
  List<Object?> get props => [
        source,
        author,
        title,
        description,
        url,
        urlToImage,
        publishedAt,
        content,
      ];
}
