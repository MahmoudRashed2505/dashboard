import 'package:dashbaord/constants/styles.dart';
import 'package:dashbaord/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class InfoCardSmall extends StatelessWidget {
  final String title;
  final String value;
  final bool isActive;
  final Function onTap;

  const InfoCardSmall(
      {Key key, this.title, this.value, this.isActive = false, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                offset: Offset(1, 6),
                color: lightGrey.withOpacity(.5),
                blurRadius: 1,
              ),
            ],
            border: Border.all(color: isActive ? active : lightGrey, width: .5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              CustomText(
                text: title,
                fontWeight: FontWeight.w300,
                color: isActive ? active : lightGrey,
                size: 24,
              ),
              CustomText(
                text: value,
                fontWeight: FontWeight.bold,
                color: isActive ? active : lightGrey,
                size: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
