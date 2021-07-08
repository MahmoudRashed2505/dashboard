import 'package:dashbaord/helpers/responsiveness.dart';
import 'package:dashbaord/widgets/large_screen.dart';
import 'package:dashbaord/widgets/side_menu.dart';
import 'package:dashbaord/widgets/small_screen.dart';
import 'package:dashbaord/widgets/top_nav.dart';
import 'package:flutter/material.dart';

class SiteLayout extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      key: scaffoldKey,
      drawer: Drawer(
        child: SideMenu(),
      ),
      appBar: topNavigation(context, scaffoldKey),
      body: ResponsiveWidget(
        largeScreen: LargeScreen(),
        smallScreen: SmallScreen(),
      ),
    );
  }
}
