// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cache_manager.dart';

// ignore_for_file: type=lint
class $CacheTable extends Cache with TableInfo<$CacheTable, CacheEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CacheTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
      'url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _responseMeta =
      const VerificationMeta('response');
  @override
  late final GeneratedColumn<String> response = GeneratedColumn<String>(
      'response', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _expirationMeta =
      const VerificationMeta('expiration');
  @override
  late final GeneratedColumn<DateTime> expiration = GeneratedColumn<DateTime>(
      'expiration', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, url, response, expiration];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cache';
  @override
  VerificationContext validateIntegrity(Insertable<CacheEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('url')) {
      context.handle(
          _urlMeta, url.isAcceptableOrUnknown(data['url']!, _urlMeta));
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    if (data.containsKey('response')) {
      context.handle(_responseMeta,
          response.isAcceptableOrUnknown(data['response']!, _responseMeta));
    } else if (isInserting) {
      context.missing(_responseMeta);
    }
    if (data.containsKey('expiration')) {
      context.handle(
          _expirationMeta,
          expiration.isAcceptableOrUnknown(
              data['expiration']!, _expirationMeta));
    } else if (isInserting) {
      context.missing(_expirationMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CacheEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CacheEntry(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      url: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}url'])!,
      response: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}response'])!,
      expiration: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}expiration'])!,
    );
  }

  @override
  $CacheTable createAlias(String alias) {
    return $CacheTable(attachedDatabase, alias);
  }
}

class CacheEntry extends DataClass implements Insertable<CacheEntry> {
  final int id;
  final String url;
  final String response;
  final DateTime expiration;
  const CacheEntry(
      {required this.id,
      required this.url,
      required this.response,
      required this.expiration});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['url'] = Variable<String>(url);
    map['response'] = Variable<String>(response);
    map['expiration'] = Variable<DateTime>(expiration);
    return map;
  }

  CacheCompanion toCompanion(bool nullToAbsent) {
    return CacheCompanion(
      id: Value(id),
      url: Value(url),
      response: Value(response),
      expiration: Value(expiration),
    );
  }

  factory CacheEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CacheEntry(
      id: serializer.fromJson<int>(json['id']),
      url: serializer.fromJson<String>(json['url']),
      response: serializer.fromJson<String>(json['response']),
      expiration: serializer.fromJson<DateTime>(json['expiration']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'url': serializer.toJson<String>(url),
      'response': serializer.toJson<String>(response),
      'expiration': serializer.toJson<DateTime>(expiration),
    };
  }

  CacheEntry copyWith(
          {int? id, String? url, String? response, DateTime? expiration}) =>
      CacheEntry(
        id: id ?? this.id,
        url: url ?? this.url,
        response: response ?? this.response,
        expiration: expiration ?? this.expiration,
      );
  @override
  String toString() {
    return (StringBuffer('CacheEntry(')
          ..write('id: $id, ')
          ..write('url: $url, ')
          ..write('response: $response, ')
          ..write('expiration: $expiration')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, url, response, expiration);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CacheEntry &&
          other.id == this.id &&
          other.url == this.url &&
          other.response == this.response &&
          other.expiration == this.expiration);
}

class CacheCompanion extends UpdateCompanion<CacheEntry> {
  final Value<int> id;
  final Value<String> url;
  final Value<String> response;
  final Value<DateTime> expiration;
  const CacheCompanion({
    this.id = const Value.absent(),
    this.url = const Value.absent(),
    this.response = const Value.absent(),
    this.expiration = const Value.absent(),
  });
  CacheCompanion.insert({
    this.id = const Value.absent(),
    required String url,
    required String response,
    required DateTime expiration,
  })  : url = Value(url),
        response = Value(response),
        expiration = Value(expiration);
  static Insertable<CacheEntry> custom({
    Expression<int>? id,
    Expression<String>? url,
    Expression<String>? response,
    Expression<DateTime>? expiration,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (url != null) 'url': url,
      if (response != null) 'response': response,
      if (expiration != null) 'expiration': expiration,
    });
  }

  CacheCompanion copyWith(
      {Value<int>? id,
      Value<String>? url,
      Value<String>? response,
      Value<DateTime>? expiration}) {
    return CacheCompanion(
      id: id ?? this.id,
      url: url ?? this.url,
      response: response ?? this.response,
      expiration: expiration ?? this.expiration,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (response.present) {
      map['response'] = Variable<String>(response.value);
    }
    if (expiration.present) {
      map['expiration'] = Variable<DateTime>(expiration.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CacheCompanion(')
          ..write('id: $id, ')
          ..write('url: $url, ')
          ..write('response: $response, ')
          ..write('expiration: $expiration')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $CacheTable cache = $CacheTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [cache];
}
