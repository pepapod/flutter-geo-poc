import 'package:flutter/material.dart';
import 'package:flutter_geo_poc/org/pepapod/services/factory/default-factory.dart';
import 'package:flutter_geo_poc/org/pepapod/services/services-inherited.dart';

import 'org/pepapod/views/app/harvester-app.dart';

void main() async {
  var appWithServices = Services(
    factory: DefaultServiceFactory.instance(),
    child: HarvesterApp(),
  );

  runApp(appWithServices);
}
