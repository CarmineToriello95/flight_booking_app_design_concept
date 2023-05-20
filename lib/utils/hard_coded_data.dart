import 'package:emirates_airlines_concept_ui/models/models.dart';
import 'package:emirates_airlines_concept_ui/widgets/days_calendar_widget.dart';

class Utils {
  static late final List<FlightData> _myFlightsList;
  static late final List<FlightData> _availableFlights;

  static List<FlightData> get myFlightsData => _myFlightsList;
  static List<FlightData> get availableFlights => _availableFlights;

  static generateMyFlights() => _myFlightsList = _generateFlightsData(
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

  static generateAvailableFlights() {
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
}
