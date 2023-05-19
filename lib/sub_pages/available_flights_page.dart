import 'package:emirates_airlines_concept_ui/resources/r.dart';
import 'package:flutter/material.dart';

import '../widgets/days_calendar_widget.dart';
import '../widgets/fading_item_list/fading_item_list.dart';
import '../widgets/fading_item_list/fading_item_list_controller.dart';
import '../widgets/flights_list_item_widget.dart';

List<FlightData> flightsData = List.generate(
  5,
  (index) => FlightData(
    "DBC",
    "Dabaca",
    "MAY 19",
    "ADY",
    "Almedy",
    "KB7$index",
    "1h 35m",
    "8:35 AM",
  ),
);

class AvailableFlightsPage extends StatefulWidget {
  final Function(bool)? isSelectionCompleted;
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
          backgroundColor: flightsData[itemIndex].flightNumber == flightNumber
              ? R.tertiaryColor.withOpacity(0.5)
              : R.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            side: BorderSide(color: R.tertiaryColor),
          ),
        ),
        onPressed: () {
          _selectedFlight.value = flightsData[itemIndex].flightNumber;
          widget.isSelectionCompleted?.call(true);
        },
        child: FlightsListItemWidget.withPrice(
          flightData: flightsData[itemIndex],
          ticketPrice: 170.00,
        ),
      );
}
