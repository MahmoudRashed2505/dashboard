import 'package:dashbaord/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomText(
        text: "Authentication Screen",
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
