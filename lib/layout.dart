import 'package:dashbaord/widgets/large_screen.dart';
import 'package:dashbaord/widgets/small_screen.dart';
import 'package:flutter/material.dart';

class SideLayout extends StatelessWidget {
  const SideLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: MediaQuery.of(context).size.width > 800
          ? LargeScreen()
          : SmallScreen(),
    );
  }
}
