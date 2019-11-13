import 'package:flutter/material.dart';
import 'package:flutter_geo_poc/org/pepapod/model/harvest/harvest-pack.dart';
import 'package:flutter_geo_poc/org/pepapod/model/harvest/harvest.dart';
import 'package:flutter_geo_poc/org/pepapod/services/services-inherited.dart';
import 'package:flutter_geo_poc/org/pepapod/views/harvest/harvest-view.dart';
import 'package:flutter_geo_poc/org/pepapod/views/home/widget/harvest-card-widget.dart';
import 'package:flutter_geo_poc/org/pepapod/widgets/future/future-widget.dart';

class HarvesterHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Harvester"),
      ),
      body: FutureWidget(
        fromFuture: Services.of(context).harvestService().getHarvest(),
        onData: (harvests) => _buildListOfHarvest(harvests),
      ),
      floatingActionButton: _buildNewHarvestButton(context),
    );
  }

  Widget _buildListOfHarvest(List<HarvestEntry> harvests) {
    if (harvests.isNotEmpty) {
      return Container(
        child: ListView.builder(
          itemCount: harvests.length,
          itemBuilder: (context, index) {
            Harvest harvest = harvests[index].harvest;
            return HarvestCardWidget(harvest: harvest);
          },
        ),
      );
    } else {
      return Container(
        child: Center(
          child: Text("No hay recolecciones guardados"),
        ),
      );
    }
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
