import 'package:explore/shared/constant.dart';
import 'package:explore/widgets/bottom_bar_column.dart';
import 'package:explore/widgets/info_text.dart';
import 'package:explore/widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(30),
      color: kDefaultBackgroundColor,
      child: ResponsiveWidget.isSmallScreen(context)
          ? Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BottomBarColumn(
                      heading: AppLocalizations.of(context)!.aboutUs,
                      s1: AppLocalizations.of(context)!.aboutUsDetail,
                      s2: '',
                      s3: '',
                      s4: '',
                    ),
                    BottomBarColumn(
                      heading: 'HELP',
                      s1: 'Payment',
                      s2: 'Cancellation',
                      s3: 'FAQ',
                      s4: '',
                    ),
                    BottomBarColumn(
                      heading: 'SOCIAL',
                      s1: 'Twitter',
                      s2: 'Facebook',
                      s3: 'YouTube',
                      s4: '',
                    ),
                  ],
                ),
                Divider(
                  color: Colors.blueGrey,
                ),
                SizedBox(height: 20),
                InfoText(
                  type: 'Email',
                  text: AppLocalizations.of(context)!.email,
                ),
                SizedBox(height: 5),
                InfoText(
                  type: AppLocalizations.of(context)!.address,
                  text: AppLocalizations.of(context)!.currentAddress,
                ),
                SizedBox(height: 20),
                Divider(
                  color: Colors.blueGrey,
                ),
                SizedBox(height: 20),
                Text(
                  AppLocalizations.of(context)!.copyright,
                  style: TextStyle(
                    color: Colors.blueGrey.shade300,
                    fontSize: 14,
                  ),
                ),
              ],
            )
          : Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                        width: screenSize.width / 3,
                        child: RichText(
                          text: TextSpan(
                            text: AppLocalizations.of(context)!.aboutUsDetail,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        )),

                    // BottomBarColumn(
                    //   heading: AppLocalizations.of(context)!.aboutUs,
                    //   s1: AppLocalizations.of(context)!.aboutUsDetail,
                    //   s2: '',
                    //   s3: '',
                    // ),
                    BottomBarColumn(
                      heading: AppLocalizations.of(context)!.company,
                      s1: AppLocalizations.of(context)!.aboutUs,
                      s2: AppLocalizations.of(context)!.talksAboutUs,
                      s3: AppLocalizations.of(context)!.news,
                      s4: '',
                    ),
                    BottomBarColumn(
                      heading: AppLocalizations.of(context)!.service,
                      s1: AppLocalizations.of(context)!.longtripCheap,
                      s2: AppLocalizations.of(context)!.taxiTrip,
                      s3: AppLocalizations.of(context)!.taxiLongTripCheap,
                      s4: AppLocalizations.of(context)!.airportTaxiCheap,
                    ),
                    Container(
                      color: Colors.blueGrey,
                      width: 2,
                      height: 150,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InfoText(
                          type: 'Email',
                          text: AppLocalizations.of(context)!.email,
                        ),
                        SizedBox(height: 5),
                        InfoText(
                          type: AppLocalizations.of(context)!.address,
                          text: AppLocalizations.of(context)!.currentAddress,
                        )
                      ],
                    ),
                  ],
                ),
                Divider(
                  color: Colors.blueGrey,
                ),
                SizedBox(height: 20),
                Text(
                  AppLocalizations.of(context)!.copyright,
                  style: TextStyle(
                    color: Colors.blueGrey.shade300,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
    );
  }
}
