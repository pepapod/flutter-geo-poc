import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_geo_poc/org/pepapod/services/services-inherited.dart';
import 'package:flutter_geo_poc/org/pepapod/views/harvest/bloc/builder/position-bloc-builder.dart';
import 'package:flutter_geo_poc/org/pepapod/views/harvest/bloc/harvest-bloc.dart';
import 'package:flutter_geo_poc/org/pepapod/views/harvest/bloc/harvest-events.dart';
import 'package:flutter_geo_poc/org/pepapod/views/harvest/widget/batch-id-widget.dart';
import 'package:flutter_geo_poc/org/pepapod/views/harvest/widget/picture-widget.dart';
import 'package:flutter_geo_poc/org/pepapod/widgets/camera-widget.dart';

class HarvestView extends StatefulWidget {
  final String batchId;

  const HarvestView({Key key, this.batchId}) : super(key: key);

  @override
  _HarvestViewState createState() => _HarvestViewState();
}

class _HarvestViewState extends State<HarvestView> {
  HarvestBloc _harvestBloc;

  String _imagePath;

  @override
  void didChangeDependencies() {
    if (_harvestBloc == null) {
      var positionService = Services.of(context).positionService();
      _harvestBloc = HarvestBloc(positionService);
      _harvestBloc.add(FetchPositionEvent());
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Nueva Recoleccion",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.lightGreen,
      ),
      body: _buildBody(),
    );
  }

  Column _buildBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(child: _buildBatchId(), flex: 1),
        Divider(height: 1),
        Expanded(child: _buildPositionWidget(), flex: 2),
        Divider(height: 1),
        Expanded(child: _buildPictureWidget(), flex: 8),
        Divider(height: 1),
        Expanded(child: _buildSubmitButton(), flex: 2),
      ],
    );
  }

  Widget _buildBatchId() {
    return BatchIDWidget(batchId: widget.batchId);
  }

  Widget _buildPositionWidget() {
    return Row(
      children: <Widget>[
        Expanded(child: _buildPositionInfo(), flex: 2),
        Expanded(child: _buildRefreshPositionButton(), flex: 1)
      ],
    );
  }

  Widget _buildPositionInfo() {
    return BlocBuilder(
      bloc: _harvestBloc,
      builder: PositionBlocBuilder().builder,
    );
  }

  Widget _buildRefreshPositionButton() {
    return FloatingActionButton(
      child: Icon(Icons.refresh),
      onPressed: () {
        _harvestBloc.add(FetchPositionEvent());
      },
    );
  }

  Widget _buildPictureWidget() {
    return PictureWidget(imagePath: _imagePath, onPressed: _takePicture);
  }

  Future _takePicture() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;
    String path = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => CameraWidget(
            camera: firstCamera,
          ),
        ));

    if (path != null) {
      setState(() {
        _imagePath = path;
      });
    }
  }

  Widget _buildSubmitButton() {
    return Center(
      child: RaisedButton(
        child: Text("Guardar"),
        onPressed: () {},
      ),
    );
  }
}
