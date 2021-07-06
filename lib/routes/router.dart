import 'package:dashbaord/pages/clients/clients.dart';
import 'package:dashbaord/pages/drivers/drivers.dart';
import 'package:dashbaord/pages/overview/overview.dart';
import 'package:dashbaord/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case OverViewPageRoute:
      return _getPageRoute(OverViewPage());
      break;
    case DriverPageRoute:
      return _getPageRoute(DriversPage());
      break;
    case ClientsPageRoute:
      return _getPageRoute(ClientsPage());
      break;
    default:
      return _getPageRoute(OverViewPage());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}
