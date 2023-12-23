// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ErrorMessageModelImpl _$$ErrorMessageModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ErrorMessageModelImpl(
      status_code: json['status_code'] as int?,
      status_message: json['status_message'] as String,
      success: json['success'] as bool,
    );

Map<String, dynamic> _$$ErrorMessageModelImplToJson(
        _$ErrorMessageModelImpl instance) =>
    <String, dynamic>{
      'status_code': instance.status_code,
      'status_message': instance.status_message,
      'success': instance.success,
    };
