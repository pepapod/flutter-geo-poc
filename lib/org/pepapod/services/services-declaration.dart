import 'package:flutter_geo_poc/org/pepapod/model/harvest/harvest-pack.dart';
import 'package:flutter_geo_poc/org/pepapod/model/harvest/harvest.dart';
import 'package:geolocator/geolocator.dart';


abstract class Service {
  void dispose();
}

abstract class PositionService {
  Future<Position> getCurrentPosition();
}

abstract class BatchIDGenerator{
  String generate();
}

abstract class HarvestService {
  Future<void> saveHarvest(Harvest harvest);
  Future<List<HarvestEntry>> getHarvest();
}

