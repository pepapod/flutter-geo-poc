import 'package:flutter/material.dart';
import 'package:flutter_geo_poc/org/pepapod/services/services-inherited.dart';
import 'package:flutter_geo_poc/org/pepapod/views/harvest/harvest-view.dart';

class HarvesterHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Harvester"),
      ),
      floatingActionButton: _buildNewHarvestButton(context),
    );
  }

  Widget _buildNewHarvestButton(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add, color: Colors.white),
      onPressed: () => newHarvest(context),
    );
  }

  void newHarvest(BuildContext context) {
    String batchId = Services.of(context).batchIDGenerator().generate();
    Navigator.push(context, MaterialPageRoute(builder: (ctx) => HarvestView(batchId: batchId)));
  }
}
