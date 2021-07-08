import 'package:dashbaord/constants/styles.dart';
import 'package:dashbaord/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuController extends GetxController {
  static MenuController instance = Get.find();
  var activeItem = OverViewPageDisplayName.obs;
  var hoverItem = "".obs;

  changeActivePageTo(String itemName) {
    activeItem.value = itemName;
  }

  isActive(String itemName) => activeItem.value == itemName;
  isHovering(String itemName) => hoverItem.value == itemName;

  onHover(String itemName) {
    if (!isActive(itemName)) hoverItem.value = itemName;
  }

  Widget returnIconFor(String itemName) {
    switch (itemName) {
      case OverViewPageDisplayName:
        return _customIcon(Icons.trending_up, itemName);
        break;
      case DriverPageDisplayName:
        return _customIcon(Icons.drive_eta, itemName);
        break;
      case ClientsPageDisplayName:
        return _customIcon(Icons.people_alt_outlined, itemName);
        break;
      case AuthinticationPageDisplayName:
        return _customIcon(Icons.exit_to_app, itemName);
        break;
      default:
        return _customIcon(Icons.exit_to_app, itemName);
    }
  }

  Widget _customIcon(IconData icon, String itemName) {
    if (isActive(itemName))
      return Icon(
        icon,
        size: 22,
        color: dark,
      );
    return Icon(
      icon,
      color: isHovering(itemName) ? dark : lightGrey,
    );
  }
}
