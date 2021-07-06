import 'package:dashbaord/constants/controllers.dart';
import 'package:dashbaord/routes/router.dart';
import 'package:dashbaord/routes/routes.dart';
import 'package:flutter/widgets.dart';

Navigator localNavigator() => Navigator(
      key: navigationController.navigationKey,
      initialRoute: OverViewPageRoute,
      onGenerateRoute: generateRoute,
    );
