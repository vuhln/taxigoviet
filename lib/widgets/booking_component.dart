import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:explore/shared/constant.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BookingComponent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BookingComponentState();
  }
}

class BookingComponentState extends State<BookingComponent> {
  late String _pickupLocation;
  late String _destination;
  late String _service;
  late String _vehicle;
  late String _phone;
  late DateTime _departureDate;
  late DateTime _returnDate;

  Widget _buildPhone() {
    String fieldName = AppLocalizations.of(context)!.phone;
    return TextFormField(
      decoration: InputDecoration(labelText: fieldName),
      validator: (value) {
        if (value!.isEmpty) {
          return fieldName + " is Required";
        }
      },
      onSaved: (value) => {this._pickupLocation = value!},
    );
  }

  Widget _buildPickupPoint() {
    String fieldName = AppLocalizations.of(context)!.pickupLocation;
    return TextFormField(
      decoration: InputDecoration(labelText: fieldName),
      validator: (value) {
        if (value!.isEmpty) {
          return fieldName + " is Required";
        }
      },
      onSaved: (value) => {this._pickupLocation = value!},
    );
  }

  Widget _buildDestination() {
    String fieldName = AppLocalizations.of(context)!.destination;
    return TextFormField(
      decoration: InputDecoration(labelText: fieldName),
      validator: (value) {
        if (value!.isEmpty) {
          return fieldName + " is Required";
        }
      },
    );
  }

  Widget _buildService() {
    String fieldName = AppLocalizations.of(context)!.service;
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(labelText: fieldName),
      value: _service,
      validator: (value) {
        if (value!.isEmpty) {
          return fieldName + " is Required";
        }
      },
      onSaved: (value) => {
        setState(() {
          _service = value!;
        })
      },
      onChanged: (value) => {
        setState(() {
          _service = value!;
        })
      },
      items: [
        AppLocalizations.of(context)!.oneWayService,
        AppLocalizations.of(context)!.roundTripService,
        AppLocalizations.of(context)!.roundTripExtra
      ]
          .map((label) => DropdownMenuItem(
                child: Text(label.toString()),
                value: label,
              ))
          .toList(),
    );
  }

  Widget _buildVehicle() {
    String fieldName = AppLocalizations.of(context)!.vehicle;
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(labelText: fieldName),
      value: _vehicle,
      validator: (value) {
        if (value!.isEmpty) {
          return fieldName + " is Required";
        }
      },
      onSaved: (value) => {
        setState(() {
          _vehicle = value!;
        })
      },
      onChanged: (value) => {
        setState(() {
          _vehicle = value!;
        })
      },
      items: [
        AppLocalizations.of(context)!.car4SeatSmall,
        AppLocalizations.of(context)!.car4SeatMedium,
        AppLocalizations.of(context)!.car7Seat,
        AppLocalizations.of(context)!.car16Seat,
        AppLocalizations.of(context)!.car29Seat,
        AppLocalizations.of(context)!.car45Seat
      ]
          .map((label) => DropdownMenuItem(
                child: Text(label.toString()),
                value: label,
              ))
          .toList(),
    );
  }

  Widget _createDeparture() {
    String fieldName = AppLocalizations.of(context)!.departureDate;
    return DateTimeField(
      format: DateFormat(kDateTimeFormat),
      onShowPicker: (context, currentValue) async {
        final time = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
        );
        return DateTimeField.convert(time);
      },
      onChanged: (value) => {
        setState(() {
          _departureDate = value!;
        })
      },
    );
  }

  Widget _createReturn() {
    String fieldName = AppLocalizations.of(context)!.returnDate;
    return DateTimeField(
      format: DateFormat(kDateTimeFormat),
      onShowPicker: (context, currentValue) async {
        final time = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
        );
        return DateTimeField.convert(time);
      },
      onChanged: (value) => {
        setState(() {
          _returnDate = value!;
        })
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    _service = AppLocalizations.of(context)!.oneWayService;
    _vehicle = AppLocalizations.of(context)!.car4SeatSmall;
    var raisedButton = MaterialButton(
      color: Theme.of(context).accentColor,
      minWidth: double.maxFinite, // set minWidth to maxFinite
      child: Text(AppLocalizations.of(context)!.bookingCar,
          style: Theme.of(context).textTheme.button),
      onPressed: () => {},
    );
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.bookingCar),
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Form(
              child: ListView(children: <Widget>[
            _buildPhone(),
            _buildPickupPoint(),
            _buildDestination(),
            _buildService(),
            _buildVehicle(),
            _createDeparture(),
            _createReturn(),
            raisedButton
          ])),
        ));
  }
}
