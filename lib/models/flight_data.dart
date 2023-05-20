class FlightData {
  final String departureShort;
  final String departure;
  final String date;
  final String destinationShort;
  final String destination;
  final String flightNumber;
  final String duration;
  final String time;
  final double? price;
  final String? seat;

  FlightData({
    required this.departureShort,
    required this.departure,
    required this.date,
    required this.destinationShort,
    required this.destination,
    required this.flightNumber,
    required this.duration,
    required this.time,
    this.price,
    this.seat,
  });

  FlightData copyWith({
    String? departureShort,
    String? departure,
    String? date,
    String? destinationShort,
    String? destination,
    String? flightNumber,
    String? duration,
    String? time,
    double? price,
    String? seat,
  }) =>
      FlightData(
        departureShort: departureShort ?? this.departureShort,
        departure: departure ?? this.departure,
        date: date ?? this.date,
        destinationShort: destinationShort ?? this.destinationShort,
        destination: destination ?? this.destination,
        flightNumber: flightNumber ?? this.flightNumber,
        duration: duration ?? this.duration,
        time: time ?? this.time,
        price: price ?? this.price,
        seat: seat ?? this.seat,
      );
}
