import 'package:explore/models/car_info.dart';
import 'package:explore/widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FloatingQuickAccessBar extends StatefulWidget {
  const FloatingQuickAccessBar({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  _FloatingQuickAccessBarState createState() => _FloatingQuickAccessBarState();
}

class _FloatingQuickAccessBarState extends State<FloatingQuickAccessBar> {
  late List _isHovering = [];
  List<Widget> rowElements = [];

  List<CarInfo> fetchCarItems(BuildContext context) {
    return [
      CarInfo(
          AppLocalizations.of(context)!.car4SeatSmall, Icons.directions_car),
      CarInfo(
          AppLocalizations.of(context)!.car4SeatMedium, Icons.directions_car),
      CarInfo(AppLocalizations.of(context)!.car7Seat, Icons.directions_car),
      CarInfo(AppLocalizations.of(context)!.car16Seat, Icons.directions_car),
      CarInfo(AppLocalizations.of(context)!.car29Seat, Icons.directions_car),
      CarInfo(AppLocalizations.of(context)!.car45Seat, Icons.directions_car),
    ];
  }

  List<Widget> generateRowElements(List<CarInfo> carItems) {
    rowElements.clear();
    for (int i = 0; i < carItems.length; i++) {
      Widget elementTile = InkWell(
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        onHover: (value) {
          setState(() {
            value ? _isHovering[i] = true : _isHovering[i] = false;
          });
        },
        onTap: () {},
        child: Text(
          carItems[i].title,
          style: TextStyle(
            color: _isHovering[i] ? Colors.blueGrey[900] : Colors.blueGrey,
          ),
        ),
      );
      Widget spacer = SizedBox(
        height: widget.screenSize.height / 20,
        child: VerticalDivider(
          width: 1,
          color: Colors.blueGrey[100],
          thickness: 1,
        ),
      );
      rowElements.add(elementTile);
      if (i < carItems.length - 1) {
        rowElements.add(spacer);
      }
    }

    return rowElements;
  }

  @override
  Widget build(BuildContext context) {
    var carItems = fetchCarItems(context);
    double elevation = carItems.length.toDouble();
    _isHovering = List.filled(carItems.length, false).toList();
    return Center(
      heightFactor: 1,
      child: Padding(
        padding: EdgeInsets.only(
          top: widget.screenSize.height * 0.40,
          left: ResponsiveWidget.isSmallScreen(context)
              ? widget.screenSize.width / 12
              : widget.screenSize.width / 5,
          right: ResponsiveWidget.isSmallScreen(context)
              ? widget.screenSize.width / 12
              : widget.screenSize.width / 5,
        ),
        child: ResponsiveWidget.isSmallScreen(context)
            ? Column(
                children: [
                  ...Iterable<int>.generate(carItems.length).map(
                    (int pageIndex) => Padding(
                      padding:
                          EdgeInsets.only(top: widget.screenSize.height / 80),
                      child: Card(
                        elevation: elevation,
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: widget.screenSize.height / 45,
                              bottom: widget.screenSize.height / 45,
                              left: widget.screenSize.width / 20),
                          child: Row(
                            children: [
                              Icon(
                                carItems[pageIndex].iconData,
                                color: Colors.blueGrey,
                              ),
                              SizedBox(width: widget.screenSize.width / 20),
                              InkWell(
                                splashColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                onTap: () {},
                                child: Text(
                                  carItems[pageIndex].title,
                                  style: TextStyle(
                                      color: Colors.blueGrey, fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : Card(
                elevation: 5,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: widget.screenSize.height / 50,
                    bottom: widget.screenSize.height / 50,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: generateRowElements(carItems),
                  ),
                ),
              ),
      ),
    );
  }
}
