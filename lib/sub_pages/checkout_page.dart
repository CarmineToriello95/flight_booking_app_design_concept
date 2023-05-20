import 'package:emirates_airlines_concept_ui/resources/r.dart';
import 'package:flutter/material.dart';

import '../models/flight_data.dart';
import '../widgets/custom_option_selector.dart';

final List<CustomOptionSelectorData> paymentOptions = [
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

class CheckoutPage extends StatelessWidget {
  final Function(bool)? isSelectionCompleted;
  final FlightData flightData;
  const CheckoutPage({
    super.key,
    required this.flightData,
    this.isSelectionCompleted,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _buildFirstColumn(),
                _buildSecondColumn(),
                _buildThirdColumn(),
              ],
            ),
            const SizedBox(
              height: 32.0,
            ),
            Divider(
              color: R.secondaryColor,
            ),
            const SizedBox(
              height: 16.0,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                "\$ ${flightData.price!.toStringAsFixed(2)}",
                style: TextStyle(
                  color: R.secondaryColor,
                  fontSize: 32.0,
                ),
              ),
            ),
            const SizedBox(
              height: 24.0,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Payment via",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ),
            const SizedBox(
              height: 24.0,
            ),
            CustomOptionSelector(
              options: paymentOptions,
              onOptionClicked: (_) => isSelectionCompleted?.call(true),
            ),
          ],
        ),
      );

  Widget _buildFirstColumn() {
    final firstColumn = [
      Text(
        flightData.departureShort,
        style: TextStyle(
          color: R.secondaryColor,
          fontSize: 32,
        ),
      ),
      SizedBox(
        height: 8.0,
      ),
      Text(
        flightData.departure,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      )
    ];
    final secondColumn = [
      Text(
        "FLIGHT DATE",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      SizedBox(
        height: 8.0,
      ),
      Text(
        flightData.date,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      )
    ];
    final thirdColumn = [
      Text(
        "BOARDING TIME",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      SizedBox(
        height: 8.0,
      ),
      Text(
        flightData.time,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      )
    ];
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...firstColumn,
        SizedBox(
          height: 40.0,
        ),
        ...secondColumn,
        SizedBox(height: 32.0),
        ...thirdColumn,
      ],
    );
  }

  Widget _buildSecondColumn() {
    final firstColumn = [
      Icon(
        Icons.flight_takeoff,
        color: R.secondaryColor,
        size: 32.0,
      ),
      SizedBox(
        height: 8.0,
      ),
      Text(
        flightData.duration,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    ];
    final secondColumn = [
      Text(
        "GATE",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      SizedBox(
        height: 8.0,
      ),
      Text(
        "B2",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      )
    ];
    final thirdColumn = [
      Text(
        "SEAT",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      SizedBox(
        height: 8.0,
      ),
      Text(
        flightData.seat!,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      )
    ];
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ...firstColumn,
        SizedBox(
          height: 40.0,
        ),
        ...secondColumn,
        SizedBox(height: 32.0),
        ...thirdColumn,
      ],
    );
  }

  Widget _buildThirdColumn() {
    final firstColumn = [
      Text(
        flightData.destinationShort,
        style: TextStyle(
          color: R.secondaryColor,
          fontSize: 32,
        ),
      ),
      SizedBox(
        height: 8.0,
      ),
      Text(
        flightData.destination,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    ];
    final secondColumn = [
      Text(
        "FLIGHT NO",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      SizedBox(
        height: 8.0,
      ),
      Text(
        flightData.flightNumber,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      )
    ];
    final thirdColumn = [
      Text(
        "CLASS",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      SizedBox(
        height: 8.0,
      ),
      Text(
        "Economy",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      )
    ];
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        ...firstColumn,
        SizedBox(
          height: 40.0,
        ),
        ...secondColumn,
        SizedBox(height: 32.0),
        ...thirdColumn,
      ],
    );
  }
}
