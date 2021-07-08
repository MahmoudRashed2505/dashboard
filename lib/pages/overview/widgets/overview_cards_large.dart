import 'package:dashbaord/pages/overview/widgets/info_card.dart';
import 'package:flutter/material.dart';

class OverViewCardsLargePage extends StatelessWidget {
  const OverViewCardsLargePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Row(
      children: <Widget>[
        InfoCard(
          title: "Rides in progress",
          value: "7",
          onTap: () {},
          topColor: Colors.orange,
        ),
        SizedBox(
          width: _width / 64,
        ),
        InfoCard(
          title: "Packages deliverd",
          value: "17",
          onTap: () {},
          topColor: Colors.lightGreen,
        ),
        SizedBox(
          width: _width / 64,
        ),
        InfoCard(
          title: "Cancelld Deleivery",
          value: "3",
          onTap: () {},
          topColor: Colors.redAccent,
        ),
        SizedBox(
          width: _width / 64,
        ),
        InfoCard(
          title: "Scheduled Deleivery",
          value: "3",
          onTap: () {},
        ),
        SizedBox(
          width: _width / 64,
        ),
      ],
    );
  }
}
