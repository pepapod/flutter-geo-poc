

import 'package:flutter_geo_poc/org/pepapod/services/services-declaration.dart';

abstract class ServiceFactory {
  PositionService positionService();
  BatchIDGenerator batchIDGenerator();
  HarvestService harvestService();
}
