import 'package:flight_booking_concept_ui/models/flight_data.dart';
import 'package:flight_booking_concept_ui/utils/r.dart';
import 'package:flutter/material.dart';

class FlightsListItemWidget extends StatelessWidget {
  final FlightData flightData;
  final bool withPrice;
  final double ticketPrice;

  const FlightsListItemWidget({
    Key? key,
    required this.flightData,
    this.ticketPrice = 0.0,
  })  : withPrice = false,
        super(key: key);

  const FlightsListItemWidget.withPrice({
    Key? key,
    required this.flightData,
    required this.ticketPrice,
  })  : withPrice = true,
        super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.only(
          left: withPrice ? 16.0 : 32.0,
          top: 32.0,
          right: withPrice ? 16.0 : 32.0,
          bottom: withPrice ? 16.0 : 0.0,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: _buildLeftColumn(),
                ),
                Expanded(
                  child: _buildMiddlePart(),
                ),
                Expanded(
                  child: _buildRightColumn(),
                ),
              ],
            ),
            SizedBox(
              height: withPrice ? 24.0 : 32.0,
            ),
            Divider(
              color: R.secondaryColor,
            ),
            if (withPrice) const SizedBox(height: 6.0),
            if (withPrice) _buildPriceArea(),
          ],
        ),
      );

  Widget _buildLeftColumn() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            flightData.departureShort,
            style: TextStyle(color: R.secondaryColor, fontSize: 32.0),
          ),
          const SizedBox(
            height: 6.0,
          ),
          Text(
            flightData.departure,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 12.0,
            ),
          ),
          const SizedBox(
            height: 24.0,
          ),
          Text(
            "DATE",
            style: TextStyle(color: R.tertiaryColor),
          ),
          const SizedBox(
            height: 6.0,
          ),
          Text(
            "${flightData.date} ${flightData.time}",
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 12.0,
            ),
          ),
        ],
      );

  Widget _buildRightColumn() => Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            flightData.destinationShort,
            style: TextStyle(color: R.secondaryColor, fontSize: 32.0),
          ),
          const SizedBox(
            height: 6.0,
          ),
          Text(
            flightData.destination,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 12.0,
            ),
          ),
          const SizedBox(
            height: 24.0,
          ),
          Text(
            "FLIGHT NO",
            style: TextStyle(color: R.tertiaryColor),
          ),
          const SizedBox(
            height: 6.0,
          ),
          Text(
            flightData.flightNumber,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 12.0,
            ),
          ),
        ],
      );

  Widget _buildMiddlePart() => Column(
        children: [
          Icon(
            Icons.flight_takeoff,
            color: R.secondaryColor,
          ),
          const SizedBox(
            height: 6.0,
          ),
          Text(
            flightData.duration,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      );

  Widget _buildPriceArea() => Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.apple,
            color: R.secondaryColor,
          ),
          RichText(
            text: TextSpan(
              children: [
                const TextSpan(
                  text: "Ticket Price  ",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                TextSpan(
                  text: "\$ ${ticketPrice.toStringAsFixed(2)}",
                  style: TextStyle(
                    color: R.secondaryColor,
                    fontSize: 24.0,
                  ),
                ),
              ],
            ),
          )
        ],
      );
}
