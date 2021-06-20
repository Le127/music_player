import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        alignment: Alignment.topLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FaIcon(FontAwesomeIcons.chevronLeft),
            Spacer(flex: 10),
            FaIcon(FontAwesomeIcons.commentAlt),
            Spacer(),
            FaIcon(FontAwesomeIcons.headphonesAlt),
            Spacer(),
            FaIcon(FontAwesomeIcons.externalLinkAlt),
          ],
        ),
      ),
    );
  }
}
