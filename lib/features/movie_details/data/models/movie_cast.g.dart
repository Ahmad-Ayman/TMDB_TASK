// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_cast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MovieCastModelImpl _$$MovieCastModelImplFromJson(Map<String, dynamic> json) =>
    _$MovieCastModelImpl(
      id: json['id'] as int?,
      castModelList: (json['cast'] as List<dynamic>?)
          ?.map((e) => CastModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MovieCastModelImplToJson(
        _$MovieCastModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cast': instance.castModelList,
    };

_$CastModelImpl _$$CastModelImplFromJson(Map<String, dynamic> json) =>
    _$CastModelImpl(
      name: json['name'] as String?,
      originalName: json['original_name'] as String?,
      profilePath: json['profile_path'] as String?,
    );

Map<String, dynamic> _$$CastModelImplToJson(_$CastModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'original_name': instance.originalName,
      'profile_path': instance.profilePath,
    };
