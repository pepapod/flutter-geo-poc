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

