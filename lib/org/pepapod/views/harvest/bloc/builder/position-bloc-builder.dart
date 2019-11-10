import 'package:flutter/material.dart';
import 'package:flutter_geo_poc/org/pepapod/views/harvest/bloc/harvest-states.dart';
import 'package:flutter_geo_poc/org/pepapod/views/harvest/widget/position-widget.dart';
import 'package:flutter_geo_poc/org/pepapod/widgets/progress/center-sized-circular.dart';

class PositionBlocBuilder {

  Widget builder(BuildContext context, HarvestState state) {
    if (state is PositionAcquiredState) {
      return PositionWidget(position: state.position);
    } else {
      return CenterSizedCircularProgressIndicator();
    }
  }
}
