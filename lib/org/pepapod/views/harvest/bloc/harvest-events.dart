import 'package:equatable/equatable.dart';

class HarvestEvent extends Equatable {
  HarvestEvent([List props = const []]) : super(props);
}

class FetchPositionEvent extends HarvestEvent {}
