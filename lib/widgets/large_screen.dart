import 'package:dashbaord/helpers/local_navigator.dart';
import 'package:dashbaord/widgets/side_menu.dart';
import 'package:flutter/material.dart';

class LargeScreen extends StatelessWidget {
  const LargeScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: SideMenu(),
        ),
        Expanded(
          flex: 5,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: localNavigator(),
          ),
        ),
      ],
    );
  }
}
