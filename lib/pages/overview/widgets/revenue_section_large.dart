import 'package:dashbaord/constants/styles.dart';
import 'package:dashbaord/pages/overview/widgets/bar_chart.dart';
import 'package:dashbaord/pages/overview/widgets/revenue_infor.dart';
import 'package:dashbaord/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class RevenueSectionLarge extends StatelessWidget {
  const RevenueSectionLarge({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 30),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              offset: Offset(1, 6),
              color: lightGrey.withOpacity(.5),
              blurRadius: 0,
            ),
          ],
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CustomText(
                    text: "Revenue Chart",
                    size: 20,
                    fontWeight: FontWeight.bold,
                    color: lightGrey,
                  ),
                  Container(
                    width: 600,
                    height: 200,
                    child: SimpleBarChart.withSampleData(),
                  ),
                ],
              ),
            ),
            Container(
              width: 1,
              height: 120,
              color: lightGrey,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(
                  left: 50,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        RevenueInfo(
                          title: "Today\'s Revenue",
                          amount: "23",
                        ),
                        RevenueInfo(
                          title: "Last 7 Days",
                          amount: "150",
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: <Widget>[
                        RevenueInfo(
                          title: "Last 30 days",
                          amount: "1,203",
                        ),
                        RevenueInfo(
                          title: "Last 6 Month",
                          amount: "5,000",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
