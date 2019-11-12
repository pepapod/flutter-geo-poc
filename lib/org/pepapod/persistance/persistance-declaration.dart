import 'package:flutter_geo_poc/org/pepapod/model/harvest/harvest-pack.dart';

abstract class HarvestPersistance {
  Future<HarvestPack> getHarvests();
  Future<void> saveHarvests(HarvestPack harvestPack);
}