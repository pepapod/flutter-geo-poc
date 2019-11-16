import 'package:flutter_geo_poc/org/pepapod/model/harvest/harvest-pack.dart';
import 'package:flutter_geo_poc/org/pepapod/model/harvest/harvest.dart';
import 'package:flutter_geo_poc/org/pepapod/persistance/factory/default-persistance-factory.dart';
import 'package:flutter_geo_poc/org/pepapod/persistance/persistance-declaration.dart';
import 'package:flutter_geo_poc/org/pepapod/services/exceptions/service-exception.dart';
import 'package:flutter_geo_poc/org/pepapod/services/services-declaration.dart';

class DefaultHarvestService implements HarvestService {

  static HarvestService _instance;

  DefaultHarvestService._internal();

  factory DefaultHarvestService.instance() {
    if (_instance == null) {
      _instance = DefaultHarvestService._internal();
    }
    return _instance;
  }

  @override
  Future<List<HarvestEntry>> getHarvest() async {
    try {
      HarvestPack harvestPack = await _getPersistance().getHarvests();
      return harvestPack != null ? harvestPack.entries : [];
    } catch (e) {
      throw SevereException(e);
    }
  }

  @override
  Future<void> saveHarvest(Harvest harvest) async {
    try {
      var harvestPack = await _getPersistance().getHarvests();
      if (harvestPack == null) {
        harvestPack = HarvestPack.empty();
      }
      harvestPack.add(HarvestEntry(harvest, false));
      await _getPersistance().saveHarvests(harvestPack);
    } catch (e) {
      throw SevereException(e);
    }
  }

  HarvestPersistance _getPersistance() {
    return DefaultPersistanceFactory.instance().harvestPersistance();
  }
}
