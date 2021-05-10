import 'package:explore/models/popular_place_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PopularPlaceService {
  List<PopularPlaceInfo> fetchPickupPlacesItems(BuildContext context) {
    return [
      PopularPlaceInfo(
          "assets/images/BA-NA-1024x523.jpg",
          AppLocalizations.of(context)!.baNaHill,
          AppLocalizations.of(context)!.popularPlaceCaption),
      PopularPlaceInfo(
          "assets/images/SAN-BAY-DA-NANG-1024x494.jpg",
          AppLocalizations.of(context)!.sanBayDaNang,
          AppLocalizations.of(context)!.popularPlaceCaption),
      PopularPlaceInfo(
          "assets/images/da-nang-02-1024x534.jpg",
          AppLocalizations.of(context)!.trungTamDaNang,
          AppLocalizations.of(context)!.popularPlaceCaption),
      PopularPlaceInfo(
          "assets/images/BA-NA-1024x523.jpg",
          AppLocalizations.of(context)!.baNaHill,
          AppLocalizations.of(context)!.popularPlaceCaption),
      PopularPlaceInfo(
          "assets/images/SAN-BAY-DA-NANG-1024x494.jpg",
          AppLocalizations.of(context)!.sanBayDaNang,
          AppLocalizations.of(context)!.popularPlaceCaption),
      PopularPlaceInfo(
          "assets/images/da-nang-02-1024x534.jpg",
          AppLocalizations.of(context)!.trungTamDaNang,
          AppLocalizations.of(context)!.popularPlaceCaption)
    ];
  }

  List<PopularPlaceInfo> fetchPopularPlacesItems(BuildContext context) {
    return [
      PopularPlaceInfo(
          "assets/images/BA-NA-1024x523.jpg",
          AppLocalizations.of(context)!.baNaHill,
          AppLocalizations.of(context)!.popularPlaceCaption),
      PopularPlaceInfo(
          "assets/images/SAN-BAY-DA-NANG-1024x494.jpg",
          AppLocalizations.of(context)!.sanBayDaNang,
          AppLocalizations.of(context)!.popularPlaceCaption),
      PopularPlaceInfo(
          "assets/images/da-nang-02-1024x534.jpg",
          AppLocalizations.of(context)!.trungTamDaNang,
          AppLocalizations.of(context)!.popularPlaceCaption),
      PopularPlaceInfo(
          "assets/images/BA-NA-1024x523.jpg",
          AppLocalizations.of(context)!.baNaHill,
          AppLocalizations.of(context)!.popularPlaceCaption),
      PopularPlaceInfo(
          "assets/images/SAN-BAY-DA-NANG-1024x494.jpg",
          AppLocalizations.of(context)!.sanBayDaNang,
          AppLocalizations.of(context)!.popularPlaceCaption),
      PopularPlaceInfo(
          "assets/images/da-nang-02-1024x534.jpg",
          AppLocalizations.of(context)!.trungTamDaNang,
          AppLocalizations.of(context)!.popularPlaceCaption)
    ];
  }
}
