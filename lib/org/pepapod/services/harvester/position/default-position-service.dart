import 'package:flutter_geo_poc/org/pepapod/services/services-declaration.dart';
import 'package:geolocator/geolocator.dart';

class DefaultPositionService implements PositionService {

  static PositionService _instance;

  DefaultPositionService._();

  factory DefaultPositionService.instance() {
    if (_instance == null) {
      _instance = DefaultPositionService._();
    }
    return _instance;
  }

  @override
  Future<Position> getCurrentPosition() {
    return Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.bestForNavigation);
  }
}
