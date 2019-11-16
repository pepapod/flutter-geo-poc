import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

class HarvestState extends Equatable {
  HarvestState([List props = const []]) : super(props);
}

class InitialHarvestState extends HarvestState {}

class PositionAcquiredState extends HarvestState {
  final Position position;

  PositionAcquiredState(this.position) : super([position]);
}
