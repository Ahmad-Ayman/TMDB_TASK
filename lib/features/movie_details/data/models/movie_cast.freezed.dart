// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_cast.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MovieCastModel _$MovieCastModelFromJson(Map<String, dynamic> json) {
  return _MovieCastModel.fromJson(json);
}

/// @nodoc
mixin _$MovieCastModel {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'cast')
  List<CastModel>? get castModelList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MovieCastModelCopyWith<MovieCastModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieCastModelCopyWith<$Res> {
  factory $MovieCastModelCopyWith(
          MovieCastModel value, $Res Function(MovieCastModel) then) =
      _$MovieCastModelCopyWithImpl<$Res, MovieCastModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'cast') List<CastModel>? castModelList});
}

/// @nodoc
class _$MovieCastModelCopyWithImpl<$Res, $Val extends MovieCastModel>
    implements $MovieCastModelCopyWith<$Res> {
  _$MovieCastModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? castModelList = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      castModelList: freezed == castModelList
          ? _value.castModelList
          : castModelList // ignore: cast_nullable_to_non_nullable
              as List<CastModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MovieCastModelImplCopyWith<$Res>
    implements $MovieCastModelCopyWith<$Res> {
  factory _$$MovieCastModelImplCopyWith(_$MovieCastModelImpl value,
          $Res Function(_$MovieCastModelImpl) then) =
      __$$MovieCastModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'cast') List<CastModel>? castModelList});
}

/// @nodoc
class __$$MovieCastModelImplCopyWithImpl<$Res>
    extends _$MovieCastModelCopyWithImpl<$Res, _$MovieCastModelImpl>
    implements _$$MovieCastModelImplCopyWith<$Res> {
  __$$MovieCastModelImplCopyWithImpl(
      _$MovieCastModelImpl _value, $Res Function(_$MovieCastModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? castModelList = freezed,
  }) {
    return _then(_$MovieCastModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      castModelList: freezed == castModelList
          ? _value._castModelList
          : castModelList // ignore: cast_nullable_to_non_nullable
              as List<CastModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MovieCastModelImpl implements _MovieCastModel {
  const _$MovieCastModelImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'cast') final List<CastModel>? castModelList})
      : _castModelList = castModelList;

  factory _$MovieCastModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MovieCastModelImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  final List<CastModel>? _castModelList;
  @override
  @JsonKey(name: 'cast')
  List<CastModel>? get castModelList {
    final value = _castModelList;
    if (value == null) return null;
    if (_castModelList is EqualUnmodifiableListView) return _castModelList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'MovieCastModel(id: $id, castModelList: $castModelList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MovieCastModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other._castModelList, _castModelList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, const DeepCollectionEquality().hash(_castModelList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MovieCastModelImplCopyWith<_$MovieCastModelImpl> get copyWith =>
      __$$MovieCastModelImplCopyWithImpl<_$MovieCastModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MovieCastModelImplToJson(
      this,
    );
  }
}

abstract class _MovieCastModel implements MovieCastModel {
  const factory _MovieCastModel(
          {@JsonKey(name: 'id') final int? id,
          @JsonKey(name: 'cast') final List<CastModel>? castModelList}) =
      _$MovieCastModelImpl;

  factory _MovieCastModel.fromJson(Map<String, dynamic> json) =
      _$MovieCastModelImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'cast')
  List<CastModel>? get castModelList;
  @override
  @JsonKey(ignore: true)
  _$$MovieCastModelImplCopyWith<_$MovieCastModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CastModel _$CastModelFromJson(Map<String, dynamic> json) {
  return _CastModel.fromJson(json);
}

/// @nodoc
mixin _$CastModel {
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'original_name')
  String? get originalName => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile_path')
  String? get profilePath => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CastModelCopyWith<CastModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CastModelCopyWith<$Res> {
  factory $CastModelCopyWith(CastModel value, $Res Function(CastModel) then) =
      _$CastModelCopyWithImpl<$Res, CastModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String? name,
      @JsonKey(name: 'original_name') String? originalName,
      @JsonKey(name: 'profile_path') String? profilePath});
}

/// @nodoc
class _$CastModelCopyWithImpl<$Res, $Val extends CastModel>
    implements $CastModelCopyWith<$Res> {
  _$CastModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? originalName = freezed,
    Object? profilePath = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      originalName: freezed == originalName
          ? _value.originalName
          : originalName // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePath: freezed == profilePath
          ? _value.profilePath
          : profilePath // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CastModelImplCopyWith<$Res>
    implements $CastModelCopyWith<$Res> {
  factory _$$CastModelImplCopyWith(
          _$CastModelImpl value, $Res Function(_$CastModelImpl) then) =
      __$$CastModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String? name,
      @JsonKey(name: 'original_name') String? originalName,
      @JsonKey(name: 'profile_path') String? profilePath});
}

/// @nodoc
class __$$CastModelImplCopyWithImpl<$Res>
    extends _$CastModelCopyWithImpl<$Res, _$CastModelImpl>
    implements _$$CastModelImplCopyWith<$Res> {
  __$$CastModelImplCopyWithImpl(
      _$CastModelImpl _value, $Res Function(_$CastModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? originalName = freezed,
    Object? profilePath = freezed,
  }) {
    return _then(_$CastModelImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      originalName: freezed == originalName
          ? _value.originalName
          : originalName // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePath: freezed == profilePath
          ? _value.profilePath
          : profilePath // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CastModelImpl implements _CastModel {
  const _$CastModelImpl(
      {@JsonKey(name: 'name') this.name,
      @JsonKey(name: 'original_name') this.originalName,
      @JsonKey(name: 'profile_path') this.profilePath});

  factory _$CastModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CastModelImplFromJson(json);

  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'original_name')
  final String? originalName;
  @override
  @JsonKey(name: 'profile_path')
  final String? profilePath;

  @override
  String toString() {
    return 'CastModel(name: $name, originalName: $originalName, profilePath: $profilePath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CastModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.originalName, originalName) ||
                other.originalName == originalName) &&
            (identical(other.profilePath, profilePath) ||
                other.profilePath == profilePath));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, originalName, profilePath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CastModelImplCopyWith<_$CastModelImpl> get copyWith =>
      __$$CastModelImplCopyWithImpl<_$CastModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CastModelImplToJson(
      this,
    );
  }
}

abstract class _CastModel implements CastModel {
  const factory _CastModel(
          {@JsonKey(name: 'name') final String? name,
          @JsonKey(name: 'original_name') final String? originalName,
          @JsonKey(name: 'profile_path') final String? profilePath}) =
      _$CastModelImpl;

  factory _CastModel.fromJson(Map<String, dynamic> json) =
      _$CastModelImpl.fromJson;

  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'original_name')
  String? get originalName;
  @override
  @JsonKey(name: 'profile_path')
  String? get profilePath;
  @override
  @JsonKey(ignore: true)
  _$$CastModelImplCopyWith<_$CastModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
