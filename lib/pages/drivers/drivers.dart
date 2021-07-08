import 'package:dashbaord/constants/controllers.dart';
import 'package:dashbaord/helpers/responsiveness.dart';
import 'package:dashbaord/pages/drivers/widgets/drivers_table.dart';
import 'package:dashbaord/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DriversPage extends StatelessWidget {
  const DriversPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Obx(
          () => Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                  top: ResponsiveWidget.isSmallScreen(context) ? 56 : 6,
                ),
                child: CustomText(
                  text: menuController.activeItem.value,
                  size: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            children: [
              DriversTable(),
            ],
          ),
        )
      ],
    );
  }
}
