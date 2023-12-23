import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_cast.freezed.dart';
part 'movie_cast.g.dart';

@freezed
abstract class MovieCastModel with _$MovieCastModel {
  const factory MovieCastModel({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'cast') List<CastModel>? castModelList,
  }) = _MovieCastModel;

  factory MovieCastModel.fromJson(Map<String, dynamic> json) =>
      _$MovieCastModelFromJson(json);
}

@freezed
abstract class CastModel with _$CastModel {
  const factory CastModel({
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'original_name') String? originalName,
    @JsonKey(name: 'profile_path') String? profilePath,
  }) = _CastModel;

  factory CastModel.fromJson(Map<String, dynamic> json) =>
      _$CastModelFromJson(json);
}
