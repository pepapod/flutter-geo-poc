import 'package:flutter/material.dart';
import 'package:flutter_geo_poc/org/pepapod/services/services-declaration.dart';

import 'services-factory.dart';

class Services extends InheritedWidget implements ServiceFactory {
  final ServiceFactory _serviceFactory;

  const Services({Key key, @required ServiceFactory factory, @required Widget child})
      : assert(factory != null),
        assert(child != null),
        this._serviceFactory = factory,
        super(key: key, child: child);

  static Services of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(Services);
  }

  ServiceFactory factory() {
    return _serviceFactory;
  }

  @override
  bool updateShouldNotify(Services oldWidget) {
    return this.factory().runtimeType == this.factory().runtimeType;
  }

  @override
  PositionService positionService() {
    return _serviceFactory.positionService();
  }

  @override
  BatchIDGenerator batchIDGenerator() {
    return _serviceFactory.batchIDGenerator();
  }

  @override
  HarvestService harvestService() {
    return _serviceFactory.harvestService();
  }
}
