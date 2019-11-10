import 'package:flutter/material.dart';
import 'package:flutter_geo_poc/org/pepapod/theme/poc-theme.dart';
import 'package:flutter_geo_poc/org/pepapod/views/home/harverster-home.dart';

class HarvesterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Harvestor',
      theme: PocTheme.theme,
      home: HarvesterHome(),
    );
  }
}
