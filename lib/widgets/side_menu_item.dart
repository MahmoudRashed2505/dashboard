import 'package:dashbaord/helpers/responsiveness.dart';
import 'package:dashbaord/widgets/horizontal_menu_item.dart';
import 'package:dashbaord/widgets/verticall_menu_item.dart';
import 'package:flutter/material.dart';

class SideMenuItem extends StatelessWidget {
  final String itemName;
  final Function onTap;
  const SideMenuItem({Key key, this.itemName, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (ResponsiveWidget.isCustomSize(context))
      return VerticalMenuItem(
        itemName: itemName,
        onTap: onTap,
      );
    else
      return HorizontalMenuItem(
        itemName: itemName,
        onTap: onTap,
      );
  }
}
