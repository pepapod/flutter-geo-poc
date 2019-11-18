import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import  'package:flutter_geo_poc/org/pepapod/model/harvest-event.dart';

class HarvestEventCardWidget extends StatelessWidget {
  final HarvestEvent harvestEvent;

  const HarvestEventCardWidget({Key key, this.harvestEvent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      children: <Widget>[
        Column(
          children: <Widget>[
            _buildHarvestTitle(),
            _buildZoneName(),
            _buildEventDate()
          ],
        ),
        Column(children: <Widget>[_buildHarvestCapacity()])
      ],
    ));
  }

  Widget _buildHarvestTitle() {
    return Text(
      "${harvestEvent.name}",
      style: TextStyle(fontWeight: FontWeight.bold),
    );
  }

  Widget _buildZoneName() {
    return Text("${harvestEvent.zoneId}");
  }

  Widget _buildEventDate() {
    return Text("${harvestEvent.date}");
  }

  Widget _buildHarvestCapacity() {
    return Center(
        child: Text("03/12",
            style: TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center));
  }
}
