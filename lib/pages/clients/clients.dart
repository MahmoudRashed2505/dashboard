import 'package:dashbaord/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class ClientsPage extends StatelessWidget {
  const ClientsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomText(
        text: "Clients Screen",
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
