import 'package:dashbaord/constants/styles.dart';
import 'package:dashbaord/helpers/responsiveness.dart';
import 'package:dashbaord/widgets/custom_text.dart';
import 'package:flutter/material.dart';

AppBar topNavigation(BuildContext context, GlobalKey<ScaffoldState> key) =>
    AppBar(
      leading: !ResponsiveWidget.isSmallScreen(context)
          ? Row(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(left: 14),
                  child: Image.asset("assets/icons/logo.png"),
                )
              ],
            )
          : IconButton(
              onPressed: () {
                key.currentState.openDrawer();
              },
              icon: Icon(
                Icons.menu,
                color: Colors.black,
              ),
            ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: Row(
        children: <Widget>[
          Visibility(
            child: CustomText(
              text: "Dash",
              color: lightGrey,
              size: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(child: Container()),
          if (!ResponsiveWidget.isSmallScreen(context))
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.settings,
                color: dark.withOpacity(.7),
              ),
            ),
          if (!ResponsiveWidget.isSmallScreen(context))
            Stack(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications,
                    color: dark.withOpacity(.7),
                  ),
                ),
                Positioned(
                  top: 7,
                  right: 7,
                  child: Container(
                    width: 12,
                    height: 12,
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: active,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: light, width: 2),
                    ),
                  ),
                ),
              ],
            ),
          Container(
            width: 1,
            height: 22,
            color: lightGrey,
          ),
          SizedBox(
            width: 24,
          ),
          CustomText(
            text: "Mahmoud Rashed",
            color: lightGrey,
          ),
          SizedBox(
            width: 16,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(30)),
            child: Container(
              padding: const EdgeInsets.all(2),
              margin: const EdgeInsets.all(2),
              child: CircleAvatar(
                backgroundColor: light,
                child: Icon(
                  Icons.person_outline,
                  color: dark,
                ),
              ),
            ),
          )
        ],
      ),
      iconTheme: IconThemeData(color: dark),
    );
