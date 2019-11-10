import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class PositionWidget extends StatelessWidget {
  final Position position;

  const PositionWidget({Key key, this.position}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(child: _buildLongitude()),
          Expanded(child: _buildLatitude()),
          Expanded(child: _buildAccuracy()),
        ],
      ),
    );
  }

  Widget _buildLongitude() {
    return Text("Longitude: ${position.longitude}");
  }

  Widget _buildLatitude() {
    return Text("Altitude: ${position.latitude}");
  }

  Widget _buildAccuracy() {
    return Text("Accuracy: ${position.accuracy}m");
  }
}
