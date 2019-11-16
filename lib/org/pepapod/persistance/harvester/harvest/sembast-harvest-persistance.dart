import 'dart:developer';

import 'package:flutter_geo_poc/org/pepapod/model/harvest/harvest-pack.dart';
import 'package:flutter_geo_poc/org/pepapod/persistance/clients/sembast-db-client.dart';
import 'package:flutter_geo_poc/org/pepapod/persistance/persistance-declaration.dart';

class SembastHarvestPersistance implements HarvestPersistance {

  static HarvestPersistance _instance;

  SembastHarvestPersistance._internal();

  factory SembastHarvestPersistance.instance() {
    if (_instance == null) {
      _instance = SembastHarvestPersistance._internal();
    }
    return _instance;
  }

  @override
  Future<HarvestPack> getHarvests() async {
    HarvestPack harvestPack;

    try {
      var sembastDBClient = SembastDBClient.instance();
      var harvestPackJson = await sembastDBClient.get(HarvestPack.KEY);
      if (harvestPackJson != null) {
        harvestPack = HarvestPack.fromJson(harvestPackJson);

      }
    } catch (e) {
      log(e);
    }

    return harvestPack;
  }

  @override
  Future<void> saveHarvests(HarvestPack harvestPack) async {
    try {
      var sembastDBClient = SembastDBClient.instance();
      await sembastDBClient.put(harvestPack);
    } catch (e) {
    log(e);
    }
  }

}