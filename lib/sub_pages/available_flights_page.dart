import 'package:flight_booking_concept_ui/models/flight_data.dart';
import 'package:flight_booking_concept_ui/utils/r.dart';
import 'package:flight_booking_concept_ui/utils/hard_coded_data.dart';
import 'package:flutter/material.dart';

import '../widgets/days_calendar_widget.dart';
import '../widgets/fading_item_list/fading_item_list.dart';
import '../widgets/fading_item_list/fading_item_list_controller.dart';
import '../widgets/flights_list_item_widget.dart';

class AvailableFlightsPage extends StatefulWidget {
  final Function(bool, FlightData)? isSelectionCompleted;
  const AvailableFlightsPage({
    super.key,
    this.isSelectionCompleted,
  });

  @override
  State<AvailableFlightsPage> createState() => _AvailableFlightsPageState();
}

class _AvailableFlightsPageState extends State<AvailableFlightsPage> {
  late final FadingItemListController _fadingItemListController;
  late ValueNotifier<String> _selectedFlight;

  @override
  void initState() {
    super.initState();

    _fadingItemListController = FadingItemListController();
    _selectedFlight = ValueNotifier("");
  }

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DaysCalendarWidget(onDayPressed: (_) {
            _fadingItemListController.showItems();
          }),
          const SizedBox(
            height: 24.0,
          ),
          Expanded(
            child: FadingItemList(
              fadingItemListController: _fadingItemListController,
              listItems: List.generate(
                5,
                (index) => Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ValueListenableBuilder<String>(
                    valueListenable: _selectedFlight,
                    builder: (_, value, __) => _buildFlightCard(
                      index,
                      value,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      );

  Widget _buildFlightCard(int itemIndex, String flightNumber) => ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor:
              HardCodedData.availableFlights[itemIndex].flightNumber ==
                      flightNumber
                  ? R.tertiaryColor.withOpacity(0.5)
                  : R.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            side: BorderSide(color: R.tertiaryColor),
          ),
        ),
        onPressed: () {
          _selectedFlight.value =
              HardCodedData.availableFlights[itemIndex].flightNumber;
          widget.isSelectionCompleted?.call(
            true,
            HardCodedData.availableFlights[itemIndex].copyWith(
              price: 170.00,
            ),
          );
        },
        child: FlightsListItemWidget.withPrice(
          flightData: HardCodedData.availableFlights[itemIndex],
          ticketPrice: 170.00,
        ),
      );
}
