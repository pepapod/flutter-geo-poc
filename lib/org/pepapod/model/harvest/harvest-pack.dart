import 'package:flutter_geo_poc/org/pepapod/model/harvest/harvest.dart';
import 'package:flutter_geo_poc/org/pepapod/model/json/json-convertible.dart';
import 'package:flutter_geo_poc/org/pepapod/persistance/db-document.dart';

class HarvestPack implements DBDocument {
  static const String KEY = "hpack";

  final List<HarvestEntry> entries;

  HarvestPack(this.entries);


  void add(HarvestEntry harvestEntry) {
    entries?.add(harvestEntry);
  }

  @override
  String key() {
    return KEY;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "entries": entries.map((e) => e.toJson()).toList(),
    };
  }

  factory HarvestPack.fromJson(Map<String, dynamic> json) {
    return HarvestPack(
        (json['entries'] as List).map((entry) => HarvestEntry.fromJson(entry)).toList());
  }

  factory HarvestPack.empty(){
    return HarvestPack([]);
  }
}

class HarvestEntry implements JsonConvertible {
  final Harvest harvest;
  final bool sync;

  HarvestEntry(this.harvest, this.sync);

  @override
  Map<String, dynamic> toJson() {
    return {
      "harvest": harvest.toJson(),
      "sync": sync,
    };
  }

  factory HarvestEntry.fromJson(Map<String, dynamic> json) {
    Harvest harvest = Harvest.fromJson(json["harvest"]);
    bool sync = json["sync"];
    return HarvestEntry(harvest, sync);
  }
}
