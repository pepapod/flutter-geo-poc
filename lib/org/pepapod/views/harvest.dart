import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_geo_poc/org/pepapod/model/harvest/harvest.dart';

class HarvestEvent extends StatelessWidget {
  final Harvest harvest;

  const HarvestEvent({Key key, this.harvest}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(),
      floatingActionButton: _buildNewHarvestButton(context),
    );
  }

  Widget _buildNewHarvestButton(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add, color: Colors.white),
    );
  }

  Widget _buildBody() {
    return ListView.builder(itemBuilder: (BuildContext context, int index) {
      return Container(
        height: 50,
        color: Colors.amber,
      );
    });
  }

  Widget _buildTitle() {
    return Container(
      child: new Text(
        "TABAQUILLO",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildPhoto() {
    return new Container(
        width: 190.0,
        height: 190.0,
        decoration: new BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.lightGreen, width: 5),
            image: new DecorationImage(
                fit: BoxFit.fill,
                image: new NetworkImage(
                    "http://1.bp.blogspot.com/-xu6uND7dq2w/VkI0thzi0LI/AAAAAAAAALs/VGnwrATcmXI/s1600/tabaquillo-02.jpg"))));
  }

  Widget _buildTreeDetail() {
    return Container(
        padding: EdgeInsets.all(8),
        child: new Text(
          "Tabaquillo (Polylepis australis)",
          textAlign: TextAlign.center,
        ));
  }

  Widget _buildAppBar(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context, false),
        ));
  }

  Widget _buildLocationWidget() {
    return Column(
      children: <Widget>[
        Expanded(child: new Text("Latitud: 5555555")),
        Expanded(child: new Text("Longitud: 1111111"))
      ],
    );
  }
}
