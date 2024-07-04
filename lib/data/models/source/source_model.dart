import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:news/domain/entities/export_entities.dart';

part 'source_model.g.dart';

@JsonSerializable()
class SourceModel extends Equatable {
  final String? id;
  final String? name;

  const SourceModel({
    required this.id,
    required this.name,
  });

  factory SourceModel.fromJson(Map<String, dynamic> json) =>
      _$SourceModelFromJson(json);

  SourceEntity toEntity() => SourceEntity(id: id, name: name);

  Map<String, dynamic> toJson() => _$SourceModelToJson(this);

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
