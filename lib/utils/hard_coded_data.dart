import 'package:emirates_airlines_concept_ui/models/flight_data.dart';
import 'package:emirates_airlines_concept_ui/sub_pages/route_selection_page.dart';
import 'package:emirates_airlines_concept_ui/widgets/custom_option_selector.dart';
import 'package:emirates_airlines_concept_ui/widgets/days_calendar_widget.dart';
import 'package:flutter/material.dart';

import 'r.dart';

class HardCodedData {
  static late final List<FlightData> _myFlightsList;
  static late final List<FlightData> _availableFlights;
  static late final List<TextFieldData> _loginPageFieldsData;
  static late final List<TextFieldData> _routePageFieldsData;
  static late final List<CustomOptionSelectorData> _routePageRouteOptions;
  static late final List<CustomOptionSelectorData> _checkoutPagePaymentOptions;

  static List<FlightData> get myFlightsData => _myFlightsList;
  static List<FlightData> get availableFlights => _availableFlights;
  static List<TextFieldData> get loginPageFieldsData => _loginPageFieldsData;
  static List<TextFieldData> get routePageFieldsData => _routePageFieldsData;
  static List<CustomOptionSelectorData> get routePageRouteOptions =>
      _routePageRouteOptions;
  static List<CustomOptionSelectorData> get checkoutPagePaymentOptions =>
      _checkoutPagePaymentOptions;

  static generateHardCodedData() {
    _generateMyFlights();
    _generateLoginPageFieldsData();
    _generateAvailableFlights();
    _generateRoutePageFieldsData();
    _generateRoutePageRouteOptions();
    _generateCheckoutPagePaymentOptions();
  }

  static _generateMyFlights() => _myFlightsList = _generateFlightsData(
        DateTime.now().subtract(
          const Duration(days: 10),
        ),
      );

  static List<FlightData> _generateFlightsData(DateTime date) => List.generate(
        5,
        (index) => FlightData(
          departureShort: "DBC",
          departure: "Dabaca",
          date: "${daysMap[date.weekday]} ${date.day}",
          destinationShort: "ADY",
          destination: "Almedy",
          flightNumber: "KB7$index",
          duration: "1h 35m",
          time: "8:35 AM",
        ),
      );

  static _generateAvailableFlights() {
    final currentDate = DateTime.now();
    _availableFlights = List.generate(
      5,
      (index) => FlightData(
        departureShort: "DBC",
        departure: "Dabaca",
        date: "${daysMap[currentDate.weekday]} ${currentDate.day}",
        destinationShort: "ADY",
        destination: "Almedy",
        flightNumber: "KB7$index",
        duration: "1h 35m",
        time: "8:35 AM",
      ),
    );
  }

  static _generateLoginPageFieldsData() => _loginPageFieldsData = [
        TextFieldData(
          Icon(
            Icons.email,
            color: R.secondaryColor,
          ),
          "E-MAIL",
          TextEditingController(),
          "hello@world.io",
        ),
        TextFieldData(
          Icon(
            Icons.password,
            color: R.secondaryColor,
          ),
          "PASSWORD",
          TextEditingController(),
          "random123",
        ),
      ];

  static _generateRoutePageFieldsData() => _routePageFieldsData = [
        TextFieldData(
          Icon(
            Icons.flight_takeoff,
            color: R.secondaryColor,
          ),
          "FROM",
          TextEditingController(),
          "Dabaca",
        ),
        TextFieldData(
          Icon(
            Icons.flight_land,
            color: R.secondaryColor,
          ),
          "TO",
          TextEditingController(),
          "Almedy",
        ),
        TextFieldData(
          Icon(
            Icons.calendar_month,
            color: R.secondaryColor,
          ),
          "DATE",
          TextEditingController(),
          "May 19",
        ),
        TextFieldData(
          Icon(
            Icons.people,
            color: R.secondaryColor,
          ),
          "TRAVELER",
          TextEditingController(),
          "2",
        ),
        TextFieldData(
          Icon(
            Icons.flight_class,
            color: R.secondaryColor,
          ),
          "CLASS",
          TextEditingController(),
          "Economy",
        ),
      ];

  static _generateRoutePageRouteOptions() => _routePageRouteOptions = [
        CustomOptionSelectorData(
          text: "One way",
          id: "0",
          leftBorder: false,
          topBorder: false,
        ),
        CustomOptionSelectorData(
          text: "Roundtrip",
          id: "1",
          topBorder: false,
        ),
        CustomOptionSelectorData(
          text: "Multiple",
          id: "2",
          topBorder: false,
          rightBorder: false,
        )
      ];

  static _generateCheckoutPagePaymentOptions() =>
      _checkoutPagePaymentOptions = [
        CustomOptionSelectorData(
          text: "iPay",
          id: "0",
          leftBorder: false,
          topBorder: false,
        ),
        CustomOptionSelectorData(
          text: "PayPal",
          id: "1",
          topBorder: false,
        ),
        CustomOptionSelectorData(
          text: "Wallet",
          id: "2",
          topBorder: false,
          rightBorder: false,
        )
      ];
}
