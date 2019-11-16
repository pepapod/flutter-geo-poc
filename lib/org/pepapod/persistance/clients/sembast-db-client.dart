import 'dart:io';

import 'package:flutter_geo_poc/org/pepapod/persistance/db-document.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class SembastDBClient {
  static SembastDBClient _instance;

  String dbPath = "geoPoc.db"; // TODO: Parametrize for environment

  SembastDBClient._internal();

  factory SembastDBClient.instance() {
    if (_instance == null) {
      _instance = SembastDBClient._internal();
    }
    return _instance;
  }

  Future<Map<dynamic, dynamic>> get(String key) async {
    var store = StoreRef.main();
    String dbPath = await _getPath();
    DatabaseFactory dbFactory = databaseFactoryIo;
    Database db = await dbFactory.openDatabase(dbPath);
    var result = await store.record(key).get(db);
    db.close();
    return result;
  }

  Future<void> put(DBDocument document) async {
    var store = StoreRef.main();
    String dbPath = await _getPath();
    DatabaseFactory dbFactory = databaseFactoryIo;
    Database db = await dbFactory.openDatabase(dbPath);
    await store.record(document.key()).put(db, document.toJson());
    db.close();
  }

  Future<void> clear() async {
    var store = StoreRef.main();
    String dbPath = await _getPath();
    DatabaseFactory dbFactory = databaseFactoryIo;
    Database db = await dbFactory.openDatabase(dbPath);
    await store.delete(db);
    db.close();
  }

  Future<String> _getPath() async {
    Directory appDir = await getApplicationDocumentsDirectory();
    return join(appDir.path + dbPath);
  }
}
