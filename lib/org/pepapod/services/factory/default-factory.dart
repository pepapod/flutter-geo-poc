import 'package:flutter_geo_poc/org/pepapod/services/harvester/batch/default-batch-id-generator.dart';
import 'package:flutter_geo_poc/org/pepapod/services/harvester/harvest/default-harvest-service.dart';
import 'package:flutter_geo_poc/org/pepapod/services/harvester/position/default-position-service.dart';
import 'package:flutter_geo_poc/org/pepapod/services/services-declaration.dart';
import 'package:flutter_geo_poc/org/pepapod/services/services-factory.dart';

class DefaultServiceFactory extends ServiceFactory {
  static ServiceFactory _instance;

  DefaultServiceFactory._();

  factory DefaultServiceFactory.instance() {
    if (_instance == null) {
      _instance = DefaultServiceFactory._();
    }
    return _instance;
  }

  @override
  PositionService positionService() {
    return DefaultPositionService.instance();
  }

  @override
  BatchIDGenerator batchIDGenerator() {
    return DefaultBatchIDGenerator.instance();
  }

  @override
  HarvestService harvestService() {
    return DefaultHarvestService.instance();
  }
}
