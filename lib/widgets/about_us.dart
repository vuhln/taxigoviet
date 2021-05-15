import 'package:explore/widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return ResponsiveWidget.isSmallScreen(context)
        ? Container(
            width: screenSize.width * 0.8,
            padding: EdgeInsets.fromLTRB(5, 20, 5, 0),
            child: Text(AppLocalizations.of(context)!.aboutUsDetail,
                style: TextStyle(
                  // color: kDefaultBackgroundColor,
                  fontSize: 16,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                )),
          )
        : Container(
            width: screenSize.width * 0.65,
            padding: EdgeInsets.fromLTRB(20, 40, 20, 0),
            child: Text(AppLocalizations.of(context)!.aboutUsDetail,
                style: TextStyle(
                  // color: kDefaultBackgroundColor,
                  fontSize: 24,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                )),
          );
  }
}
