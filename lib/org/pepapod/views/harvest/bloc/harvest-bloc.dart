import 'package:bloc/bloc.dart';
import 'package:flutter_geo_poc/org/pepapod/services/services-declaration.dart';
import 'package:flutter_geo_poc/org/pepapod/views/harvest/bloc/harvest-events.dart';
import 'package:flutter_geo_poc/org/pepapod/views/harvest/bloc/harvest-states.dart';
import 'package:geolocator/geolocator.dart';

class HarvestBloc extends Bloc<HarvestEvent, HarvestState> {
  final PositionService _positionService;

  HarvestBloc(this._positionService);

  @override
  HarvestState get initialState => InitialHarvestState();

  @override
  Stream<HarvestState> mapEventToState(HarvestEvent event) async* {
    if (event is FetchPositionEvent) {
      yield* _getPosition();
    }
  }

  Stream<PositionAcquiredState> _getPosition() async* {
    Position position = await _positionService.getCurrentPosition();
    print(position.toString());


    yield PositionAcquiredState(position);
  }
}
