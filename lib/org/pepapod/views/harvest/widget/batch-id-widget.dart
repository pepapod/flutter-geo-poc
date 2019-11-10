import 'package:flutter/material.dart';
import 'package:flutter_geo_poc/org/pepapod/services/services-inherited.dart';

class BatchIDWidget extends StatelessWidget {

  final String batchId;

  const BatchIDWidget({Key key, this.batchId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(_buildIDText(context)),
    );
  }

  String _buildIDText(BuildContext context) {
    return "BatchID: $batchId";
  }
}
