import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:async';
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';
import 'package:tmdbtask/core/utils/helpers/enums.dart';

import '../../networking/remote_response.dart';
part 'cache_manager.g.dart';

@DataClassName('CacheEntry')
class Cache extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get url => text()();
  TextColumn get response => text()();
  DateTimeColumn get expiration => dateTime()();
}


@DriftDatabase(tables: [Cache])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<void> insertCache(CacheEntry entry) async {
    into(cache).insertOnConflictUpdate(entry);
  }

  Future<RemoteResponse<CacheEntry?>>  getCache(String url)async {
    print('url : ${url}');
    print('dad : ${await (select(cache)..where((tbl) => tbl.url.equals(url))).getSingleOrNull()}');
    if( await (select(cache)..where((tbl) => tbl.url.equals(url))).getSingleOrNull() !=null){
      return RemoteResponse.data(await (select(cache)..where((tbl) => tbl.url.equals(url))).getSingleOrNull());
    }else{
      return RemoteResponse.failure('No Cache Found', false, PageStates.noData);
    }
  }

  Future<void> clearExpiredCache(String url) async {
   CacheEntry? record =  await (select(cache)..where((tbl) => tbl.url.equals(url))).getSingleOrNull();
   if(record !=null) {
     print('Remaining Time in cache : ${record.expiration.difference(DateTime.now()).inSeconds}');
   }
    delete(cache)..where((tbl) => tbl.url.equals(url) & tbl.expiration.isBiggerThanValue(DateTime.now()).not())..go().then((value) => print('cleared : ${value}'));
  }
}


LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'cache.sqlite'));

    // Also work around limitations on old Android versions
    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }

    // Make sqlite3 pick a more suitable location for temporary files - the
    // one from the system may be inaccessible due to sandboxing.
    final cachebase = (await getTemporaryDirectory()).path;
    // We can't access /tmp on Android, which sqlite3 would try by default.
    // Explicitly tell it about the correct temporary directory.
    sqlite3.tempDirectory = cachebase;

    return NativeDatabase.createInBackground(file);
  });
}
