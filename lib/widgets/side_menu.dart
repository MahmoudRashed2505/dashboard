import 'package:dashbaord/constants/controllers.dart';
import 'package:dashbaord/constants/styles.dart';
import 'package:dashbaord/helpers/responsiveness.dart';
import 'package:dashbaord/routes/routes.dart';
import 'package:dashbaord/widgets/custom_text.dart';
import 'package:dashbaord/widgets/side_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Container(
      color: light,
      child: ListView(children: [
        if (ResponsiveWidget.isSmallScreen(context))
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(height: 40),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: _width / 48,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Image.asset("assets/icons/logo.png"),
                  ),
                  Flexible(
                    child: CustomText(
                      text: "Dash",
                      size: 20,
                      fontWeight: FontWeight.bold,
                      color: active,
                    ),
                  ),
                  SizedBox(
                    width: _width / 48,
                  ),
                ],
              ),
            ],
          ),
        Divider(color: lightGrey.withOpacity(.1)),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: sideMenuItems
              .map((itemName) => SideMenuItem(
                    itemName: itemName == AuthinticationPageRoute
                        ? "Log Out"
                        : itemName,
                    onTap: () {
                      if (itemName == AuthinticationPageRoute) {
                        // TODO:: got to authentication page
                      }
                      if (!menuController.isActive(itemName)) {
                        menuController.changeActivePageTo(itemName);
                        if (ResponsiveWidget.isSmallScreen(context)) Get.back();
                        navigationController.navigateTo(itemName);
                      }
                    },
                  ))
              .toList(),
        ),
      ]),
    );
  }
}
