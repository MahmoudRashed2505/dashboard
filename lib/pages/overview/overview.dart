import 'package:dashbaord/constants/controllers.dart';
import 'package:dashbaord/constants/styles.dart';
import 'package:dashbaord/helpers/responsiveness.dart';
import 'package:dashbaord/pages/overview/widgets/available_drivers.dart';
import 'package:dashbaord/pages/overview/widgets/overview_cards_large.dart';
import 'package:dashbaord/pages/overview/widgets/overview_cards_medium.dart';
import 'package:dashbaord/pages/overview/widgets/overview_cards_small.dart';
import 'package:dashbaord/pages/overview/widgets/revenue_section_large.dart';
import 'package:dashbaord/pages/overview/widgets/revenue_section_small.dart';
import 'package:dashbaord/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OverViewPage extends StatelessWidget {
  const OverViewPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Obx(
          () => Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                  top: ResponsiveWidget.isSmallScreen(context) ? 80 : 6,
                  bottom: ResponsiveWidget.isSmallScreen(context) ? 20 : 6,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.3),
                  child: CustomText(
                    text: menuController.activeItem.value,
                    size: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            children: [
              if (ResponsiveWidget.isLargeScreen(context) ||
                  ResponsiveWidget.isMediumScreen(context))
                if (ResponsiveWidget.isCustomSize(context))
                  OverViewCardsMediumPage()
                else
                  OverViewCardsLargePage()
              else
                OverviewCardsSmallScreen(),
              if (!ResponsiveWidget.isSmallScreen(context))
                RevenueSectionLarge()
              else
                RevenueSecionSmall(),
              AvaialabelDrivers(),
              Center(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: "CopyRights for ",
                        style: TextStyle(
                          color: lightGrey,
                        ),
                      ),
                      TextSpan(
                        text: "Volta Software House",
                        style: TextStyle(
                          color: active,
                        ),
                      ),
                    ]),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
