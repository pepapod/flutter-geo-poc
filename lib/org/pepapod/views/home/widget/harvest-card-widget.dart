import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_geo_poc/org/pepapod/model/harvest/harvest.dart';

class HarvestCardWidget extends StatelessWidget {
  final Harvest harvest;

  const HarvestCardWidget({Key key, this.harvest}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Column(
          children: <Widget>[_buildBatchID(), _buildPosition(), _buildImage()],
        ),
      ),
    );
  }

  Widget _buildBatchID() {
    return Text(
      "BatchID: ${harvest.batchId}",
      style: TextStyle(fontWeight: FontWeight.bold),
    );
  }

  Widget _buildPosition() {
    return Column(
      children: <Widget>[
        Text("Longitude: ${harvest.longitude}"),
        Text("Latitude: ${harvest.latitude}")
      ],
    );
  }

  Widget _buildImage() {
    return Center(child: Image.file(File(harvest.picturePath)));
  }
}
